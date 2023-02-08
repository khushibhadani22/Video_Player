import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:video_player/video_player.dart';

import 'Global.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight]);
}

class VideoApp extends StatefulWidget {
  const VideoApp({Key? key}) : super(key: key);

  @override
  State<VideoApp> createState() => _VideoAppState();
}

class _VideoAppState extends State<VideoApp> {
  late VideoPlayerController videoPlayerController;
  late ChewieController cController;

  loadVideo() async {
    videoPlayerController = VideoPlayerController.asset(Global.uri);
    await videoPlayerController.initialize();
    setState(() {});
    cController = ChewieController(
        videoPlayerController: videoPlayerController,
        autoPlay: true,
        fullScreenByDefault: true,
        looping: true,
        allowFullScreen: true);
  }

  @override
  void initState() {
    loadVideo();
    super.initState();
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);
  }

  @override
  void dispose() {
    super.dispose();
    videoPlayerController.dispose();
    cController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: AspectRatio(
        aspectRatio: videoPlayerController.value.aspectRatio,
        child: Chewie(
          controller: cController,
        ),
      )),
    );
  }
}
