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

  // teal
  static const Color pressedBg = Color(0xFF80CBC4); // teal200
  static const Color pressedFg = Color(0xFF00796B); // teal700
}

// class MixAndMatchPage extends StatefulWidget {
//   const MixAndMatchPage({super.key, required this.gameType});
//
//   final GameType gameType;
//
//   @override
//   State<StatefulWidget> createState() {
//     return _MixAndMatchState();
//   }
// }

class MixAndMatchPage extends StatelessWidget {
  const MixAndMatchPage({super.key, required this.gameType});

  final GameType gameType;

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
                  gameType: gameType,
                );
              }
              return const Text('loading...');
            },
          ),
        ));
  }
}

typedef _ButtonPayload = Tuple3<String, String, String>;

class _MixAndMatchGame extends StatefulWidget {
  const _MixAndMatchGame({required this.result, required this.gameType});

  final QueryResult<Query$MobileGame> result;
  final GameType gameType;

  @override
  State<StatefulWidget> createState() {
    return _MixAndMatchGameState();
  }
}

class _MixAndMatchGameState extends State<_MixAndMatchGame> {
  List<_ButtonPayload>? _shuffled;
  _ButtonPayload? predicate;

  @override
  void initState() {
    super.initState();
    _shuffle();
  }

  void _shuffle() {
    final gameType = widget.gameType;
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

    final wordList = widget.result.parsedData!.words!;
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

    setState(() {
      _shuffled = rs;
    });
  }

  void _select(_ButtonPayload pressed) {
    if (pressed.item2.isEmpty) {
      setState(() {
        predicate = pressed;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      crossAxisSpacing: 16,
      mainAxisSpacing: 10,
      primary: false,
      childAspectRatio: 2,
      children: [
        for (var i = 0; i < (_shuffled?.length ?? 0); i++)
          Container(
            padding: const EdgeInsets.only(bottom: 6.0),
            child: WordButton(
              payload: _shuffled![i],
              pos: i % 2,
              predicate: predicate,
              onPressed: (){
                _select(_shuffled![i]);
              },
            ),
          )
      ],
    );
  }
}

class WordButton extends StatelessWidget {
  const WordButton(
      {super.key, required this.payload, required this.pos, this.predicate, required this.onPressed});

  final _ButtonPayload payload;
  final _ButtonPayload? predicate;
  final int pos;
  final VoidCallback onPressed;

  bool get tapped {
    return predicate == payload;
  }

  @override
  Widget build(BuildContext context) {
    return FancyButton(
      onPressed: onPressed,
      size: 30,
      backgroundColor:
          tapped ? FancyButtonColors.pressedBg : FancyButtonColors.unpressedBg,
      foregroundColor:
          tapped ? FancyButtonColors.pressedFg : FancyButtonColors.unpressedFg,
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
