import 'package:Kiffy/global/firebase/firebase_options.dart';
import 'package:Kiffy/router/route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:easy_localization/easy_localization.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await initDefault();
//   runApp(const KiffyApp());
// }

//기존 라우팅 설정
// class KiffyApp extends StatelessWidget {
//   const KiffyApp({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) => MaterialApp.router(
//         routerConfig: routes,
//         title: "KIFFY",
//       );
// }

// 변경 라우팅 설정
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initDefault();
  await EasyLocalization.ensureInitialized();

  runApp(
    EasyLocalization(
      path: 'assets/translations',
      supportedLocales: const [Locale('ko'), Locale('en'), Locale('id')],
      fallbackLocale: const Locale('ko'),
      startLocale: const Locale('ko'),
      useFallbackTranslations: true,
      child: const ProviderScope(
        child: KiffyApp(),
      ),
    ),
  );
}

Future<void> initDefault() async {
  FirebaseApp app = await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
}

//변경 라우팅 설정
class KiffyApp extends ConsumerWidget {
  const KiffyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);

    return MaterialApp.router(
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
