import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:video_editing_app/components/colors.dart';

class EditScreen extends StatefulWidget {
  const EditScreen({Key? key}) : super(key: key);

  @override
  State<EditScreen> createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  @override
  void initState() {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: Row(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height,
              width: 90.0,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        color: Colors.grey[900],
                        width: 70,
                        height: 70,
                        child: TextButton(
                          onPressed: () {},
                          child: const Padding(
                            padding: EdgeInsets.only(left: 10),
                            child: Icon(
                              Icons.arrow_back_ios,
                              size: 50,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        color: Colors.grey[900],
                        width: 70,
                        height: 70,
                        child: TextButton(
                          onPressed: () {},
                          child: const Icon(
                            Icons.undo_sharp,
                            size: 50,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        color: Colors.grey[900],
                        width: 70,
                        height: 70,
                        child: TextButton(
                          onPressed: () {},
                          child: const Icon(
                            Icons.redo,
                            size: 50,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        color: Colors.grey[900],
                        width: 70,
                        height: 70,
                        child: TextButton(
                          onPressed: () {},
                          child: const Icon(
                            Icons.fullscreen,
                            size: 50,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        color: Colors.grey[900],
                        width: 70,
                        height: 70,
                        child: TextButton(
                          onPressed: () {},
                          child: const Icon(
                            Icons.settings,
                            size: 50,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        color: Colors.grey[900],
                        width: 70,
                        height: 70,
                        child: TextButton(
                          onPressed: () {},
                          child: const Icon(
                            Icons.format_list_bulleted,
                            size: 50,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        color: Colors.grey[900],
                        width: 70,
                        height: 70,
                        child: TextButton(
                          onPressed: () {},
                          child: const Icon(
                            Icons.exit_to_app,
                            size: 50,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(
                // color: Colors.blue,
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Row(
                        children: [
                          Expanded(
                            flex: 2,
                            child: Container(
                              color: Colors.black,
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height,
                              child: Center(
                                child: IconButton(
                                    onPressed: () {},
                                    icon: const Icon(
                                      Icons.play_arrow_rounded,
                                      color: Colors.white,
                                      size: 50,
                                    )),
                              ),
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
                                          right: 8, bottom: 8),
                                      child: Align(
                                        alignment: Alignment.centerRight,
                                        child: InkWell(
                                          onTap: () {},
                                          child:  CircleAvatar(
                                            radius: 30,
                                            backgroundColor: Colors.grey[900],
                                            child: const Icon(Icons.ios_share),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: Container(
                                      color: Colors.green,
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Padding(
                                      padding: const EdgeInsets.all(8.0),
                                            child: Align(
                                              alignment: Alignment.centerRight,
                                              child: InkWell(
                                                onTap: () {},
                                                child:  CircleAvatar(
                                                  radius: 30,
                                                  backgroundColor: Colors.grey[900],
                                                  child: const Icon(Icons.store),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Align(
                                              alignment: Alignment.centerRight,
                                              child: InkWell(
                                                onTap: () {},
                                                child:  CircleAvatar(
                                                  radius: 30,
                                                  backgroundColor: Colors.grey[900],
                                                  child: const Icon(Icons.play_arrow_rounded),
                                                ),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: 8.0, right: 8.0, bottom: 8.0),
                        child: Container(
                          color: Colors.grey[900],
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
