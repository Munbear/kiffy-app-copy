import 'package:Kiffy/constant/style/gab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FeedSection extends ConsumerStatefulWidget {
  const FeedSection({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _FeedSectionState();
}

class _FeedSectionState extends ConsumerState<FeedSection> {
  static List<String> testImages = [
    "assets/images/test_image.png",
    "assets/images/test_image.png",
    "assets/images/test_image.png",
    "assets/images/test_image.png",
    "assets/images/test_image.png",
    "assets/images/test_image.png",
    "assets/images/test_image.png",
    "assets/images/test_image.png",
  ];

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme;
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Row(
                children: [
                  Container(
                    width: 36,
                    height: 36,
                    decoration: const BoxDecoration(shape: BoxShape.circle),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: Image.asset(
                        "assets/images/test_image.png",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Gab.width6,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "User name",
                        style: textStyle.bodyMedium,
                      ),
                      Text(
                        "10 minute ago",
                        style: textStyle.labelMedium,
                      ),
                    ],
                  ),
                  const Spacer(),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.more_horiz),
                  ),
                ],
              ),
            ),
            // feed photo
            AspectRatio(
              aspectRatio: 1 / 1,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                // TODO 스크롤 애니메이션 변경
                physics: PageScrollPhysics(),
                itemCount: testImages.length,
                itemBuilder: (context, index) {
                  final image = testImages[index];
                  return Image.asset(
                    image,
                    fit: BoxFit.cover,
                  );
                },
              ),
            ),
            Gab.height8,
            // comment
            const Row(
              children: [
                Gab.width16,
                Icon(Icons.mode_comment_outlined),
                Gab.width4,
                Text("6"),
              ],
            ),
            Gab.height6,
            // 내용
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                "Is there anyone you're meeting tonight? I'm bored. Is there anyone you're meeting tonight? I'm bored. Is there anyone you're meeting tonight? I'm bored. Is there ...",
              ),
            ),
            Gab.height12,
          ],
        );
      },
    );
  }
}
