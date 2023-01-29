import 'package:flutter/material.dart';
import 'VideoPlayer.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    routes: {
      '/': (context) => const MyApp(),
      'video': (context) => const VideoApp(),
    },
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const Text(
          "Video Player",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: ListView(
            physics: const BouncingScrollPhysics(),
            children: [
              myImage(
                  'https://www.koimoi.com/wp-content/new-galleries/2022/08/ranbir-kapoor-deva-deva-from-brahmastra-makes-one-feel-spiritually-powerful-with-rare-ease-001.jpg'),
              const SizedBox(
                height: 20,
              ),
              myImage('https://i.ytimg.com/vi/u2NAuswnTKs/maxresdefault.jpg'),
              const SizedBox(
                height: 20,
              ),
              myImage('https://i.ytimg.com/vi/PrGylftXLnw/maxresdefault.jpg'),
              const SizedBox(
                height: 20,
              ),
              myImage('https://i.ytimg.com/vi/Q4ofEQcWX0g/maxresdefault.jpg'),
              const SizedBox(
                height: 20,
              ),
              myImage('https://i.ytimg.com/vi/BSGKR1IhFoQ/maxresdefault.jpg'),
              const SizedBox(
                height: 20,
              ),
              myImage('https://i.ytimg.com/vi/SHC4EhwnLLU/maxresdefault.jpg'),
              const SizedBox(
                height: 20,
              ),
              myImage('https://i.ytimg.com/vi/ixdov26hzr4/maxresdefault.jpg'),
              const SizedBox(
                height: 20,
              ),
              myImage(
                  'https://media.lyricsmint.com/photos/11453/jaane-na-dunga-kahin_cover.jpg'),
              const SizedBox(
                height: 20,
              ),
              myImage(
                  'https://m.timesofindia.com/photo/84890441/size-132055/84890441.jpg'),
              const SizedBox(
                height: 20,
              ),
              myImage('https://i.ytimg.com/vi/bqP-CVhtQfc/maxresdefault.jpg'),
              const SizedBox(
                height: 20,
              ),
              myImage('https://i.ytimg.com/vi/13z2kF6TiCc/maxresdefault.jpg'),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }

  GestureDetector myImage(String image) {
    return GestureDetector(
        onTap: () {
          Navigator.of(context).pushNamed('video');
        },
        child: Image.network(image));
  }
}
