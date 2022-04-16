import 'package:flutter/cupertino.dart';

class Camera {
  int id;
  String name;
  String link;
  String previewImage;
  double lat;
  double lng;
  String? withSupportOf;
  String? supportLink;

  Camera(
      {required this.id,
      required this.name,
      required this.link,
      required this.previewImage,
      required this.lat,
      required this.lng,
      required this.withSupportOf,
      required this.supportLink});

  factory Camera.fromJson(Map<String, dynamic> json) {
    return Camera(
      id: json['id'],
      name: json['name'],
      link: json['link'],
      previewImage: json['link'].replaceAll('mpegts', 'preview.jpg'),
      lat: json['lat'],
      lng: json['lng'],
      withSupportOf: json['with_support_of'],
      supportLink: json['support_link'],
    );
  }
}
