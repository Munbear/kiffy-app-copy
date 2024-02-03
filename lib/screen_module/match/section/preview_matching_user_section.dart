import 'package:Kiffy/constant/style/gab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PreviewMatchingUserSection extends ConsumerStatefulWidget {
  const PreviewMatchingUserSection({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _PreviewMatchingUserSectionState();
}

class _PreviewMatchingUserSectionState
    extends ConsumerState<PreviewMatchingUserSection> {
  @override
  void initState() {
    super.initState();
  }

  int testIndex = 10;

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme;
    return SizedBox(
      height: 96,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
        itemCount: testIndex + 1,
        itemBuilder: (context, index) {
          if (index == testIndex) {
            return Column(
              children: [
                GestureDetector(
                  child: Container(
                    width: 64,
                    height: 64,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.grey[200]!,
                    ),
                    child: const Icon(Icons.people),
                  ),
                ),
                SizedBox(
                  width: 72,
                  child: Text(
                    "more",
                    style: textStyle.titleSmall,
                    textAlign: TextAlign.center,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            );
          }

          return Column(
            children: [
              Container(
                width: 64,
                height: 64,
                padding: const EdgeInsets.all(2),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  // 프로필 확인 했을 때
                  // color: Colors.grey[300]!,
                  // 프로필 확인 안했을 때
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Color(0xffBA00ff),
                      Color(0xff0031AA),
                    ],
                  ),
                ),
                child: Container(
                  padding: const EdgeInsets.all(2),
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: Image.asset(
                      "assets/images/test_image.png",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 72,
                child: Text(
                  "kiffy kiffy kiffy kiffy",
                  style: textStyle.titleSmall,
                  textAlign: TextAlign.center,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          );
        },
        separatorBuilder: (context, index) {
          return Gab.width12;
        },
      ),
    );
  }
}
