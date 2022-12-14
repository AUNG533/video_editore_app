import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:video_editing_app/components/colors.dart';
import 'dart:io';
import 'package:helpers/helpers.dart'
    show OpacityTransition, SwipeTransition, AnimatedInteractiveViewer;
import 'package:video_editing_app/screen/camera_screen.dart';
import 'package:video_editing_app/screen/video_picker_screen.dart';

import 'package:video_editor/video_editor.dart';
import 'package:video_player/video_player.dart';

import 'crop_screen.dart';

class EditScreen extends StatefulWidget {
  const EditScreen({Key? key, required this.file}) : super(key: key);

  final File file;

  @override
  State<EditScreen> createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  final _exportingProgress = ValueNotifier<double>(0.0);
  final _isExporting = ValueNotifier<bool>(false);
  final double height = 60;

  bool _exported = false;
  String _exportText = "";
  late VideoEditorController _controller;

  bool _isVisible = true;
  bool _isVisible2 = false;

  @override
  void initState() {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight]);
    _controller = VideoEditorController.file(widget.file,
        maxDuration: const Duration(seconds: 30))
      ..initialize(aspectRatio: 9 / 16).then((_) => setState(() {}));
    super.initState();
  }

  @override
  void dispose() {
    _exportingProgress.dispose();
    _isExporting.dispose();
    _controller.dispose();
    super.dispose();
  }

  void _openCropScreen() => Navigator.push(
      context,
      MaterialPageRoute<void>(
          builder: (BuildContext context) =>
              CropScreen(controller: _controller)));

  void _exportVideo() async {
    _exportingProgress.value = 0;
    _isExporting.value = true;
    // NOTE: To use `-crf 1` and [VideoExportPreset] you need `ffmpeg_kit_flutter_min_gpl` package (with `ffmpeg_kit` only it won't work)
    await _controller.exportVideo(
      // preset: VideoExportPreset.medium,
      // customInstruction: "-crf 17",
      onProgress: (stats, value) => _exportingProgress.value = value,
      onError: (e, s) => _exportText = "Error on export video :(",
      onCompleted: (file) {
        _isExporting.value = false;
        if (!mounted) return;
        final VideoPlayerController videoController =
            VideoPlayerController.file(file);
        videoController.initialize().then((value) async {
          setState(() {});
          videoController.play();
          videoController.setLooping(true);
          await showDialog(
            context: context,
            builder: (_) => Padding(
              padding: const EdgeInsets.all(30),
              child: Center(
                child: AspectRatio(
                  aspectRatio: videoController.value.aspectRatio,
                  child: VideoPlayer(videoController),
                ),
              ),
            ),
          );
          await videoController.pause();
          videoController.dispose();
        });

        _exportText = "Video success export!";
        setState(() => _exported = true);
        Future.delayed(const Duration(seconds: 2),
            () => setState(() => _exported = false));
      },
    );
  }

  void _exportCover() async {
    setState(() => _exported = false);
    await _controller.extractCover(
      onError: (e, s) => _exportText = "Error on cover exportation :(",
      onCompleted: (cover) {
        if (!mounted) return;

        _exportText = "Cover exported! ${cover.path}";
        showDialog(
          context: context,
          builder: (_) => Padding(
            padding: const EdgeInsets.all(30),
            child: Center(child: Image.memory(cover.readAsBytesSync())),
          ),
        );

        setState(() => _exported = true);
        Future.delayed(const Duration(seconds: 2),
            () => setState(() => _exported = false));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: _controller.initialized
          ? SafeArea(
              child: Row(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height,
                    width: 60.0,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8.0, vertical: 5.0),
                            child: Container(
                              color: Colors.grey[900],
                              width: 50,
                              height: 50,
                              child: TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: const Padding(
                                  padding: EdgeInsets.only(left: 10),
                                  child: Icon(
                                    Icons.arrow_back_ios,
                                    size: 30,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8.0, vertical: 5.0),
                            child: Container(
                              color: Colors.grey[900],
                              width: 50,
                              height: 50,
                              child: TextButton(
                                onPressed: () => _controller
                                    .rotate90Degrees(RotateDirection.right),
                                child: const Icon(
                                  Icons.undo_sharp,
                                  size: 30,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8.0, vertical: 5.0),
                            child: Container(
                              color: Colors.grey[900],
                              width: 50,
                              height: 50,
                              child: TextButton(
                                onPressed: () => _controller
                                    .rotate90Degrees(RotateDirection.left),
                                child: const Icon(
                                  Icons.redo,
                                  size: 30,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8.0, vertical: 5.0),
                            child: Container(
                              color: Colors.grey[900],
                              width: 50,
                              height: 50,
                              child: TextButton(
                                onPressed: _openCropScreen,
                                child: const Icon(
                                  Icons.fullscreen,
                                  size: 30,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8.0, vertical: 5.0),
                            child: Container(
                              color: Colors.grey[900],
                              width: 50,
                              height: 50,
                              child: TextButton(
                                onPressed: _exportCover,
                                child: const Icon(
                                  Icons.settings,
                                  size: 30,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8.0, vertical: 5.0),
                            child: Container(
                              color: Colors.grey[900],
                              width: 50,
                              height: 50,
                              child: TextButton(
                                onPressed: () {
                                  setState(() {
                                    _isVisible = !_isVisible;
                                    _isVisible2 = !_isVisible2;
                                  });
                                },
                                child: const Icon(
                                  Icons.format_list_bulleted,
                                  size: 30,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            flex: 2,
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      CropGridViewer(
                                        controller: _controller,
                                        showGrid: false,
                                      ),
                                      AnimatedBuilder(
                                        animation: _controller.video,
                                        builder: (_, __) => OpacityTransition(
                                          visible: !_controller.isPlaying,
                                          child: GestureDetector(
                                            onTap: _controller.video.play,
                                            child: Container(
                                              width: 60,
                                              height: 60,
                                              decoration: const BoxDecoration(
                                                color: Colors.white,
                                                shape: BoxShape.circle,
                                              ),
                                              child: const Icon(
                                                  Icons.play_arrow,
                                                  color: Colors.black),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: SizedBox(
                                    // color: Colors.pink,
                                    width: MediaQuery.of(context).size.width,
                                    height: MediaQuery.of(context).size.height,

                                    child: Column(
                                      children: [
                                        Expanded(
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                top: 8, right: 8, bottom: 0),
                                            child: Align(
                                              alignment: Alignment.centerRight,
                                              child: InkWell(
                                                onTap: () {
                                                  showDialog(
                                                      context: context,
                                                      barrierDismissible: true,
                                                      builder: (context) {
                                                        return AlertDialog(
                                                          backgroundColor: bgColor,
                                                          title: const Center(
                                                            child: Text(
                                                                'Export Project', style: TextStyle(color: Colors.white),),
                                                          ),
                                                          content:
                                                              const SizedBox(
                                                            height: 100,
                                                            child: Image(
                                                              image: AssetImage(
                                                                'assets/export.png',
                                                              ),
                                                            ),
                                                          ),
                                                          actions: [
                                                            Padding(
                                                              padding: const EdgeInsets.all(8.0),
                                                              child: FloatingActionButton
                                                                  .extended(
                                                                  backgroundColor: buttonColor,
                                                                onPressed: () {
                                                                    Navigator.pop(context);
                                                                    _exportVideo();
                                                                },
                                                                label: const Text(
                                                                    'Export Video')
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding: const EdgeInsets.all(8.0),
                                                              child: FloatingActionButton
                                                                  .extended(
                                                                  backgroundColor: buttonColor,
                                                                onPressed: () {
                                                                  Navigator.pop(context);
                                                                  _exportCover();
                                                                },
                                                                label: const Text(
                                                                    'Export Thumbnails')
                                                              ),
                                                            ),
                                                          ],
                                                        );
                                                      });
                                                },
                                                child: CircleAvatar(
                                                  radius: 30,
                                                  backgroundColor:
                                                      Colors.grey[900],
                                                  child: const Icon(
                                                      Icons.ios_share),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          flex: 5,
                                          child: SizedBox(
                                            width: 165,
                                            height: 165,
                                            child: _controls(context),
                                          ),
                                        ),
                                        Expanded(
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 0, left: 8, right: 0),
                                                child: Align(
                                                  alignment:
                                                      Alignment.centerRight,
                                                  child: InkWell(
                                                    onTap: () {},
                                                    child: CircleAvatar(
                                                      radius: 30,
                                                      backgroundColor:
                                                          Colors.grey[900],
                                                      child: const Icon(
                                                          Icons.store),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 0, left: 0, right: 8),
                                                child: Align(
                                                  alignment:
                                                      Alignment.centerRight,
                                                  child: InkWell(
                                                    onTap: () {
                                                      _controller.video.play();
                                                    },
                                                    child: CircleAvatar(
                                                      radius: 30,
                                                      backgroundColor:
                                                          Colors.grey[900],
                                                      child: const Icon(Icons
                                                          .play_arrow_rounded),
                                                    ),
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Visibility(
                            visible: _isVisible2,
                            child: _coverSelection(),
                          ),
                          Visibility(
                            visible: _isVisible,
                            child: Expanded(
                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: _trimSlider()),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            )
          : const Center(child: CircularProgressIndicator()),
    );
  }

  Widget _coverSelection() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
          height: 100,
          margin: EdgeInsets.symmetric(horizontal: height / 2),
          child: SingleChildScrollView(
            child: CoverSelection(
              controller: _controller,
              height: height,
              quantity: 30,
            ),
          )),
    );
  }

  String formatter(Duration duration) => [
        duration.inMinutes.remainder(60).toString().padLeft(2, '0'),
        duration.inSeconds.remainder(60).toString().padLeft(2, '0')
      ].join(":");

  List<Widget> _trimSlider() {
    return [
      AnimatedBuilder(
        animation: _controller.video,
        builder: (_, __) {
          final duration = _controller.video.value.duration.inSeconds;
          final pos = _controller.trimPosition * duration;
          final start = _controller.minTrim * duration;
          final end = _controller.maxTrim * duration;

          return Padding(
            padding: EdgeInsets.symmetric(horizontal: height / 4),
            child: Row(
              children: [
                Text(
                  formatter(Duration(seconds: pos.toInt())),
                  style: const TextStyle(color: Colors.white),
                ),
                const Expanded(child: SizedBox()),
                OpacityTransition(
                  visible: _controller.isTrimming,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        formatter(Duration(seconds: start.toInt())),
                        style: const TextStyle(color: Colors.white),
                      ),
                      const SizedBox(width: 10),
                      Text(
                        formatter(Duration(seconds: end.toInt())),
                        style: const TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
      Expanded(
        child: Container(
          width: MediaQuery.of(context).size.width,
          margin: EdgeInsets.symmetric(vertical: height / 8),
          child: TrimSlider(
            controller: _controller,
            height: height,
            horizontalMargin: height / 4,
            child: TrimTimeline(
              controller: _controller,
              margin: const EdgeInsets.only(top: 2),
            ),
          ),
        ),
      )
    ];
  }
}

Widget _controls(BuildContext context) {
  return Container(
    width: 165,
    height: 165,
    decoration: const BoxDecoration(
      color: Color.fromRGBO(58, 58, 64, 1),
      borderRadius: BorderRadius.all(Radius.elliptical(100, 100)),
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 12),
          child: GestureDetector(
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const VideoPickerPage(),
                ),
              );
            },
            child: Column(
              children: const [
                Icon(
                  Icons.perm_media_sharp,
                  color: Colors.white,
                ),
                Text(
                  'MEDIA',
                  style: TextStyle(color: Colors.white, fontSize: 10),
                )
              ],
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: Padding(
            padding: const EdgeInsets.only(left: 12, right: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                    onTap: () {},
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: const [
                        Icon(
                          Icons.layers_outlined,
                          color: Colors.white,
                        ),
                        Text(
                          'Layer',
                          style: TextStyle(color: Colors.white, fontSize: 10),
                        )
                      ],
                    )),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const CameraScreen(),
                      ),
                    );
                  },
                  child: Container(
                    width: 45,
                    height: 45,
                    decoration: const BoxDecoration(
                      color: Colors.green,
                      borderRadius:
                          BorderRadius.all(Radius.elliptical(200, 200)),
                    ),
                    child: const Icon(
                      Icons.camera,
                      color: Colors.white,
                    ),
                  ),
                ),
                GestureDetector(
                    onTap: () {},
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: const [
                        Icon(
                          Icons.audiotrack,
                          color: Colors.white,
                        ),
                        Text(
                          'Audio',
                          style: TextStyle(color: Colors.white, fontSize: 10),
                        )
                      ],
                    )),
              ],
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: GestureDetector(
              onTap: () {
                print('REC');
              },
              child: Column(
                children: const [
                  Icon(
                    Icons.mic_outlined,
                    color: Colors.white,
                  ),
                  Text(
                    'REC',
                    style: TextStyle(color: Colors.white, fontSize: 10),
                  )
                ],
              ),
            ),
          ),
        )
      ],
    ),
  );
}

//-------------------//
//VIDEO EDITOR SCREEN//
//-------------------//
class VideoEditor extends StatefulWidget {
  const VideoEditor({Key? key, required this.file}) : super(key: key);

  final File file;

  @override
  State<VideoEditor> createState() => _VideoEditorState();
}

class _VideoEditorState extends State<VideoEditor> {
  final _exportingProgress = ValueNotifier<double>(0.0);
  final _isExporting = ValueNotifier<bool>(false);
  final double height = 60;

  bool _exported = false;
  String _exportText = "";
  late VideoEditorController _controller;

  @override
  void initState() {
    _controller = VideoEditorController.file(widget.file,
        maxDuration: const Duration(seconds: 30))
      ..initialize(aspectRatio: 9 / 16).then((_) => setState(() {}));
    super.initState();
  }

  @override
  void dispose() {
    _exportingProgress.dispose();
    _isExporting.dispose();
    _controller.dispose();
    super.dispose();
  }

  void _openCropScreen() => Navigator.push(
      context,
      MaterialPageRoute<void>(
          builder: (BuildContext context) =>
              CropScreen(controller: _controller)));

  void _exportVideo() async {
    _exportingProgress.value = 0;
    _isExporting.value = true;
    // NOTE: To use `-crf 1` and [VideoExportPreset] you need `ffmpeg_kit_flutter_min_gpl` package (with `ffmpeg_kit` only it won't work)
    await _controller.exportVideo(
      // preset: VideoExportPreset.medium,
      // customInstruction: "-crf 17",
      onProgress: (stats, value) => _exportingProgress.value = value,
      onError: (e, s) => _exportText = "Error on export video :(",
      onCompleted: (file) {
        _isExporting.value = false;
        if (!mounted) return;

        final VideoPlayerController videoController =
            VideoPlayerController.file(file);
        videoController.initialize().then((value) async {
          setState(() {});
          videoController.play();
          videoController.setLooping(true);
          await showDialog(
            context: context,
            builder: (_) => Padding(
              padding: const EdgeInsets.all(30),
              child: Center(
                child: AspectRatio(
                  aspectRatio: videoController.value.aspectRatio,
                  child: VideoPlayer(videoController),
                ),
              ),
            ),
          );
          await videoController.pause();
          videoController.dispose();
        });

        _exportText = "Video success export!";
        setState(() => _exported = true);
        Future.delayed(const Duration(seconds: 2),
            () => setState(() => _exported = false));
      },
    );
  }

  void _exportCover() async {
    setState(() => _exported = false);
    await _controller.extractCover(
      onError: (e, s) => _exportText = "Error on cover exportation :(",
      onCompleted: (cover) {
        if (!mounted) return;

        _exportText = "Cover exported! ${cover.path}";
        showDialog(
          context: context,
          builder: (_) => Padding(
            padding: const EdgeInsets.all(30),
            child: Center(child: Image.memory(cover.readAsBytesSync())),
          ),
        );

        setState(() => _exported = true);
        Future.delayed(const Duration(seconds: 2),
            () => setState(() => _exported = false));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: _controller.initialized
          ? SafeArea(
              child: Stack(children: [
              Column(children: [
                _topNavBar(),
                Expanded(
                    child: DefaultTabController(
                        length: 2,
                        child: Column(children: [
                          Expanded(
                              child: TabBarView(
                            physics: const NeverScrollableScrollPhysics(),
                            children: [
                              Stack(alignment: Alignment.center, children: [
                                CropGridViewer(
                                  controller: _controller,
                                  showGrid: false,
                                ),
                                AnimatedBuilder(
                                  animation: _controller.video,
                                  builder: (_, __) => OpacityTransition(
                                    visible: !_controller.isPlaying,
                                    child: GestureDetector(
                                      onTap: _controller.video.play,
                                      child: Container(
                                        width: 40,
                                        height: 40,
                                        decoration: const BoxDecoration(
                                          color: Colors.white,
                                          shape: BoxShape.circle,
                                        ),
                                        child: const Icon(Icons.play_arrow,
                                            color: Colors.black),
                                      ),
                                    ),
                                  ),
                                ),
                              ]),
                              CoverViewer(controller: _controller)
                            ],
                          )),
                          Container(
                              height: 200,
                              margin: const EdgeInsets.only(top: 10),
                              child: Column(children: [
                                TabBar(
                                  indicatorColor: Colors.white,
                                  tabs: [
                                    Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: const [
                                          Padding(
                                              padding: EdgeInsets.all(5),
                                              child: Icon(Icons.content_cut)),
                                          Text('Trim')
                                        ]),
                                    Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: const [
                                          Padding(
                                              padding: EdgeInsets.all(5),
                                              child: Icon(Icons.video_label)),
                                          Text('Cover')
                                        ]),
                                  ],
                                ),
                                Expanded(
                                  child: TabBarView(
                                    children: [
                                      Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: _trimSlider()),
                                      Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [_coverSelection()]),
                                    ],
                                  ),
                                )
                              ])),
                          _customSnackBar(),
                          ValueListenableBuilder(
                            valueListenable: _isExporting,
                            builder: (_, bool export, __) => OpacityTransition(
                              visible: export,
                              child: AlertDialog(
                                backgroundColor: Colors.white,
                                title: ValueListenableBuilder(
                                  valueListenable: _exportingProgress,
                                  builder: (_, double value, __) => Text(
                                    "Exporting video ${(value * 100).ceil()}%",
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          )
                        ])))
              ])
            ]))
          : const Center(child: CircularProgressIndicator()),
    );
  }

  Widget _topNavBar() {
    return SafeArea(
      child: SizedBox(
        height: height,
        child: Row(
          children: [
            Expanded(
              child: IconButton(
                onPressed: () =>
                    _controller.rotate90Degrees(RotateDirection.left),
                icon: const Icon(Icons.rotate_left),
              ),
            ),
            Expanded(
              child: IconButton(
                onPressed: () =>
                    _controller.rotate90Degrees(RotateDirection.right),
                icon: const Icon(Icons.rotate_right),
              ),
            ),
            Expanded(
              child: IconButton(
                onPressed: _openCropScreen,
                icon: const Icon(Icons.crop),
              ),
            ),
            Expanded(
              child: IconButton(
                onPressed: _exportCover,
                icon: const Icon(Icons.save_alt, color: Colors.white),
              ),
            ),
            Expanded(
              child: IconButton(
                onPressed: _exportVideo,
                icon: const Icon(Icons.save),
              ),
            ),
          ],
        ),
      ),
    );
  }

  String formatter(Duration duration) => [
        duration.inMinutes.remainder(60).toString().padLeft(2, '0'),
        duration.inSeconds.remainder(60).toString().padLeft(2, '0')
      ].join(":");

  List<Widget> _trimSlider() {
    return [
      AnimatedBuilder(
        animation: _controller.video,
        builder: (_, __) {
          final duration = _controller.video.value.duration.inSeconds;
          final pos = _controller.trimPosition * duration;
          final start = _controller.minTrim * duration;
          final end = _controller.maxTrim * duration;

          return Padding(
            padding: EdgeInsets.symmetric(horizontal: height / 4),
            child: Row(children: [
              Text(formatter(Duration(seconds: pos.toInt()))),
              const Expanded(child: SizedBox()),
              OpacityTransition(
                visible: _controller.isTrimming,
                child: Row(mainAxisSize: MainAxisSize.min, children: [
                  Text(formatter(Duration(seconds: start.toInt()))),
                  const SizedBox(width: 10),
                  Text(formatter(Duration(seconds: end.toInt()))),
                ]),
              )
            ]),
          );
        },
      ),
      Container(
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.symmetric(vertical: height / 8),
        child: TrimSlider(
          controller: _controller,
          height: height,
          horizontalMargin: height / 4,
          child: TrimTimeline(
            controller: _controller,
            margin: const EdgeInsets.only(top: 2),
          ),
        ),
      )
    ];
  }

  Widget _coverSelection() {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: height / 4),
        child: CoverSelection(
          controller: _controller,
          height: height,
          quantity: 8,
        ));
  }

  Widget _customSnackBar() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: SwipeTransition(
        visible: _exported,
        axisAlignment: 1.0,
        child: Container(
          height: height,
          width: double.infinity,
          color: Colors.black.withOpacity(0.8),
          child: Center(
            child: Text(_exportText,
                style: const TextStyle(fontWeight: FontWeight.bold)),
          ),
        ),
      ),
    );
  }
}
