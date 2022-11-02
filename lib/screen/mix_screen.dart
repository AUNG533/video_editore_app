// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class MixScreen extends StatefulWidget {
  const MixScreen({Key? key}) : super(key: key);

  @override
  State<MixScreen> createState() => _MixScreenState();
}

class _MixScreenState extends State<MixScreen> {
  PageController controller = PageController(initialPage: 0);

  List<Widget> scrollingImages = [
    Container(
      decoration: BoxDecoration(
        color: Colors.red,
        image: DecorationImage(
            image: AssetImage('assets/img_1.png'), fit: BoxFit.cover),
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
                  '1k',
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
                  '1k',
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
                  '1k',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Column(
                  children: const [
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        '#morden Agency...',
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
                Text('00:25', style: TextStyle(color: Colors.white)),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(Icons.rectangle, color: Colors.white),
                ),
                Text('1:1', style: TextStyle(color: Colors.white)),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('1K downloads',
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
    ),
    Container(
      decoration: BoxDecoration(
        color: Colors.red,
        image: DecorationImage(
            image: AssetImage('assets/bg.png'), fit: BoxFit.cover),
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
                  '1k',
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
                  '1k',
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
                  '1k',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Column(
                  children: const [
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        '#morden Agency...',
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
                Text('00:25', style: TextStyle(color: Colors.white)),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(Icons.rectangle, color: Colors.white),
                ),
                Text('1:1', style: TextStyle(color: Colors.white)),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('1K downloads',
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
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(250, 20, 21, 24),
      body: PageView(
        scrollDirection: Axis.vertical,
        children: scrollingImages,
      ),
    );
  }
}
