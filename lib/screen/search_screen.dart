// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:video_editing_app/components/colors.dart';
import 'package:video_editing_app/dummy/dummy_search.dart';

import '../dummy/dummy_categories.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  List<DummyCategories> categories = [
    DummyCategories(categoryName: 'All'),
    DummyCategories(categoryName: 'Marketing'),
    DummyCategories(categoryName: 'Corporate'),
    DummyCategories(categoryName: 'Celebrations'),
    DummyCategories(categoryName: 'Festive/Holiday'),
    DummyCategories(categoryName: 'Social Media'),
    DummyCategories(categoryName: 'Vlog'),
    DummyCategories(categoryName: 'Review/Tutorial'),
    DummyCategories(categoryName: 'Menes'),
  ];

  List<DummySearch> mySearch = [
    DummySearch(
      image:
          'https://venngage-wordpress.s3.amazonaws.com/uploads/2018/09/Orange-Modern-Simple-Background-Image-.jpg',
      downloads: '2050k',
      likes: '500k',
    ),
    DummySearch(
      image:
          'https://i.pinimg.com/originals/6e/73/0e/6e730e6a8a788b8559502a6d6df6bfcf.jpg',
      downloads: '2050k',
      likes: '500k',
    ),
    DummySearch(
      image:
          'https://i.pinimg.com/564x/c0/a0/e6/c0a0e6a17dc01f68d8a4e11ca7d7aabf.jpg',
      downloads: '2050k',
      likes: '500k',
    ),
    DummySearch(
      image:
          'https://w0.peakpx.com/wallpaper/444/782/HD-wallpaper-medical-bamboo-flowers-orchids-water-zen.jpg',
      downloads: '2050k',
      likes: '500k',
    ),
    DummySearch(
      image:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTWmqxYLkFv1cFCQw16gzfW-VjPwh06h1A9-717fuUp3EK8bqpilg1js4kMWH7SVgav11Q&usqp=CAU',
      downloads: '2050k',
      likes: '500k',
    ),
    DummySearch(
      image:
          'https://i.pinimg.com/564x/4d/37/5f/4d375fb4b982d995fd8c5ca2050e45bd--skinny-fiber-inner-peace.jpg',
      downloads: '2050k',
      likes: '500k',
    ),
    DummySearch(
      image:
          'https://i.pinimg.com/736x/0d/4b/6b/0d4b6bfd0de20beb8f0b314787070b07.jpg',
      downloads: '2050k',
      likes: '500k',
    ),
    DummySearch(
      image:
          'https://i0.wp.com/www.3wallpapers.fr/wp-content/uploads/2014/03/Zen-Attitude-3Wallpapers-iphone-Parallax.jpg?ssl=1',
      downloads: '2050k',
      likes: '500k',
    ),
    DummySearch(
      image:
          'https://i.pinimg.com/550x/ef/d0/f1/efd0f1780fafa5364397f402b72a3cb6.jpg',
      downloads: '2050k',
      likes: '500k',
    ),
    DummySearch(
      image:
          'https://i.pinimg.com/736x/7f/e4/e4/7fe4e45e6bfdf5c70a9af68c7671f0a6--zen-attitude-attitude-positive.jpg',
      downloads: '2050k',
      likes: '500k',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(),
              child: TextField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search, color: Colors.white),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  hintText: "Search for Projects",
                  hintStyle: TextStyle(color: Colors.grey),
                  fillColor: shadowColor,
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 70,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: categories.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: FloatingActionButton.extended(
                        backgroundColor: shadowColor,
                        onPressed: () {},
                        label: Text(categories[index].categoryName),
                      ),
                    );
                  }),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: GridView.builder(
                itemCount: mySearch.length,
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10.0,
                    mainAxisSpacing: 10.0),
                itemBuilder: (context, index) {
                  return Container(
                    width: 200,
                    height: 600,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(
                          mySearch[index].image!,
                        ),
                        fit: BoxFit.cover,
                      ),
                      color: shadowColor,
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Stack(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: const [Colors.transparent, Colors.black],
                            ),
                          ),
                        ),
                        Positioned(
                            bottom: 5,
                            left: 2,
                            right: 0,
                            child: Row(
                              children: [
                                Icon(Icons.download, color: Colors.white),
                                Text(
                                  mySearch[index].downloads!,
                                  style: TextStyle(color: Colors.white),
                                ),
                                SizedBox(width: 10),
                                Icon(Icons.favorite_border,
                                    color: Colors.white),
                                Text(
                                  mySearch[index].likes!,
                                  style: TextStyle(color: Colors.white),
                                ),
                              ],
                            ))
                      ],
                    ),
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
