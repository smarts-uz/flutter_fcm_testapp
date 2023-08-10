// ignore_for_file: unused_import

import 'package:fcm_testapp/home_page.dart';
import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_in_app_messaging/firebase_in_app_messaging.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:overlay_support/overlay_support.dart';
import 'firebase_options.dart';

Future firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  debugPrint("Handling a background message: ${message.messageId}");
}

/// THIS IS AN EXAMPLE TO SEND APP CHECK TOKEN IN HEADER IN API REQUEST
/// TOKEN MUST BE HANDLED ACCORDINGLY IN THE SERVER

// void callApiExample() async {
//   final appCheckToken = await FirebaseAppCheck.instance.getToken();
//   if (appCheckToken != null) {
//     final response = await http.get(
//       Uri.parse("https://yourbackend.example.com/yourExampleEndpoint"),
//       headers: {"X-Firebase-AppCheck": appCheckToken},
//     );
//   } else {
//     // Error: couldn't get an App Check token.
//   }
// }

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await FirebaseAppCheck.instance.activate(
    androidProvider: AndroidProvider.playIntegrity,
    appleProvider: AppleProvider.deviceCheck,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return OverlaySupport(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Firebase FCM TestApp',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const HomePage(),
      ),
    );
  }
}
