import 'package:Kiffy/config/router/route.dart';
import 'package:Kiffy/env/env.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_flavor/flutter_flavor.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'infra/api_client.dart';

class KiffyApp extends ConsumerWidget {
  const KiffyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 라우트 불러오기
    final router = ref.watch(routerProvider);
    // http
    ref.read(dioProvider.notifier).state.options.headers['Accept-Lanauage'] =
        context.locale.toString();

    return MaterialApp.router(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      routeInformationProvider: router.routeInformationProvider,
      routeInformationParser: router.routeInformationParser,
      routerDelegate: router.routerDelegate,
      debugShowCheckedModeBanner: FlavorConfig.instance.variables["isDebuggle"],
      title: FlavorConfig.instance.variables["appTitle"],
    );
  }
}
