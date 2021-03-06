import 'package:flutter/material.dart';
import 'package:flutter_vlc_player/flutter_vlc_player.dart';
import 'package:vladrec_app/models/demo_barrier.dart';
import 'package:vladrec_app/views/components/city_online/video_loader.dart';
import 'package:vladrec_app/views/components/demo_barrier/unoirdered_list.dart';

import 'open_barrier_control.dart';

class DemoBarrierView extends StatefulWidget {
  final DemoBarrier demoBarrier;
  const DemoBarrierView({Key? key, required this.demoBarrier}) : super(key: key);

  @override
  _DemoBarrierViewState createState() => _DemoBarrierViewState();
}

class _DemoBarrierViewState extends State<DemoBarrierView> {
  late VlcPlayerController _videoPlayerController;

  @override
  void initState() {

    super.initState();
    _videoPlayerController = VlcPlayerController.network(
      widget.demoBarrier.cameraLink,
      hwAcc: HwAcc.full,
      autoPlay: true,
      options: VlcPlayerOptions(),
    );
  }

  @override
  void dispose() async {
    super.dispose();
    await _videoPlayerController.stopRendererScanning();
    await _videoPlayerController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                VlcPlayer(
                  controller: _videoPlayerController,
                  aspectRatio: 16 / 9,
                  placeholder: const Center(
                      child: CircularProgressIndicator(
                        color: Colors.red,
                      )),
                ),
                VideoLoader(previewSrc: widget.demoBarrier.previewSrc),
              ],
            ),
            const OpenBarrierControl(),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 7,
                vertical: 5,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                      '???????? ???????????????? ???????????????????? ?????????????????????? ???????????????????????? ?????????????????????? ?????? ???????????????????? ???????????????? ????????????????????, ?????????? ?? ????????????. '
                          '???????????? ???? ???????????? ??????????, ???????????? ???????????? ?????????????????????????????? ?????????? ???????????????????????? ?? ??????????????????, ?????????? ???????????? ???????????????? ?????????? ???????????? ?????????? ?????????????? ???????????????????????????? ???????????????????? ???? ????????????????????.'
                          '?????? ?????????? ?????????? ?? ?????????????????? ?????????????????? ????????????????, ?? ?????????? ???? ???????????????????? ???????????????????? ?????????????????? ????????????.'),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 7),
                    child: Text(
                        '???? ?????????? ?????????? ???? ???????????? ???????????????? - ???????? ?????????????????? ???????????????? ???????????????? ?????????????? ?????????? ??????????????????, ???????????? ?? ??????????! ?? ?????? ???? ?????????????????? ?????????????????????????? ?????????? ???? ???????????????????? ???????????? ????????.'),
                  ),
                  Text('?????????????? ?????????????????? ?? ????????????:'),
                  Padding(
                      padding: EdgeInsets.only(
                        left: 7,
                        top: 7,
                        bottom: 5,
                      ),
                      child: UnorderedList([
                        '???????????????? ?? ?????????????????????????? ???? android ?? iOS',
                        '???? ???????????? ???????????? ?? ???????????????? ?????????????? ???????? ????????????????????, ???????????????? ??????????????????????',
                        '???????????????????? ?????????????????????????? ?????????????????? - ?????????????????????????? ???????????? ?????????????? ?????????????????????????? ?????????????????????????? ??????????????????',
                        '?????????????????? ???????????? ?????????????????????? ?????? ????????????????, ?? ???????? ???????????????????? ?????????????? ?? ??????????????, ???? ?????? ???????????????????? ????????????????',
                        '?????? ?????????? ???????????????? ???????????? ???????????? ???????????????????????????????? ????????',
                        '?????? ?????????? ???????????????? ???????????? "?????????? Online"',
                        '???? ?????????????? ???????????????????? ???????????????? ?? ?????????????????????????? ????????????????????????, ?????????????????????? ???????????????????? ?? ??????????????????????',
                        '???????????? ?? ???????????????? ?????????????????? ?? ???????????? ???????????? ?????????????? ????????',
                      ])),
                  Padding(
                    padding: EdgeInsets.only(bottom: 5),
                    child: Text(
                        '???????????????? ?????????????????????????????? ???????????? ?? ???? ???????????????? ?? ???????? ?????? ?????????? ???????????? ??????????????????!'),
                  )
                ],
              ),
            )
          ],
        ));
  }
}
