import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'config/constants/contstants.dart';
import 'config/firebase/firebase_options.dart';
import 'main.dart';

// enum Environment { dev, prod }

class Env {
  Future<void> main() async {
    WidgetsFlutterBinding.ensureInitialized();
    Constants.setEnvironment(Environment.Local);
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    ); //.whenComplete(() => {});
    await EasyLocalization.ensureInitialized();

    runApp(
      EasyLocalization(
        path: 'assets/translations',
        //지원할 언어
        supportedLocales: const [Locale('ko'), Locale('id')],
        // 지원되지 않은 언어로 접속할때 보여질 언어
        fallbackLocale: const Locale('id'),
        // 기본 언어
        startLocale: const Locale('id'),
        useFallbackTranslations: true,
        child: const ProviderScope(
          child: KiffyApp(),
        ),
      ),
    );
  }
}
