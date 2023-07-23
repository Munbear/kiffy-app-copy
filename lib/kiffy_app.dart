// import 'package:Kiffy/config/constants/contstants.dart';
// import 'package:Kiffy/config/firebase/prod/firebase_options.dart';
import 'package:Kiffy/config/router/route.dart';
import 'package:easy_localization/easy_localization.dart';
// import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'env/env.dart';

// Future<void> main() async {
//   // WidgetsFlutterBinding.ensureInitialized();
//   // Constants.setEnvironment(Environment.Local);
//   // await Firebase.initializeApp(
//   //   options: DefaultFirebaseOptions.currentPlatform,
//   // ); //.whenComplete(() => {});
//   await EasyLocalization.ensureInitialized();

//   runApp(
//     EasyLocalization(
//       path: 'assets/translations',
//       //지원할 언어
//       supportedLocales: const [Locale('ko'), Locale('id')],
//       // 지원되지 않은 언어로 접속할때 보여질 언어
//       fallbackLocale: const Locale('id'),
//       // 기본 언어
//       startLocale: const Locale('id'),
//       useFallbackTranslations: true,
//       child: const ProviderScope(
//         child: KiffyApp(),
//       ),
//     ),
//   );
// }

class KiffyApp extends ConsumerWidget {
  const KiffyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 라우트 불러오기
    final router = ref.watch(routerProvider);

    return MaterialApp.router(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      routeInformationProvider: router.routeInformationProvider,
      routeInformationParser: router.routeInformationParser,
      routerDelegate: router.routerDelegate,
      debugShowCheckedModeBanner: Env.instance.isDebuggle,
      title: Env.instance.appTitle,
    );
  }
}
