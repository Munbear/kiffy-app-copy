import 'package:Kiffy/config/firebase/dev/firebase_options.dart';
import 'package:Kiffy/config/firebase/prod/firebase_options.dart';
import 'package:Kiffy/kiffy_app.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_flavor/flutter_flavor.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

FlavorConfig getFlavorConfig(String? flavor) {
  switch (flavor) {
    case "prod":
      return FlavorConfig(
        name: "prod",
        variables: {
          "isDebuggle": false,
          "appTitle": "kiffy",
          "apiUrl": "https://api.kiffy.club",
          // "afDevKey": "",
        },
      );
    default:
      return FlavorConfig(
        name: "dev",
        variables: {
          "isDebuggle": true,
          "appTitle": "[DEV] kiffy",
          "apiUrl": "http://api.dev.kiffy.club",
          // "afDevKey": "",
        },
      );
  }
}

FirebaseOptions getFirebaseOptions(String? flavor) {
  switch (flavor) {
    case "prod":
      return ProdFirebaseOptions.currentPlatform;
    default:
      return DevFirebaseOptions.currentPlatform;
  }
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  String? flavor =
      await const MethodChannel("flavor").invokeMethod<String>("getFlavor");
  getFlavorConfig(flavor);

  await Firebase.initializeApp(
    name: FlavorConfig.instance.name,
    options: getFirebaseOptions(flavor),
  );

  runApp(
    EasyLocalization(
      path: 'assets/translations',
      supportedLocales: const [Locale('id')],
      fallbackLocale: const Locale('id'),
      startLocale: const Locale("ko"),
      useFallbackTranslations: true,
      saveLocale: true,
      useOnlyLangCode: true,
      child: const ProviderScope(child: KiffyApp()),
    ),
  );
}
