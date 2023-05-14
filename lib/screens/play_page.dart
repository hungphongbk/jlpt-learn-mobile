import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:jlpt_learn/components/fancy_button.dart';
import 'package:jlpt_learn/context/add_new_word.dart';
import 'package:jlpt_learn/schema/list_metadata.graphql.dart';
import 'package:jlpt_learn/screens/mix_and_match_page.dart';
import 'package:provider/provider.dart';

class GameLevel{
  final int count;
  final String label;

  GameLevel({required this.count, required this.label});

  static final GameLevel easy = GameLevel(count: 20, label: "Dễ (5 x 4)");
  static final GameLevel middle = GameLevel(count: 30, label: "TB (5 x 6)");
  static final GameLevel hard = GameLevel(count: 40, label: "Khó (5 x 8)");
}

class PlayPage extends StatefulWidget {
  const PlayPage({super.key});

  @override
  _PlayPageState createState() => _PlayPageState();
}

class _PlayPageState extends State<PlayPage> {
  @override
  void initState() {
    super.initState();
    // SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
    //   listenShareText(context);
    // });
  }

  GameType? _selected;
  final Set<String> _tags = {};
  int _count=0;

  MaterialStateProperty<Color> _getColorBySelectedState(bool selected) {
    final ThemeData theme = Theme.of(context);
    return MaterialStateProperty.all(selected
        ? theme.colorScheme.primaryContainer
        : const Color(0xFF607D8B));
  }

  Widget _button(GameType key, String child, [String? label]) {
    return Padding(
        padding: const EdgeInsets.fromLTRB(0.0, 0.0, 8.0, 12.0),
        child: FancyButton(
            size: 30,
            style: ButtonStyle(
              backgroundColor: _getColorBySelectedState(_selected == key),
            ),
            onPressed: () {
              setState(() {
                _selected = key;
              });
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                label != null
                    ? Text(label, style: const TextStyle(fontSize: 20.0))
                    : const SizedBox.shrink(),
                Text(child, style: const TextStyle(color: Colors.white70))
              ],
            )));
  }

  @override
  Widget build(BuildContext context) {
    // final ThemeData theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Mix and match'), actions: [
        Consumer<AddNewWord>(
            builder: (context, hub, child) => IconButton(
                icon: const Icon(Icons.add), onPressed: () => hub.show()))
      ]),
      body: Padding(
          padding: const EdgeInsets.only(
              left: 24.0, right: 24.0, top: 24.0, bottom: 28.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Chọn hình thức",
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.black54,
                      fontWeight: FontWeight.w600)),
              const SizedBox(height: 16.0),
              Wrap(direction: Axis.horizontal, children: <Widget>[
                _button(GameType.kanjiToText, "Kanji / Nghĩa", "漢字 / Aa"),
                _button(GameType.kanaToText, "Kana / Nghĩa", "かな / Aa"),
                _button(GameType.kanjiToKana, "Kanji / Kana", "漢字 / かな"),
              ]),
              const Text("Chọn một hoặc nhiều set từ",
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.black54,
                      fontWeight: FontWeight.w600)),
              const SizedBox(height: 16.0),
              Query$FlutterAllMetadata$Widget(
                  builder: (result, {fetchMore, refetch}) {
                if (result.parsedData != null) {
                  return Wrap(
                      direction: Axis.horizontal,
                      children: result.parsedData!.tags!
                          .map<Widget>((e) => Padding(
                              padding: const EdgeInsets.fromLTRB(
                                  0.0, 0.0, 8.0, 12.0),
                              child: FancyButton(
                                  onPressed: () {
                                    setState(() {
                                      if (!_tags.contains(e.id)) {
                                        _tags.add(e.id);
                                      } else {
                                        _tags.remove(e.id);
                                      }
                                    });
                                  },
                                  size: 30,
                                  style: ButtonStyle(
                                      backgroundColor: _getColorBySelectedState(
                                          _tags.contains(e.id))),
                                  child: Text(e.label))))
                          .toList());
                }
                return const Text('loading...');
              }),
              const Text("Chọn độ khó",
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.black54,
                      fontWeight: FontWeight.w600)),
              const SizedBox(height: 16.0),
          Wrap(direction: Axis.horizontal, children: [GameLevel.easy,GameLevel.middle,GameLevel.hard].map((e) => Padding(
              padding: const EdgeInsets.fromLTRB(
                  0.0, 0.0, 8.0, 12.0),
              child: FancyButton(
                  onPressed: () {
                    setState(() {
                      _count = e.count;
                    });
                  },
                  size: 30,
                  style: ButtonStyle(
                      backgroundColor: _getColorBySelectedState(
                          _count==e.count)),
                  child: Text(e.label))
          )).toList()),
              const Spacer(),
              SizedBox(
                width: double.infinity,
                child: FancyButton(
                    size: 40,
                    disabled: _selected == null,
                    onPressed: () {
                      context.pushNamed('game',
                          queryParameters: {'gameType': _selected!.name});
                    },
                    child:
                        const Text("BẮT ĐẦU", style: TextStyle(fontSize: 20))),
              )
            ],
          )),
    );
  }
}
