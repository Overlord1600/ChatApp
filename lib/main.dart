import 'package:chat_app/Providers/AuthenticationData.dart';
import 'package:chat_app/Screens/Authentication.dart';
import 'package:chat_app/Screens/PublicChat.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider.value(value: AuthenticationData())],
      child: FutureBuilder(
        future: Firebase.initializeApp(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return MaterialApp(
              title: 'Flutter Demo',
              theme: ThemeData(
                primarySwatch: Colors.blue,
              ),
              home: StreamBuilder(
                  stream: FirebaseAuth.instance.authStateChanges(),
                  builder: ((context, snapshot) {
                    if (snapshot.hasData) {
                      return const PublicChatScreen();
                    } else if (snapshot.connectionState ==
                        ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    } else {
                      return const AuthenticationScreen();
                    }
                  })),
            );
          } else {
            return const CircularProgressIndicator();
          }
        },
      ),
    );
  }
}
