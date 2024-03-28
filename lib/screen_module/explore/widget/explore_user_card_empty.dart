import 'package:Kiffy/constant/style/gab.dart';
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
          "We've all looked around",
          style: textStyle.headlineMedium!.apply(color: Colors.black),
          textAlign: TextAlign.center,
        ),
        Gab.height16,
        Text(
          "주변 사람을 모두 탐색하였습니다.",
          style: textStyle.titleMedium!.apply(color: Colors.black),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
