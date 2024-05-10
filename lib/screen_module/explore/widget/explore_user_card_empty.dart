import 'package:Kiffy/constant/style/gab.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class ExploreUserCardEmpty extends StatelessWidget {
  const ExploreUserCardEmpty({super.key});

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "text.tag.weve_all_loocked_around".tr(),
          style: textStyle.headlineMedium!.apply(color: Colors.black),
          textAlign: TextAlign.center,
        ),
        Gab.height16,
        Text(
          "text.tag.youve_explored_everyone_around_you".tr(),
          style: textStyle.titleMedium!.apply(color: Colors.black),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
