import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:jlpt_learn/components/linear_border.dart';
import 'package:jlpt_learn/screens/login_page.dart';
import 'package:go_router/go_router.dart';
import 'package:jlpt_learn/screens/play_page.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await initHiveForFlutter();
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static GoRouter get _router => GoRouter(routes: [
    GoRoute(path: '/', builder: (context, state) => LoginPage()),
    GoRoute(
      path: '/play',
      builder: (context, state) => const PlayPage(),
    )
  ],debugLogDiagnostics: true);

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
        child: MaterialApp.router(
          title: 'JLPT Learn',
          theme: ThemeData(
              primarySwatch: Colors.blue,
              fontFamily: 'NotoSans',
              filledButtonTheme: FilledButtonThemeData(
                  style: FilledButton.styleFrom(
                      elevation: 0,
                      shape: LinearBorder.bottom(
                          side: const BorderSide(
                              width: 4, color: Color(0x33000000)))))),
          routerConfig: _router,
        ));
  }
}
