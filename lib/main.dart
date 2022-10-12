import 'package:Kiffy/global/firebase/firebase_options.dart';
import 'package:Kiffy/router/route.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initDefault();

  runApp(const ProviderScope(
    child: KiffyApp(),
  ));
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
      routeInformationProvider: router.routeInformationProvider,
      routeInformationParser: router.routeInformationParser,
      routerDelegate: router.routerDelegate,
      title: "KIFFY",
    );
  }
}
