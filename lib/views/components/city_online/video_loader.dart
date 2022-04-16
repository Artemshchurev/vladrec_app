import 'dart:async';

import 'package:flutter/material.dart';

class VideoLoader extends StatefulWidget {
  final String previewSrc;

  const VideoLoader({Key? key, required this.previewSrc}) : super(key: key);

  @override
  _VideoLoaderState createState() => _VideoLoaderState();
}

class _VideoLoaderState extends State<VideoLoader> {
  int _delay = 5;

  @override
  void initState() {
    super.initState();
    _startCountDown();
  }

  void _startCountDown() {
    Timer.periodic(
      const Duration(seconds: 1),
      (Timer timer) {
        if (timer.tick >= 4) {
          setState(() {
            _delay = 5;
          });
          timer.cancel();
        } else {
          setState(() {
            _delay--;
          });
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return _delay == 5
        ? Container()
        : Stack(
            alignment: Alignment.center,
            children: [
              AspectRatio(
                  aspectRatio: 16 / 9, child: Image.network(widget.previewSrc)),
              const CircularProgressIndicator(
                color: Colors.red,
              )
            ],
          );
  }
}
