import 'dart:async';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class AudioPlayerScreen extends StatefulWidget {
  final String audioUrl; // 오디오 파일 URL

  const AudioPlayerScreen({Key? key, required this.audioUrl}) : super(key: key);

  @override
  _AudioPlayerScreenState createState() => _AudioPlayerScreenState();
}

class _AudioPlayerScreenState extends State<AudioPlayerScreen> {
  late AudioPlayer _audioPlayer;
  bool _isPlaying = false;

  //스트림 구독을 위한 변수
  late StreamSubscription _playSubscription;
  late StreamSubscription _playerSubscription;

  @override
  void initState() {
    super.initState();
    _audioPlayer = AudioPlayer();
    _audioPlayer.setSourceUrl(widget.audioUrl);
    _playSubscription =
        _audioPlayer.onPlayerStateChanged.listen((PlayerState state) {
      setState(() {
        _isPlaying = _audioPlayer.state == PlayerState.playing;
      });
    });
    _playerSubscription = _audioPlayer.onPlayerComplete.listen((event) {
      setState(() {
        _isPlaying = false;
      });
    });
  }

  @override
  void dispose() {
    _playSubscription.cancel();
    _playerSubscription.cancel();
    _audioPlayer.dispose();

    super.dispose();
  }

  void _togglePlay() {
    if (_isPlaying) {
      _audioPlayer.pause();
    } else {
      _audioPlayer.play(UrlSource(widget.audioUrl));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('오디오 재생'),
      ),
      body: Center(
        child: IconButton(
          icon: Icon(_isPlaying ? Icons.pause : Icons.play_arrow),
          iconSize: 64.0,
          onPressed: _togglePlay,
        ),
      ),
    );
  }
}
