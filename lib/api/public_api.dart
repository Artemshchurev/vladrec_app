import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:vladrec_app/models/camera.dart';
import 'package:vladrec_app/models/demo_barrier.dart';
import 'package:vladrec_app/models/demo_common.dart';

Future<List<Camera>> fetchCameras() async {
  var response = await http.get(Uri.parse('https://vladrec.info/api/camera'));
  return jsonDecode(response.body)['items']
      .map<Camera>((camera) => Camera.fromJson(camera))
      .toList();
}

Future<DemoBarrier> fetchDemoBarrier() async {
  var response = await http.get(Uri.parse('https://vladrec.info/api/demo-barrier'));
  return DemoBarrier.fromJson(jsonDecode(response.body));
}

Future<DemoCommon> fetchDemoCommon() async {
  var response = await http.get(Uri.parse('https://vladrec.info/api/camera/common'));
  var responseObj = jsonDecode(response.body);
  List<Camera> cameras = responseObj['cameras']
      .map<Camera>((camera) => Camera.fromJson(camera))
      .toList();
  DemoBarrier demoBarrier = DemoBarrier.fromJson(responseObj['demo_barrier']);
  return DemoCommon(cameras: cameras, demoBarrier: demoBarrier);
}

Future<void> openDemoBarrier() async {
  await http.get(Uri.parse('https://vladrec.info/api/demo-barrier/open'));
}
