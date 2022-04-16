import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutUsView extends StatelessWidget {
  const AboutUsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(7),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 5),
              child: Text(
                  'Компания VLADREC создана в 2017 году. Мы создаём системы безопасности для бизнеса и жителей многоквартирных домов по всему Приморскому краю.'),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 5),
              child: Text(
                  'VLADREC занимается установкой систем видеонаблюдения, шлагбаумов, домофонии. Для удобства клиента была разработана программа где все сервисы собраны в одно приложение.'),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 1),
              child: Text('В личном кабинете у вас будет возможность:'),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 1),
              child: Text('- Смотреть камеры в реальном времени'),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 1),
              child: Text('- Управлять автоматикой (ворота, шлагбаумы)'),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 1),
              child: Text('- Принимать вызов и открывать домофоную дверь'),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 1),
              child: Text('- Город online - просмотр камер с дорог города'),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 1),
                    child: RichText(
                      text: TextSpan(
                          style: const TextStyle(
                            color: Colors.black,
                          ),
                          text: 'Тел. продаж: ',
                          children: [
                            TextSpan(
                                text: '+7(423)200-44-00',
                                style: const TextStyle(
                                  color: Colors.blue,
                                  decoration: TextDecoration.underline,
                                ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    launch('tel://+74232004400');
                                  })
                          ]),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 1),
                    child: RichText(
                      text: TextSpan(
                          style: const TextStyle(
                            color: Colors.black,
                          ),
                          text: 'Тел. тех. поддержка шлагбаумы: ',
                          children: [
                            TextSpan(
                                text: '+7(994)007-79-41',
                                style: const TextStyle(
                                  color: Colors.blue,
                                  decoration: TextDecoration.underline,
                                ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    launch('tel://+79940077941');
                                  })
                          ]),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 1),
                    child: RichText(
                      text: TextSpan(
                          style: const TextStyle(
                            color: Colors.black,
                          ),
                          text: 'Тел. тех. поддержка видеонаблюдения: ',
                          children: [
                            TextSpan(
                                text: '+7(994)008-34-98',
                                style: const TextStyle(
                                  color: Colors.blue,
                                  decoration: TextDecoration.underline,
                                ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    launch('tel://+79940083498');
                                  })
                          ]),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 1),
                    child: RichText(
                      text: TextSpan(
                          style: const TextStyle(
                            color: Colors.black,
                          ),
                          text: 'Пожелания и вопросы по приложению: ',
                          children: [
                            TextSpan(
                                text: 'artemshchurev@gmail.com',
                                style: const TextStyle(
                                  color: Colors.blue,
                                  decoration: TextDecoration.underline,
                                ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    launch('mailto:artemshchurev@gmail.com?subject=Vladrec app');
                                  })
                          ]),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Align(
                      alignment: Alignment.center,
                      child: Image.asset(
                        'assets/components/about_us/vladrec.png',
                        width: 250,
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
