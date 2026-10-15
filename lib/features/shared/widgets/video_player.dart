import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:skill_in_a_box_flutter/core/constants/color_constants.dart';
import 'package:skill_in_a_box_flutter/core/utils/styles/text_style.dart';
import 'package:skill_in_a_box_flutter/features/my_courses/view_model/lesson_view_model/lesson_progress_view_model/lesson_progress_view_model.dart';
import 'package:skill_in_a_box_flutter/features/shared/view_model/mux_video_player_view_model/mux_video_player_state.dart';
import 'package:skill_in_a_box_flutter/features/shared/view_model/mux_video_player_view_model/mux_video_player_view_model.dart';
import 'package:skill_in_a_box_flutter/gen/assets.gen.dart';
import 'package:video_player/video_player.dart';

StateProvider<String> videoLanguageProvider =
StateProvider((ref) => 'English',);

class CustomMuxVideoPlayer extends ConsumerStatefulWidget {
  const CustomMuxVideoPlayer({
    required this.assetId,
    super.key,
    this.isRounded = true,
    this.isLessonSection = false,
    this.duration = 0.0,
    this.courseId = '',
    this.lessonId = '',
    this.sectionId = '',
  });
  final bool isRounded;
  final bool isLessonSection;
  final String assetId;
  final String courseId;
  final String sectionId;
  final String lessonId;
  final double duration;

  @override
  ConsumerState<CustomMuxVideoPlayer> createState() =>
      _CustomMuxVideoPlayerState();
}

class _CustomMuxVideoPlayerState extends ConsumerState<CustomMuxVideoPlayer>{
  VideoPlayerController? _videoPlayerController;
  ChewieController? _chewieController;
  bool _isLoading = true;
  Duration? _currentPosition;
  Duration? _totalDuration;


  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(microseconds: 10)).then((value) {
      _fetchPlaybackIdAndInitializePlayer();
    });
  }

  double durationToDouble(Duration duration) {
    return duration.inMilliseconds / 1000.0;
  }

  Duration doubleToDuration(double seconds) {
    return Duration(milliseconds: (seconds * 1000).toInt());
  }

  Future<void> _fetchPlaybackIdAndInitializePlayer() async {
    try {
      await ref.read(muxVideoPlayerViewModelNotifier.notifier)
          .fetchMuxAssetById(
        assetId: widget.assetId,
      );

      final state = ref.read(muxVideoPlayerViewModelNotifier);
      if (state is MuxVideoPlayerSuccess &&
          state.finalExamStatusModel.data?.playbackIds != null &&
          state.finalExamStatusModel.data!.playbackIds!.isNotEmpty) {
        final playbackId = state.finalExamStatusModel
            .data!.playbackIds!.first.id!;
        await _initializePlayer(playbackId);
      } else {
        throw Exception('Invalid or missing Playback ID');
      }
    } catch (error) {
      setState(() {
        _isLoading = false;
      });
    }
  }

  Future<void> _initializePlayer(String playbackId) async {
    final videoUrl = 'https://stream.mux.com/$playbackId.m3u8';
    _videoPlayerController = VideoPlayerController
        .networkUrl(Uri.parse(videoUrl));

    _videoPlayerController!.addListener(() {
      setState(() {
        _currentPosition = _videoPlayerController!.value.position;
        _totalDuration = _videoPlayerController!.value.duration;
      });
    });

    try {
      await _videoPlayerController!.initialize();
      _chewieController = ChewieController(
        videoPlayerController: _videoPlayerController!,
        autoPlay: true,
        startAt: Duration(seconds: widget.duration.toInt()),
        draggableProgressBar: widget.isLessonSection,
      );
      setState(() {
        _isLoading = false;
      });
    } catch (error) {
      setState(() {
        _isLoading = false;
      });
    }
  }


  void _handleVideoExit() {
    if (widget.isLessonSection) {
      var isFinished = false;
      if (_currentPosition != null && _currentPosition == _totalDuration) {
        isFinished = true;
      }
      final videoPosition = _currentPosition ?? Duration.zero;
      final progress = durationToDouble(videoPosition);
      Future.microtask(() {
        ref.read(lessonProgressViewModelProvider.notifier).updateLessonProgress(
          courseId: widget.courseId,
          sectionId: widget.sectionId,
          lessonId: widget.lessonId,
          currentProgress: progress,
          isFinished: isFinished,
        );
      });
    }
  }

  @override
  void dispose() {
    _videoPlayerController?.dispose();
    _chewieController?.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    final languageSelected = ref.watch(videoLanguageProvider);
    return PopScope(
      onPopInvokedWithResult: (didPop, result) {
        return _handleVideoExit();
      },
      child: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: const Radius.circular(20),
          topRight: const Radius.circular(20),
          bottomLeft: widget.isRounded
              ? const Radius.circular(20)
              : Radius.zero,
          bottomRight: widget.isRounded
              ? const Radius.circular(20)
              : Radius.zero,
        ),
        child: SizedBox(
          height: 234,
          width: double.infinity,
          child: Center(
            child: _isLoading
                ? const CircularProgressIndicator()
                : _chewieController != null
                ? Chewie(
              controller: _chewieController!,
              languageWidget: PopupMenuButton(
                color: Colors.white,
                child: SvgPicture.asset(
                  Assets.icons.internet,
                  width: 22,
                ),
                itemBuilder: (context) {
                  return [
                    PopupMenuItem(
                      child: Text(
                        'English',
                        style: subtitle1.copyWith(color:
                        languageSelected == 'English'
                            ? orange.shade500
                            :silverChalice.shade900,),
                      ),
                      onTap: () {
                        ref
                            .read(videoLanguageProvider.notifier)
                            .update((value) => 'English');
                      },
                    ),
                    PopupMenuItem(
                      child: Text('Hindi',
                        style: subtitle2.copyWith(color:
                        languageSelected == 'Hindi'
                            ? orange.shade500
                            :silverChalice.shade900,),),
                      onTap: () {
                        ref
                            .read(videoLanguageProvider.notifier)
                            .update((value) => 'Hindi');
                      },
                    ),
                  ];
                },
              ),
            )
                : const Text('Failed to load video'),
          ),
        ),
      ),
    );
  }
}
