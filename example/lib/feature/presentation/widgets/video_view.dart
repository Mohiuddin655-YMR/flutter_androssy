import 'package:flutter/material.dart';
import 'package:flutter_androssy/widgets.dart';
import 'package:pod_player/pod_player.dart';

class VideoView extends StatefulWidget {
  final bool loopingEnable;
  final bool autoPlay;
  final double? borderRadius;
  final double? width, height;
  final double? space;
  final dynamic video;
  final String? videoThumbnail;
  final VideoType videoType;

  const VideoView({
    Key? key,
    this.autoPlay = true,
    this.loopingEnable = false,
    this.borderRadius,
    this.width,
    this.height,
    this.space,
    this.video,
    this.videoThumbnail,
    this.videoType = VideoType.none,
  }) : super(key: key);

  @override
  State<VideoView> createState() => _VideoViewState();
}

class _VideoViewState extends State<VideoView> with WidgetsBindingObserver {
  late PodPlayerController _controller;
  late Size size = MediaQuery.of(context).size;

  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    _controller = PodPlayerController(
      podPlayerConfig: PodPlayerConfig(
        autoPlay: widget.autoPlay,
        isLooping: widget.loopingEnable,
      ),
      playVideoFrom: player,
    )..initialise();
    super.initState();
  }

  @override
  void didUpdateWidget(covariant VideoView oldWidget) {
    WidgetsBinding.instance.addObserver(this);
    super.didUpdateWidget(oldWidget);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    state.logValueType;
    if (state == AppLifecycleState.paused ||
        state == AppLifecycleState.hidden ||
        state == AppLifecycleState.inactive) {
      _controller.pause();
    }
    if (state == AppLifecycleState.resumed) {
      _controller.play();
    }
    super.didChangeAppLifecycleState(state);
  }

  PlayVideoFrom get player {
    final video = widget.video ?? '';
    final type = (video.contains('https://www.youtube.com/') ||
            video.contains('https://youtu.be/'))
        ? VideoType.youtube
        : VideoType.none;
    switch (type) {
      case VideoType.asset:
        return PlayVideoFrom.asset(video);
      case VideoType.file:
        return PlayVideoFrom.file(video);
      case VideoType.vimeo:
        return PlayVideoFrom.vimeo(video);
      case VideoType.youtube:
        return PlayVideoFrom.youtube(video);
      case VideoType.none:
      default:
        return PlayVideoFrom.network(video);
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          widget.borderRadius ?? 0,
        ),
      ),
      margin: EdgeInsets.all(widget.space ?? 0),
      child: PodVideoPlayer(
        controller: _controller,
        videoThumbnail: widget.videoThumbnail != null
            ? DecorationImage(
                fit: BoxFit.fill,
                image: NetworkImage(
                  widget.videoThumbnail!,
                ),
              )
            : null,
      ),
    );
  }

  bool get isBuffering => _controller.isVideoBuffering;

  bool get isInitialized => _controller.isInitialised;

  bool get isLooping => _controller.isVideoLooping;

  bool get isPlaying => _controller.isVideoPlaying;

  void onPause() => _controller.pause();

  void onPlay() => _controller.play();
}

enum VideoType {
  none,
  asset,
  file,
  youtube,
  vimeo,
}
