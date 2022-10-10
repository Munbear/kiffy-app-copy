import 'package:Kiffy/global/firebase/firebase_options.dart';
import 'package:Kiffy/global/router/route.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initDefault();
  runApp(const KiffyApp());
}

Future<void> initDefault() async {
  FirebaseApp app = await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
}

class KiffyApp extends StatelessWidget {
  const KiffyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => MaterialApp.router(
        routerConfig: routes,
        title: "KIFFY",
      );
}
