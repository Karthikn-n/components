import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoAudioPlayerComponent extends StatefulWidget {
  const VideoAudioPlayerComponent({super.key});

  @override
  State<VideoAudioPlayerComponent> createState() => _VideoAudioPlayerComponentState();
}

class _VideoAudioPlayerComponentState extends State<VideoAudioPlayerComponent> {

  late VideoPlayerController _controller;
  late VideoPlayerController _audioController;
  late ChewieController _chewieController;
  late ChewieController _chewieAudioController;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.networkUrl(Uri.parse(
        'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4'))
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
      });
    _audioController = VideoPlayerController.networkUrl(Uri.parse(
        'https://www.learningcontainer.com/wp-content/uploads/2020/02/Kalimba.mp3'))
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
      });

      _chewieController = ChewieController(
        videoPlayerController: _controller,
        looping: true
      );
      _chewieAudioController = ChewieController(
        videoPlayerController: _audioController,
        looping: true
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Audio & Video Player"),
      ),
      body: Column(
        children: [
          _controller.value.isInitialized
            ? AspectRatio(
                aspectRatio: _controller.value.aspectRatio,
                child: Chewie(controller: _chewieController),
              )
            : Container(),
          _audioController.value.isInitialized
            ? AspectRatio(
              aspectRatio: _audioController.value.aspectRatio,
              child: Chewie(controller: _chewieAudioController))
            : Container(),

        ],
      ),
    );
  }
  @override
  void dispose() {
    _controller.dispose();
    _chewieController.dispose();
    super.dispose();
  }
}