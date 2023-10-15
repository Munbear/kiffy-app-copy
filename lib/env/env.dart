// // ignore_for_file: prefer_conditional_assignment, unnecessary_null_comparison

// import 'package:easy_localization/easy_localization.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';

// // ignore: library_prefixes
// import '../config/firebase/prod/firebase_options.dart' as prodFirebaseOptions;
// // ignore: library_prefixes
// import '../config/firebase/dev/firebase_options.dart' as devFirebaseOptions;
// import '../kiffy_app.dart';

// class Env {
//   static Env? _instance;
//   static Env get instance => _instance!;
//   final Environment _environment;
//   static Environment get environment => instance._environment;
//   Env._internal(this._environment);

//   factory Env.newInstance(Environment environment) {
//     assert(environment != null);

//     if (_instance == null) _instance = Env._internal(environment);

//     return _instance!;
//   }

//   // 환경 변수 값
//   bool get isDebuggle => environment == Environment.dev;

//   // 앱 이름
//   String get appTitle =>
//       environment == Environment.dev ? "[DEV] kiffy" : "kiffy";

//   // firebase 설정
//   static FirebaseOptions get currentPlatform => environment == Environment.dev
//       ? devFirebaseOptions.DefaultFirebaseOptions.currentPlatform
//       : prodFirebaseOptions.DefaultFirebaseOptions.currentPlatform;

//   // 서버 설정
//   static String? get apiUrl => environment == Environment.dev
//       ? "http://api-dev.kiffy.club"
//       : "http://api-dev.kiffy.club";
//   static String? get firebaseAppName =>
//       environment == Environment.dev ? 'Kiffy-dev' : 'Kiffy';

//   // 앱 실행
//   Future<void> run() async {
//     WidgetsFlutterBinding.ensureInitialized();
//     await EasyLocalization.ensureInitialized();

//     await Firebase.initializeApp(
//         name: firebaseAppName, options: currentPlatform);
//     // if (Platform.isIOS) await Permission.appTrackingTransparency.request();

//     runApp(
//       EasyLocalization(
//         path: 'assets/translations',
//         //지원할 언어
//         supportedLocales: const [Locale('ko'), Locale('id')],
//         // 지원되지 않은 언어로 접속할때 보여질 언어
//         fallbackLocale: const Locale('id'),
//         // 기본 언어
//         startLocale: const Locale('id'),
//         saveLocale: true,
//         useFallbackTranslations: true,
//         useOnlyLangCode: true,
//         child: const ProviderScope(child: KiffyApp()),
//       ),
//     );
//   }
// }

// enum Environment { dev, prod }
