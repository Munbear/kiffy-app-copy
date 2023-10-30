import 'package:Kiffy/config/firebase/prod/firebase_options.dart';
import 'package:Kiffy/kiffy_app.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_flavor/flutter_flavor.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// class Config{
//   final String baseUrl;
//   final String token;
//
//   Config._dev():
//         baseUrl = '',		// dev url
//         token = '';		// dev token
//
//   Config._product():
//         baseUrl = '',	// product url
//         token = '';		// product token
//
//   factory Config (String? _flavor) {
//     if (_flavor == 'dev'){
//       instance = Config._dev();
//       (_flavor == 'product'){
//         instance = Config._product();
//       }else {
//       throw Exception("Unknown flaver : $_flavor}");
//     }
//
//     return instance;
//   }
//
//     static late final Config instance;
//   }
// }

FlavorConfig getFlavorConfig(String? flavor) {
  switch (flavor) {
    case "prod":
      return FlavorConfig(
        name: "prod",
        variables: {
          "isDebuggle": false,
          "appTitle": "kiffy",
          "apiUrl": "http://api-dev.kiffy.club",
          // "afDevKey": "",
        },
      );
    default:
      return FlavorConfig(
        name: "dev",
        variables: {
          "isDebuggle": false,
          "appTitle": "[DEV] kiffy",
          "apiUrl": "http://api-dev.kiffy.club",
          // "afDevKey": "",
        },
      );
  }
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  String? flavor =
      await const MethodChannel("flavor").invokeMethod<String>("getFlavor");
  getFlavorConfig(flavor);

  await Firebase.initializeApp(
    name: "Kiffy",
    options: ProdFirebaseOptions.currentPlatform,
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
