
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_camera/flutter_camera.dart';
import 'package:video_editing_app/components/colors.dart';

class CameraScreen extends StatefulWidget {
  const CameraScreen({Key? key}) : super(key: key);

  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> with SingleTickerProviderStateMixin {
   late AnimationController _controller;

  @override
  void initState() {
    super.initState();
        _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FlutterCamera(color: bgColor,

    onImageCaptured: (value) {
      final path = value.path;
      print('Your path is $path');
      if (path.contains('.jpg')) {
        showDialog(context: context, builder: (context) {
          return AlertDialog(
            content: Image.file(File(path)),
          );
        });
      }
    },

      onVideoRecorded: (value) {
      final path = value.path;
      print('video directory is $path');
      },
    );
  }
}
