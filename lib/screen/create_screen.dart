import 'package:flutter/material.dart';
import 'package:video_editing_app/screen/create_project.dart';
import 'package:video_editing_app/widgets/project_widget.dart';

import '../dummy/dummy.dart';

class CreateScreen extends StatefulWidget {
  const CreateScreen({Key? key}) : super(key: key);

  @override
  State<CreateScreen> createState() => _CreateScreenState();
}

class _CreateScreenState extends State<CreateScreen> {
  List<DummyProject> dummyP = [
    DummyProject(title: 'Title 1', subTitle: 'subTitle', image: 'assets/image.png')
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(250, 20, 21, 24),
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              child: Column(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const CreateProject(),
                        ),
                      );
                    },
                    child: const ProjectWidget(),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: dummyP.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Card(
                            shadowColor: Colors.white,
                            color: const Color.fromARGB(250, 20, 21, 24),
                            child: ListTile(
                              leading: Image(
                                image: AssetImage(dummyP[index].image),
                              ),
                              trailing: IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.edit,
                                  color: Colors.white,
                                ),
                              ),
                              title: Text(
                                dummyP[index].title,
                                style: const TextStyle(color: Colors.white),
                              ),
                              subtitle: Text(
                                dummyP[index].subTitle,
                                style: const TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
