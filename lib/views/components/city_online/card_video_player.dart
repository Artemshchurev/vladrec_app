import 'package:flutter/material.dart';
import 'package:flutter_vlc_player/flutter_vlc_player.dart';
import 'package:vladrec_app/models/camera.dart';
import 'package:vladrec_app/views/components/city_online/video_loader.dart';

class CardVideoPlayer extends StatefulWidget {
  final Camera camera;
  const CardVideoPlayer({Key? key, required this.camera }) : super(key: key);

  @override
  State<CardVideoPlayer> createState() => _CardVideoPlayerState();
}

class _CardVideoPlayerState extends State<CardVideoPlayer> {
  late VlcPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VlcPlayerController.network(
      widget.camera.link,
      hwAcc: HwAcc.full,
      autoPlay: true,
      options: VlcPlayerOptions(
        advanced: VlcAdvancedOptions([
          VlcAdvancedOptions.networkCaching(2000),
        ]),
        rtp: VlcRtpOptions([
          VlcRtpOptions.rtpOverRtsp(true),
        ]),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        VlcPlayer(
          controller: _controller,
          aspectRatio: 16 / 9,
          placeholder: const Center(
              child: CircularProgressIndicator(
                color: Colors.red,
              )),
        ),
        VideoLoader(previewSrc: widget.camera.previewImage),
      ],
    );
  }
}
