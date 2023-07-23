import 'package:Kiffy/config/router/route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class KiffyApp extends ConsumerWidget {
  const KiffyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 라우트 불러오기
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
