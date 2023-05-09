import 'package:flutter/material.dart';
import 'package:graphql/client.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:jlpt_learn/components/fancy_button.dart';
import 'package:jlpt_learn/schema/mobile_game.graphql.dart';
import 'package:tuple/tuple.dart';

enum GameType { kanjiToText, kanaToText, kanjiToKana }

abstract class FancyButtonColors {
  static const Color unpressedBg = Color(0xFFE0E0E0);
  static const Color unpressedFg = Color(0xFF424242);
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

typedef _ButtonPayload = Tuple3<String, String, String>;

class _MixAndMatchGame extends StatelessWidget {
  const _MixAndMatchGame({required this.result, required this.gameType});

  final QueryResult<Query$MobileGame> result;
  final GameType gameType;

  List<_ButtonPayload> _select() {
    String getFirst(Query$MobileGame$words e) {
      return (gameType == GameType.kanjiToKana ||
              gameType == GameType.kanjiToText)
          ? e.word
          : e.pronounce;
    }

    String getSecond(Query$MobileGame$words e) {
      return (gameType == GameType.kanaToText ||
              gameType == GameType.kanjiToText)
          ? e.explain
          : e.pronounce;
    }

    final wordList = result.parsedData!.words!;
    wordList.shuffle();
    final first = wordList
        .sublist(0, 5)
        .map((e) => Tuple3(getFirst(e), "", e.word))
        .toList();
    final second = wordList
        .sublist(0, 5)
        .map((e) => Tuple3(getSecond(e), getFirst(e), e.word))
        .toList();
    second.shuffle();

    final rs = <_ButtonPayload>[];
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
            child: WordButton(
              payload: selected[i],
              pos: i % 2,
            ),
          )
      ],
    );
  }
}

class WordButton extends StatelessWidget {
  const WordButton({super.key, required this.payload, required this.pos});

  final _ButtonPayload payload;
  final int pos;

  @override
  Widget build(BuildContext context) {
    return FancyButton(
      size: 30,
      backgroundColor: FancyButtonColors.unpressedBg,
      foregroundColor: FancyButtonColors.unpressedFg,
      child: Text(
        payload.item1,
        style: TextStyle(
            fontFamily: pos == 0 ? 'NotoSansJP' : 'NotoSans',
            fontSize: pos == 0 ? 20 : 14,
            fontWeight: FontWeight.w400),
      ),
    );
  }
}
