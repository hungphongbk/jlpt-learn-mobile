import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:jlpt_learn/components/fancy_button.dart';

Future<UserCredential> signInWithGoogle() async {
  final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

  // Obtain the auth details from the request
  final GoogleSignInAuthentication? googleAuth =
      await googleUser?.authentication;

  // Create a new credential
  final credential = GoogleAuthProvider.credential(
    accessToken: googleAuth?.accessToken,
    idToken: googleAuth?.idToken,
  );

  // Once signed in, return the UserCredential
  return await FirebaseAuth.instance.signInWithCredential(credential);
}

class LoginPage extends StatefulWidget{
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  Future<FirebaseApp> _initializeFirebase() async {
    FirebaseApp firebaseApp = await Firebase.initializeApp();
    User? user = FirebaseAuth.instance.currentUser;
    if(user!=null){
      if(context.mounted) context.pushReplacement('/play');
    }
    return firebaseApp;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Firebase Authentication'),
      ),
      body: FutureBuilder(
        future: _initializeFirebase(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Padding(
                padding:
                    const EdgeInsets.only(left: 24.0, right: 24.0, top: 48.0),
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Expanded(
                    child: FancyButton(
                      onPressed: () async {
                        UserCredential? user = await signInWithGoogle();
                        // ignore: use_build_context_synchronously
                        if (!context.mounted) return;
                        if (user != null) {
                          context.pushReplacement('/play');
                        }
                      },
                      size:50,
                      child: Text('Đăng nhập Google'.toUpperCase(),textAlign: TextAlign.center,),
                      // style: FilledButton.styleFrom(
                      //     elevation: 0,
                      //     side: const BorderSide(width: 2, color: Color(0xFF000000)),
                      //     shape: LinearBorder.bottom()
                      // ),
                    ),
                  )
                ]));
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
