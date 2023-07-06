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

class _AssetsVideoState extends State<AssetsVideo> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset(widget.filePath);
    _controller.initialize().then((_) => setState(() {}));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Stack root = Stack(
      alignment: Alignment.center, // 设置子级小部件的对齐方式
      children: [
        //VideoPlayer(_controller),
        Center(
            child: SizedBox.expand(
                child: FittedBox(
          fit: BoxFit.cover,
          child: SizedBox(
              height: widget.width,
              width: widget.height,
              child: VideoPlayer(_controller)),
        ))),
        Positioned(
          bottom: 0,
          child: SizedBox(
            width: widget.width,
            child: VideoProgressIndicator(
              _controller,
              allowScrubbing: false,
            ),
          ),
        ),
        Positioned(

          child:FloatingActionButton(
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

          // child: IconButton(
          //   onPressed: () {
          //     setState(() {
          //       _controller.value.isPlaying
          //           ? _controller.pause()
          //           : _controller.play();
          //     });
          //   },
          //   icon: Icon(
          //     color: Colors.white,
          //     _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
          //   ),
          // ),
        ),
      ],
    );

    return SizedBox(
      width: widget.width,
      height: widget.height,
      child: Container(
        color: Colors.grey,
        child: root,
      ),
    );
  }
}
