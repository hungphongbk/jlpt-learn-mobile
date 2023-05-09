import 'package:flutter/material.dart';
import 'package:graphql/client.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:jlpt_learn/components/fancy_button.dart';
import 'package:jlpt_learn/schema/mobile_game.graphql.dart';

enum GameType { kanjiToText, kanaToText, kanjiToKana }

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
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Query$MobileGame$Widget(
            builder: (result, {fetchMore, refetch}) {
              if (result.parsedData != null) {
                return _MixAndMatchGame(
                  result: result,
                  gameType: widget.gameType,
                );
              }
              return const Text('loading...');
            },
          ),
        ));
  }
}

class _MixAndMatchGame extends StatelessWidget {
  const _MixAndMatchGame({required this.result, required this.gameType});

  final QueryResult<Query$MobileGame> result;
  final GameType gameType;

  List<String> _select() {
    final wordList = result.parsedData!.words!;
    wordList.shuffle();
    final first = wordList
        .sublist(0, 5)
        .map((e) => (gameType == GameType.kanjiToKana ||
                gameType == GameType.kanjiToText)
            ? e.word
            : e.pronounce)
        .toList();
    final second = wordList
        .sublist(0, 5)
        .map((e) => (gameType == GameType.kanaToText ||
                gameType == GameType.kanjiToText)
            ? e.explain
            : e.pronounce)
        .toList();
    second.shuffle();

    final rs = <String>[];
    for (var i = 0; i < 5; i++) {
      rs.add(first[i]);
      rs.add(second[i]);
    }
    return rs;
  }

  @override
  Widget build(BuildContext context) {
    final selected = _select();
    return GridView.count(
      crossAxisCount: 2,
      crossAxisSpacing: 16,
      mainAxisSpacing: 10,
      primary: false,
      childAspectRatio: 2,
      children: [
        for (var i = 0; i < selected.length; i++)
          Container(
            padding: const EdgeInsets.only(bottom: 6.0),
            child: FancyButton(
              size: 30,
              child: Text(
                selected[i],
                style: TextStyle(
                    fontFamily: i % 2 == 0 ? 'NotoSansJP' : 'NotoSans',
                    fontSize: i % 2 == 0 ? 20 : 14,
                    fontWeight: FontWeight.w400),
              ),
            ),
          )
      ],
    );
  }
}
