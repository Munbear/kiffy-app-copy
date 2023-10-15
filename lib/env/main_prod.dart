import 'dart:io';

import 'package:Kiffy/config/firebase/prod/firebase_options.dart';
import 'package:Kiffy/kiffy_app.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_flavor/flutter_flavor.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

Future<void> main() async {
  FlavorConfig(
    name: "dev",
    variables: {
      "isDebuggle": false,
      "appTitle": "[DEV] kiffy",
      "apiUrl": "http://api-dev.kiffy.club",
      // "afDevKey": "",
    },
  );

  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  await Firebase.initializeApp(
    name: "Kiffy-dev",
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    EasyLocalization(
      path: 'assets/translations',
      supportedLocales: const [Locale('ko'), Locale('id')],
      fallbackLocale: const Locale('id'),
      startLocale: const Locale("id"),
      useFallbackTranslations: true,
      saveLocale: true,
      useOnlyLangCode: true,
      child: const ProviderScope(child: KiffyApp()),
    ),
  );
}
