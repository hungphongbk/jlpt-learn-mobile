import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

enum GameType {
  kanjiToText,
  kanaToText,
  kanjiToKana
}

class MixAndMatchPage extends StatefulWidget {
  const MixAndMatchPage({super.key, required this.gameType});

  final GameType gameType;

  @override
  State<StatefulWidget> createState() {
    return _MixAndMatchState();
  }

}

class _MixAndMatchState extends State<MixAndMatchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mix and match'),
      ),
    );
  }
}