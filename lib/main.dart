import 'package:Kiffy/config/constants/contstants.dart';
import 'package:Kiffy/config/firebase/firebase_options.dart';
import 'package:Kiffy/config/router/route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// 변경 라우팅 설정
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Constants.setEnvironment(Environment.Local);
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  ).whenComplete(() => {});
  await EasyLocalization.ensureInitialized();

  runApp(
    EasyLocalization(
      path: 'assets/translations',
      supportedLocales: const [Locale('ko', 'KR'), Locale('id', 'ID')],
      fallbackLocale: const Locale('id', 'ID'),
      startLocale: const Locale('id', 'ID'),
      useFallbackTranslations: true,
      child: const ProviderScope(
        child: KiffyApp(),
      ),
    ),
  );
}

//변경 라우팅 설정
class KiffyApp extends HookConsumerWidget {
  const KiffyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);

    return MaterialApp.router(
      // 디버깅 라벨 제거
      debugShowCheckedModeBanner: false,
      // 다국어 설정
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      // 라우팅 설정
      routeInformationProvider: router.routeInformationProvider,
      routeInformationParser: router.routeInformationParser,
      routerDelegate: router.routerDelegate,
      title: "KIFFY",
    );
  }
}
