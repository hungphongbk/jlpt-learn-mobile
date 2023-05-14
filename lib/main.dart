import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:jlpt_learn/context/add_new_word.dart';
import 'package:jlpt_learn/screens/login_page.dart';
import 'package:go_router/go_router.dart';
import 'package:jlpt_learn/screens/mix_and_match_page.dart';
import 'package:jlpt_learn/screens/play_page.dart';
import 'package:provider/provider.dart';
import 'package:receive_sharing_intent/receive_sharing_intent.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await initHiveForFlutter();
  runApp(const MyApp());
}

final router = GoRouter(routes: [
  GoRoute(path: '/', builder: (context, state) => const LoginPage()),
  GoRoute(
    path: '/play',
    builder: (context, state) => const PlayPage(),
  ),
  GoRoute(
      path: '/game',
      name: 'game',
      builder: (context, state) => MixAndMatchPage(
          gameType: GameType.values.byName(state.queryParameters['gameType']!),
          count: int.parse(state.queryParameters['count']!),
          tags: state.queryParameters['tags']!.split(',')))
], debugLogDiagnostics: true);

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  _MyApp createState() {
    return _MyApp();
  }
}

class _MyApp extends State<MyApp> {
  late AddNewWord addNewWord;

  @override
  void initState() {
    super.initState();
    addNewWord = AddNewWord();
    addNewWord.init(context);
  }

  @override
  void dispose() {
    addNewWord.dispose();
    super.dispose();
  }

  static const MethodChannel _methodChannel =
      MethodChannel('com.jlptlearn.mixandmatch/add_new_word');

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final HttpLink httpLink = HttpLink(
      'https://jlpt-learn-hungphongbk.vercel.app/api/graphql',
    );

    ValueNotifier<GraphQLClient> client = ValueNotifier(
      GraphQLClient(
        link: httpLink,
        // The default store is the InMemoryStore, which does NOT persist to disk
        cache: GraphQLCache(store: HiveStore()),
      ),
    );
    return GraphQLProvider(
        client: client,
        child: MultiProvider(
          providers: [
            Provider(create: (context) => addNewWord),
          ],
          child: MaterialApp.router(
            title: 'JLPT Learn',
            theme: ThemeData(
              primarySwatch: Colors.blue,
              fontFamily: 'NotoSans',
            ),
            routerConfig: router,
          ),
        ));
  }
}
