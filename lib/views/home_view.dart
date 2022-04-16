import 'package:flutter/material.dart';
import 'package:vladrec_app/api/public_api.dart';
import 'package:vladrec_app/models/demo_common.dart';
import 'package:vladrec_app/views/components/home/home.dart';

class HomeView extends StatefulWidget {
  static String routeName = '/';

  const HomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  Future<DemoCommon> getDemoData() async {
    return await fetchDemoCommon();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: const Text(
            'Vladrec',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ),
        body: FutureBuilder(
          future: getDemoData(),
          builder: (BuildContext context, AsyncSnapshot<DemoCommon> snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
                return const Center(
                  child: Text('NONE'),
                );
              case ConnectionState.active:
              case ConnectionState.waiting:
                return const Center(
                    child: CircularProgressIndicator(
                  color: Colors.red,
                ));
              case ConnectionState.done:
                if (snapshot.hasError) {
                  return const Center(
                      child: Text('Контент временно недоступен'));
                }

                return Home(demoCommon: snapshot.data!);
            }
          },
        ),
      ),
    );
  }
}
