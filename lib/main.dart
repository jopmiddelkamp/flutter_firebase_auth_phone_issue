import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(
        title: 'Flutter Demo Home Page',
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
    required this.title,
  });

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextFormField(),
            Row(
              children: [
                ElevatedButton(
                  onPressed: () {
                    FirebaseAuth.instance.verifyPhoneNumber(
                      phoneNumber: '+31 644176090',
                      verificationCompleted: (PhoneAuthCredential credential) {
                        print('verificationCompleted');
                      },
                      verificationFailed: (FirebaseAuthException e) {
                        print('verificationFailed');
                      },
                      codeSent: (String verificationId, int? resendToken) {
                        print('codeSent');
                      },
                      codeAutoRetrievalTimeout: (String verificationId) {
                        print('codeAutoRetrievalTimeout');
                      },
                    );
                  },
                  child: const Text('Send SMS'),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
