class DemoBarrier {
  int id;
  String cameraLink;
  String previewSrc;

  DemoBarrier(
      {required this.id,
        required this.cameraLink, required this.previewSrc});

  factory DemoBarrier.fromJson(Map<String, dynamic> json) {
    return DemoBarrier(
      id: json['id'],
      cameraLink: json['camera_link'],
      previewSrc: json['camera_link'].replaceAll('mpegts', 'preview.jpg')
    );
  }
}