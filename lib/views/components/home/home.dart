import 'package:flutter/material.dart';
import 'package:vladrec_app/models/demo_common.dart';

import '../../about_us_view.dart';
import '../../cameras_view.dart';
import '../../demo_barrier_view.dart';

class Home extends StatefulWidget {
  final DemoCommon demoCommon;

  const Home({Key? key, required this.demoCommon}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: <Widget>[
        CamerasView(cameras: widget.demoCommon.cameras),
        DemoBarrierView(demoBarrier: widget.demoCommon.demoBarrier),
        const AboutUsView(),
      ].elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.location_city),
            label: 'Город Online',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.airline_seat_legroom_normal_outlined),
            label: 'Демо',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.voice_chat), label: 'О нас')
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.red,
        onTap: _onItemTapped,
      ),
    );
  }
}
