import 'package:chat_app/Providers/AuthenticationData.dart';
import 'package:chat_app/Providers/CreateMethods.dart';
import 'package:chat_app/Providers/FetcherMethods.dart';
import 'package:chat_app/Screens/Authentication.dart';
import 'package:chat_app/Screens/MainScreen.dart';
import 'package:chat_app/Screens/SearchResultsScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import './Providers/Messages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();
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
        providers: [
          ChangeNotifierProvider.value(value: AuthenticationData()),
          ChangeNotifierProvider.value(value: Messages()),
          ChangeNotifierProvider.value(value: FetcherMethods()),
          ChangeNotifierProvider.value(value: CreateMethods()),
        ],
        child: MaterialApp(
          routes: {
            '/SearchScreen': (context) => SearchScreen(),
          },
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: ThemeData()
                .colorScheme
                .copyWith(primary: Colors.black, secondary: Colors.black),
          ),
          home: StreamBuilder(
              stream: FirebaseAuth.instance.authStateChanges(),
              builder: ((context, snapshot) {
                if (snapshot.hasData) {
                  return const MainScreen();
                } else if (snapshot.connectionState ==
                    ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else {
                  return const AuthenticationScreen();
                }
              })),
        ));
  }
}
