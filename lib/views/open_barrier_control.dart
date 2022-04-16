import 'dart:async';

import 'package:flutter/material.dart';
import 'package:vladrec_app/api/public_api.dart';


class OpenBarrierControl extends StatefulWidget {
  const OpenBarrierControl({Key? key}) : super(key: key);

  @override
  _OpenBarrierControlState createState() => _OpenBarrierControlState();
}

class _OpenBarrierControlState extends State<OpenBarrierControl> {
  int _delay = 8;

  void callOpenBarrier() async {
    openDemoBarrier();
    setState(() {
      _delay--;
    });
    Timer.periodic(const Duration(seconds: 1), (Timer timer) {
        if (timer.tick >= 7) {
          setState(() {
            _delay = 8;
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
    return Padding(
      padding: const EdgeInsets.all(5),
      child: SizedBox(
        width: 170,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: Colors.red,
          ),
          onPressed: _delay == 8 ? callOpenBarrier : null,
          child: Text(_delay == 8 ? 'Открыть/закрыть' : _delay.toString()),
        ),
      ),
    );
  }
}
