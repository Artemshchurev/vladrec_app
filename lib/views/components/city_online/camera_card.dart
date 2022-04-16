import 'package:flutter/material.dart';
import 'package:vladrec_app/models/camera.dart';
import 'package:url_launcher/url_launcher.dart';

import 'card_video_player.dart';

class CameraCard extends StatefulWidget {
  final Camera camera;
  final int? selectedCameraId;
  final Function selectCamera;

  const CameraCard(
      {Key? key,
      required this.camera,
      required this.selectedCameraId,
      required this.selectCamera})
      : super(key: key);

  @override
  State<CameraCard> createState() => _CameraCardState();
}

class _CameraCardState extends State<CameraCard> {
  _launchURLBrowser(String url) async {
    try {
      await canLaunch(url)
          ? await launch(url,
              forceSafariVC: true, forceWebView: true, enableJavaScript: true)
          : throw Exception('Could not launch $url');
    } on Exception catch (e, s) {}
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 4,
          horizontal: 2,
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                top: 12,
                bottom: 10,
                left: 15,
                right: 15,
              ),
              child: Text(
                widget.camera.name,
                textAlign: TextAlign.center,
                style:
                    const TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
              ),
            ),
            GestureDetector(
              onTap: () {
                widget.selectCamera(widget.camera);
              },
              child: widget.camera.id == widget.selectedCameraId
                  ? CardVideoPlayer(
                      camera: widget.camera,
                    )
                  : Stack(
                      alignment: Alignment.center,
                      children: [
                        AspectRatio(
                          aspectRatio: 16 / 9,
                          child: Image.network(widget.camera.previewImage),
                        ),
                        Positioned(
                            child: Image.asset(
                          'assets/components/camera_card/play.png',
                          width: 40,
                          height: 40,
                        ))
                      ],
                    ),
            ),
            if (widget.camera.withSupportOf != null &&
                widget.camera.supportLink != null)
              Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const Text(
                      'При поддержке',
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                      ),
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.red,
                          ),
                          onPressed: () {
                            _launchURLBrowser(
                                widget.camera.supportLink.toString());
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 5),
                            child: Text(
                              widget.camera.withSupportOf.toString(),
                              style: const TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          )),
                    )
                  ],
                ),
              ),
            const Padding(
              padding: EdgeInsets.only(top: 7),
              child: Divider(thickness: 2),
            ),
          ],
        ));
  }
}
