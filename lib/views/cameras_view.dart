import 'dart:async';

import 'package:flutter/material.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:vladrec_app/models/camera.dart';
import 'package:vladrec_app/views/components/city_map.dart';
import 'package:vladrec_app/views/components/city_online/camera_card.dart';

class CamerasView extends StatefulWidget {
  final List<Camera> cameras;

  const CamerasView({Key? key, required this.cameras}) : super(key: key);

  @override
  _CamerasViewState createState() => _CamerasViewState();
}

class _CamerasViewState extends State<CamerasView> {
  final ItemScrollController _itemScrollController = ItemScrollController();
  int? _selectedCameraId;

  @override
  void initState() {
    super.initState();
  }

  Future<void> _resetSelectedCamera() async {
    setState(() {
      _selectedCameraId = null;
    });
  }

  void _selectCamera(Camera camera, [int? index]) {
    if (_selectedCameraId != camera.id) {
      setState(() {
        _selectedCameraId = camera.id;
      });
      if (index != null) {
        _itemScrollController.scrollTo(
            index: index, duration: const Duration(milliseconds: 500));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ScrollablePositionedList.builder(
        itemScrollController: _itemScrollController,
        itemCount: widget.cameras.length + 1,
        itemBuilder: (BuildContext context, int i) {
          if (i == 0) {
            return CityMap(
              selectCamera: _selectCamera,
              cameras: widget.cameras,
            );
          }

          return CameraCard(
              camera: widget.cameras[i - 1],
              selectedCameraId: _selectedCameraId,
              selectCamera: _selectCamera);
        },
      ),
      floatingActionButton: _selectedCameraId != null
          ? FloatingActionButton(
              onPressed: _resetSelectedCamera,
              child: const Icon(
                Icons.close,
                size: 35,
              ),
              backgroundColor: Colors.red,
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(30))),
            )
          : null,
    );
  }
}
