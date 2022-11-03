// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:video_editing_app/dummy/dummy_video_scroll.dart';

class MixScreen extends StatefulWidget {
  const MixScreen({Key? key}) : super(key: key);

  @override
  State<MixScreen> createState() => _MixScreenState();
}

class _MixScreenState extends State<MixScreen> {
  PageController controller = PageController(initialPage: 0);

  List<DummyVideo> myVid = [
    DummyVideo(
      image: 'assets/img_1.png',
      title: '#Iksoft Original',
      likes: '250k',
      shares: '500',
      messages: '805',
      duration: '01:05',
      ratio: '2:2',
    ),
    DummyVideo(
      image: 'assets/bg.png',
      title: 'Test Text',
      likes: '250k',
      shares: '500',
      messages: '805',
      duration: '01:05',
      ratio: '2:2',
    ),
    DummyVideo(
      image: 'assets/img_1.png',
      title: 'Second Title',
      likes: '250k',
      shares: '500',
      messages: '805',
      duration: '01:05',
      ratio: '2:2',
    ),
    DummyVideo(
      image: 'assets/bg.png',
      title: '#Iksoft Original',
      likes: '250k',
      shares: '500',
      messages: '805',
      duration: '01:05',
      ratio: '2:2',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(250, 20, 21, 24),
      body: PageView.builder(
        scrollDirection: Axis.vertical,
        controller: controller,
        itemCount: myVid.length,
        itemBuilder: (context, int itemIndex) {
          return Container(
            decoration: BoxDecoration(
              color: Colors.red,
              image: DecorationImage(
                  image: AssetImage(myVid[itemIndex].image!), fit: BoxFit.cover),
            ),
            width: double.infinity,
            height: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Column(
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.favorite_border),
                        color: Colors.white,
                        iconSize: 50,
                      ),
                      Text(
                        myVid[itemIndex].likes!,
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      )
                    ],
                  ),
                  const SizedBox(height: 20),
                  Column(
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.message),
                        color: Colors.white,
                        iconSize: 50,
                      ),
                      Text(
                        myVid[itemIndex].messages!,
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Column(
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.share),
                        color: Colors.white,
                        iconSize: 50,
                      ),
                      Text(
                        myVid[itemIndex].shares!,
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              myVid[itemIndex].title!,
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(Icons.lock_clock, color: Colors.white),
                      ),
                      Text(myVid[itemIndex].duration!, style: TextStyle(color: Colors.white)),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(Icons.rectangle, color: Colors.white),
                      ),
                      Text(myVid[itemIndex].ratio!, style: TextStyle(color: Colors.white)),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('${myVid[itemIndex].shares!}downloads',
                            style: TextStyle(color: Colors.white)),
                      ),
                      const SizedBox(width: 40),
                      SizedBox(
                        width: 90,
                        child: FloatingActionButton.extended(
                          backgroundColor:
                              const Color.fromARGB(250, 253, 77, 61),
                          onPressed: () {},
                          label: Text('Use'),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
