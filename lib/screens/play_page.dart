import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:jlpt_learn/components/fancy_button.dart';
import 'package:jlpt_learn/screens/mix_and_match_page.dart';

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

  // void listenShareText(BuildContext context) {
  //   ReceiveSharingIntent.getTextStream().listen((String value) {
  //     _methodChannel.invokeMethod('showSheet');
  //   }, onError: (err) {
  //     debugPrint("$err");
  //   });
  // }

  // static const MethodChannel _methodChannel =
  //     MethodChannel('com.jlptlearn.mixandmatch/add_new_word');

  Future<void> _showAddButtonSheet() async {
    // final platformCounter = await _methodChannel.invokeMethod('showSheet');
  }

  Widget _button(GameType key, String child, [String? label]) {
    final ThemeData theme = Theme.of(context);
    return Padding(
        padding: const EdgeInsets.fromLTRB(0.0, 0.0, 8.0, 12.0),
        child: FancyButton(
            size: 30,
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(_selected == key
                  ? theme.colorScheme.primaryContainer
                  : const Color(0xFF607D8B)),
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
        IconButton(icon: const Icon(Icons.add), onPressed: _showAddButtonSheet)
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
