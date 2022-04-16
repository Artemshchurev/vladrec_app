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
                      'Наша компания занимается разработкой программного обеспечения для удаленного открытия шлагбаумов, ворот и дверей. '
                          'Исходя из нашего опыта, многие жители многоквартирных домов сталкиваются с ситуацией, когда жильцы соседних домов делают копии пультов дистанционного управления от шлагбаумов.'
                          'Тем самым смысл в установке шлагбаума теряется, а место на придомовой территории постоянно занято.'),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 7),
                    child: Text(
                        'Мы нашли выход из данной ситуации - наша программа позволит удаленно открыть любые шлагбаумы, ворота и двери! а так же исключить неправомерный въезд на территорию вашего дома.'),
                  ),
                  Text('Давайте поговорим о плюсах:'),
                  Padding(
                      padding: EdgeInsets.only(
                        left: 7,
                        top: 7,
                        bottom: 5,
                      ),
                      child: UnorderedList([
                        'Удобство в использовании на android и iOS',
                        'Вы будете видеть в реальном времени кого запускаете, задержки минимальные',
                        'Статистика использования программы - администратор сможет выявить неправомерное использование программы',
                        'Программу нельзя скопировать или взломать, а если поделиться логином и паролем, то она перестанет работать',
                        'Вам будут доступны камеры вашего многоквартирного дома',
                        'Вам будут доступны камеры "Город Online"',
                        'Вы сможете оперативно сообщать о неисправности оборудования, посредством фотографии и комментария',
                        'Доступ к открытию шлагбаума с любого уголка земного шара',
                      ])),
                  Padding(
                    padding: EdgeInsets.only(bottom: 5),
                    child: Text(
                        'Оставьте предварительную заявку и мы свяжемся с вами как будет готова программа!'),
                  )
                ],
              ),
            )
          ],
        ));
  }
}
