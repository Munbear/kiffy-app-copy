import 'package:Kiffy/config/router/route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MyPageButton extends ConsumerWidget {
  final String text;
  final String iconPath;
  final String routePathName;

  const MyPageButton({
    super.key,
    required this.text,
    required this.iconPath,
    required this.routePathName,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          ref.read(routerProvider).pushNamed(routePathName);
        },
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 17),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: const Color(0xffcecece)),
            color: Colors.white,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Image(
                    width: 33,
                    height: 33,
                    image: AssetImage(iconPath),
                  ),
                ],
              ),
              const SizedBox(height: 42),
              Text(
                text,
                style: TextStyle(fontSize: 18),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
