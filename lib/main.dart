import 'package:flutter/material.dart';
import 'Global.dart';
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
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: Global.videoB
              .map((e) => GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushNamed('video');
                      Global.uri = e['video'];
                    },
                    child: Container(
                        margin: const EdgeInsets.all(10),
                        child: Image.network(e['image'])),
                  ))
              .toList(),
        ),
      ),
    );
  }
}
