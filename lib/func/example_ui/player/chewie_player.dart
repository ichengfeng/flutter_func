import 'package:flutter/material.dart';
import 'package:chewie/chewie.dart';
import 'package:video_player/video_player.dart';

class ChewiePlayerPage extends StatefulWidget {

  static const String routeName = '/chewie_player';

  final String? videoUrl;
  
  const ChewiePlayerPage({Key? key, this.videoUrl}) : super(key: key);

  @override
  State<ChewiePlayerPage> createState() => _ChewiePlayerPageState();
}

class _ChewiePlayerPageState extends State<ChewiePlayerPage> {

  final String _videoUrl = 'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4';
  late final VideoPlayerController _videoPlayerController;
  late final ChewieController _chewieController;

  @override
  void initState() {
    _videoPlayerController = VideoPlayerController.network(widget.videoUrl ?? _videoUrl);
    _chewieController = ChewieController(
      videoPlayerController:_videoPlayerController,
      autoPlay: true,looping: true,
      allowFullScreen: true,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Container(
            color: Colors.black,
            child: Chewie(controller: _chewieController,),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    _chewieController.dispose();
    super.dispose();
  }

}
