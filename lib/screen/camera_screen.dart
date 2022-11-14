import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_camera/flutter_camera.dart';
import 'package:video_editing_app/components/colors.dart';
import 'package:image_picker/image_picker.dart';
import 'package:gallery_saver/gallery_saver.dart';

class CameraScreen extends StatefulWidget {
  const CameraScreen({Key? key}) : super(key: key);

  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen>
    with SingleTickerProviderStateMixin {
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

  String pictureButtonText = 'Take a Picture';
  String videoButtonText = 'Record Video';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FloatingActionButton.extended(
              backgroundColor: shadowColor,
              onPressed: _takePhoto,
              label: const Text('Take a Photo'),
            ),
            const SizedBox(width: 50),
            FloatingActionButton.extended(
              backgroundColor: shadowColor,
              onPressed: _recordVideo,
              label: const Text('Record a video'),
            ),
          ],
        ),
      ),
    );
  }

  void _takePhoto() async {
    ImagePicker()
        .getImage(source: ImageSource.camera)
        .then((PickedFile? recordedImage) {
      if (recordedImage != null && recordedImage.path != null) {
        setState(() {
          pictureButtonText = 'Saving in progress...';
        });
        GallerySaver.saveImage(recordedImage.path, albumName: 'TestImage');
      }
    });
  }

  void _recordVideo() async {
    ImagePicker()
        .getVideo(source: ImageSource.camera)
        .then((PickedFile? recordedVideo) {
      if (recordedVideo != null && recordedVideo.path != null) {
        setState(() {
          videoButtonText = "Saving Video...";
        });
        GallerySaver.saveVideo(recordedVideo.path, albumName: 'TestVideo')
            .then((bool? success) {
          setState(() {
            videoButtonText = 'Video Recording Saved Successfully';
          });
        });
      }
    });
  }
}

class CameraGalleryScreen extends StatefulWidget {
  const CameraGalleryScreen({Key? key}) : super(key: key);

  @override
  State<CameraGalleryScreen> createState() => _CameraGalleryScreenState();
}

class _CameraGalleryScreenState extends State<CameraGalleryScreen> {
  String pictureButtonText = 'Take a Picture';
  String videoButtonText = 'Record Video';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: Container(
        child: Column(
          children: [
            Flexible(
              flex: 1,
              child: Container(
                child: SizedBox.expand(
                  child: TextButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(bgColor)),
                    onPressed: _recordVideo,
                    child: const Text(
                      'Take a Picture',
                      style: TextStyle(fontSize: 25, color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _takePhoto() async {
    ImagePicker()
        .getImage(source: ImageSource.camera)
        .then((PickedFile? recordedImage) {
      if (recordedImage != null && recordedImage.path != null) {
        setState(() {
          pictureButtonText = 'Saving in progress...';
        });
        GallerySaver.saveImage(recordedImage.path, albumName: 'TestImage');
      }
    });
  }

  void _recordVideo() async {
    ImagePicker()
        .getVideo(source: ImageSource.camera)
        .then((PickedFile? recordedVideo) {
      if (recordedVideo != null && recordedVideo.path != null) {
        setState(() {
          videoButtonText = "Saving Video...";
        });
        GallerySaver.saveVideo(recordedVideo.path, albumName: 'TestVideo')
            .then((bool? success) {
          setState(() {
            videoButtonText = 'Video Recording Saved Successfully';
          });
        });
      }
    });
  }
}
