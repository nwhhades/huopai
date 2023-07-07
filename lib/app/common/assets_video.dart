import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class AssetsVideo extends StatefulWidget {
  final String filePath;
  final double width;
  final double height;

  const AssetsVideo(
      {super.key,
      required this.filePath,
      required this.width,
      required this.height});

  @override
  State<StatefulWidget> createState() => _AssetsVideoState();
}

enum PlayerState {
  init,
  buffering,
  playing,
  pause,
  err,
  completed,
}

class _AssetsVideoState extends State<AssetsVideo> {
  PlayerState playerState = PlayerState.init;
  late VideoPlayerController _controller;

  void showController() {}

  void hideController() {}

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset(widget.filePath);
    _controller.initialize().then((_) => setState(() {
          //预加载完成了
        }));
    _controller.addListener(() {
      if (_controller.value.isBuffering) {
        playerState = PlayerState.buffering;
      } else if (_controller.value.isPlaying) {
        playerState = PlayerState.playing;
      } else if (_controller.value.position == _controller.value.duration) {
        playerState = PlayerState.completed;
      } else if (_controller.value.hasError) {
        playerState = PlayerState.err;
      } else {
        playerState = PlayerState.pause;
      }
      setState(() {});
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget getPlayerView() {
    //大小完全取决于父容器
    return SizedBox.expand(
        child: FittedBox(
      fit: BoxFit.fill,
      child: SizedBox(
        width: _controller.value.size.width,
        height: _controller.value.size.height,
        child: VideoPlayer(_controller),
      ),
    ));
  }

  IconData getIconDataByPlayState() {
    switch (playerState) {
      case PlayerState.init:
        return Icons.play_arrow;
      case PlayerState.playing:
        return Icons.pause;
      case PlayerState.pause:
        return Icons.play_arrow;
      default:
        return Icons.refresh;
    }
  }

  @override
  Widget build(BuildContext context) {
    Stack root = Stack(
      alignment: Alignment.center,
      children: [
        getPlayerView(),
        Positioned(
          bottom: 0,
          child: SizedBox(
            width: widget.width,
            child: VideoProgressIndicator(
              _controller,
              allowScrubbing: true,
              colors: const VideoProgressColors(playedColor: Colors.blue),
            ),
          ),
        ),
        Positioned(
          child: FloatingActionButton(
            onPressed: () {
              setState(() {
                _controller.value.isPlaying
                    ? _controller.pause()
                    : _controller.play();
              });
            },
            child: Icon(getIconDataByPlayState()),
          ),
        ),
      ],
    );

    return Container(
      width: widget.width,
      height: widget.height,
      color: Colors.grey,
      child: root,
    );
  }
}
