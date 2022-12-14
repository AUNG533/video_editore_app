// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:video_editing_app/screen/video_picker_screen.dart';

import 'edit_screen.dart';

class CreateProject extends StatefulWidget {
  const CreateProject({Key? key}) : super(key: key);

  @override
  State<CreateProject> createState() => _CreateProjectState();
}

class _CreateProjectState extends State<CreateProject> {
  TextEditingController projectName = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(250, 20, 21, 24),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(250, 20, 21, 24),
        // title: const Text("New Project"),
        // centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: FloatingActionButton.extended(
              backgroundColor: const Color.fromARGB(250, 20, 21, 24),
              onPressed: () {},
              label: Row(
                children: const [
                  Icon(Icons.folder_open),
                  Text('Import'),
                ],
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            flex: 6,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 40),
                  const Padding(
                    padding: EdgeInsets.all(18.0),
                    child: Text(
                      'Project Name',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: projectName,
                      decoration: const InputDecoration(
                        hintText: 'Enter Project Name',
                        hintStyle: TextStyle(color: Colors.grey),
                        contentPadding: EdgeInsets.symmetric(
                          vertical: 10.0,
                          horizontal: 20.0,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(32.0),
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.white, width: 1.0),
                          borderRadius:
                              BorderRadius.all(Radius.circular(32.0)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.white, width: 2.0),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Padding(
                    padding: EdgeInsets.all(18.0),
                    child: Text(
                      'Aspect ratio',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: Column(
                      children: [
                        Wrap(
                          spacing: 8,
                          runSpacing: 16,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: InkWell(
                                child: CircleAvatar(
                                  backgroundColor: Colors.black12,
                                  radius: 50.0,
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.center,
                                    children: const [
                                      Icon(Icons.airplay_rounded),
                                      Text('16:9'),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: InkWell(
                                child: CircleAvatar(
                                  backgroundColor: Colors.black12,
                                  radius: 50.0,
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.center,
                                    children: const [
                                      Icon(Icons.airplay_rounded),
                                      Text('16:9'),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: InkWell(
                                child: CircleAvatar(
                                  backgroundColor: Colors.black12,
                                  radius: 50.0,
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.center,
                                    children: const [
                                      Icon(Icons.airplay_rounded),
                                      Text('9:16'),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: InkWell(
                                child: CircleAvatar(
                                  backgroundColor: Colors.black12,
                                  radius: 50.0,
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.center,
                                    children: const [
                                      Icon(Icons.airplay_rounded),
                                      Text('1:1'),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: InkWell(
                                child: CircleAvatar(
                                  backgroundColor: Colors.black12,
                                  radius: 50.0,
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.center,
                                    children: const [
                                      Icon(Icons.airplay_rounded),
                                      Text('4:3'),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: InkWell(
                                child: CircleAvatar(
                                  backgroundColor: Colors.black12,
                                  radius: 50.0,
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.center,
                                    children: const [
                                      Icon(Icons.airplay_rounded),
                                      Text('3:4'),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: InkWell(
                                child: CircleAvatar(
                                  backgroundColor: Colors.black12,
                                  radius: 50.0,
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.center,
                                    children: const [
                                      Icon(Icons.airplay_rounded),
                                      Text('4:5'),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: InkWell(
                                child: CircleAvatar(
                                  backgroundColor: Colors.black12,
                                  radius: 50.0,
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.center,
                                    children: const [
                                      Icon(Icons.airplay_rounded),
                                      Text('2:35:1'),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(22.0),
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: FloatingActionButton.extended(
                backgroundColor: Colors.red[700],
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const VideoPickerPage()),
                  );
                },
                label: const Text(
                  'Create',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
