import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class PlayerPage extends StatefulWidget {

  static const String routeName = '/player';

  final String videoUrl;

  const PlayerPage({Key? key, required this.videoUrl}) : super(key: key);

  @override
  State<PlayerPage> createState() => _PlayerPageState();
}

class _PlayerPageState extends State<PlayerPage> {

  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    final bool isUrl = widget.videoUrl.contains('http') == true;
    _controller = isUrl
        ? VideoPlayerController.network(widget.videoUrl)
        : VideoPlayerController.asset(widget.videoUrl)
      ..setLooping(true)
      ..play()
      ..initialize().then((value) {
        setState(() {
        });
      });
  }

  @override
  Widget build(BuildContext context) {
    final bool isUrl = widget.videoUrl.contains('http') == true;
    return Scaffold(
      body: Center(
        child: _controller.value.isInitialized
            ? isUrl == true
              ? AspectRatio(aspectRatio: _controller.value.aspectRatio, child: VideoPlayer(_controller),)
              : VideoPlayer(_controller)
            : Container(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _controller.value.isPlaying
                ? _controller.pause()
                : _controller.play();
          });
        },
        child: Icon(
          _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}
