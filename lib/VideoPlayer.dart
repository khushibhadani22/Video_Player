import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoApp extends StatefulWidget {
  const VideoApp({Key? key}) : super(key: key);

  @override
  State<VideoApp> createState() => _VideoAppState();
}

class _VideoAppState extends State<VideoApp> {
  late VideoPlayerController videoPlayerController;
  late ChewieController chewieController;

  loadVideo() async {
    videoPlayerController = VideoPlayerController.network(
        'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4');
    await videoPlayerController.initialize();
    setState(() {});
    chewieController = ChewieController(
        videoPlayerController: videoPlayerController, autoPlay: true);
  }

  @override
  void initState() {
    loadVideo();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: AspectRatio(
        aspectRatio: videoPlayerController.value.aspectRatio,
        child: Chewie(
          controller: chewieController,
        ),
      )),
    );
  }
}
