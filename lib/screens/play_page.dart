import 'package:flutter/material.dart';
import 'package:jlpt_learn/components/fancy_button.dart';

class PlayPage extends StatefulWidget {
  const PlayPage({super.key});

  @override
  _PlayPageState createState() => _PlayPageState();
}
class _PlayPageState extends State<PlayPage> {
  String _selected = "";

  Widget _button(String key,String child, [String? label]) {
    return Padding(
        padding: const EdgeInsets.fromLTRB(0.0, 0.0, 8.0, 12.0),
        child: FancyButton(
            size: 30,
            onPressed: (){
              setState(() {
                _selected = key;
              });
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                label != null ? Text(label,style: const TextStyle(fontSize: 20.0)) : const SizedBox.shrink(),
                Text(child,
                    style: const TextStyle(color: Colors.white70))
              ],
            )));
  }

  @override
  Widget build(BuildContext context) {
    // final ThemeData theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Mix and match'),
      ),
      body: Padding(
          padding: const EdgeInsets.only(left: 24.0, right: 24.0, top: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Chọn hình thức",style:TextStyle(
                fontSize: 20,
                color: Colors.black54,
                fontWeight: FontWeight.w600
              )),
              const SizedBox(height: 16.0),
              Wrap(direction: Axis.horizontal, children: <Widget>[
                _button("0","Kanji / Nghĩa", "漢字 / Aa"),
                _button("1","Kana / Nghĩa", "かな / Aa"),
                _button("2","Kanji / Kana","漢字 / かな"),
              ]),
              const SizedBox(height: 32.0),
              Text(_selected)
            ],
          )),
    );
  }
}
