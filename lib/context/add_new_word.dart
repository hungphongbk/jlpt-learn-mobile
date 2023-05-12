import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:receive_sharing_intent/receive_sharing_intent.dart';

class AddNewWord {
  late StreamSubscription streamConnectionStatus;
  static const MethodChannel _methodChannel =
      MethodChannel('com.jlptlearn.mixandmatch/add_new_word');

  void init(BuildContext context) {
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      if (kDebugMode) {
        print("Listening...");
      }
      _listenShareText(context);
    });
  }

  void show([String initialWord = ""]) {
    _methodChannel.invokeMethod('showSheet', initialWord);
  }

  void _listenShareText(BuildContext context) {
    streamConnectionStatus =
        ReceiveSharingIntent.getTextStream().listen((String value) {
      if (kDebugMode) {
        print("$value");
      }
      show(value);
    }, onError: (err) {
      debugPrint("$err");
    });
  }

  void dispose() {
    try {
      streamConnectionStatus.cancel();
    } catch (exception) {
      if (kDebugMode) {
        print(exception.toString());
      }
    }
  }
}
