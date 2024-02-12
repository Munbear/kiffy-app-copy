import 'package:Kiffy/constant/style/gab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';

typedef Preview = List<Map<String, dynamic>>;

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

  Preview aaa = [
    {"aaa": "bbb", "cccc": "dddd"},
    {"aaa": "bbb", "cccc": "dddd"},
  ];

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme;
    return ListView.builder(
      itemCount: 10,
      physics: const BouncingScrollPhysics(),
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
                  Gab.width8,
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
              child: PageView(
                children: testImages.map(
                  (item) {
                    return Image.asset(
                      item,
                      fit: BoxFit.cover,
                    );
                  },
                ).toList(),
              ),
            ),
            Gab.height8,
            // comment
            Row(
              children: [
                Gab.width16,
                SvgPicture.asset("assets/svg/icn_comment.svg"),
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
            // 댓글
            GestureDetector(
              onTap: () {
                print("댓글 보기");
              },
              child: Padding(
                padding: const EdgeInsets.only(left: 16),
                child: Text(
                  "View all comments",
                  style: textStyle.labelMedium!.apply(color: Colors.grey[500]),
                ),
              ),
            ),
            Gab.height4,

            // 댓글 미리보기
            ...aaa.map((preview) {
              print(preview);
              return Padding(
                padding: const EdgeInsets.only(left: 16),
                child: Row(
                  children: [
                    Text(
                      "kiffy",
                      style: textStyle.labelLarge,
                    ),
                    Gab.width8,
                    Text(
                      "Hello world",
                      style:
                          textStyle.labelMedium!.apply(color: Colors.grey[700]),
                    ),
                  ],
                ),
              );
            }).toList(),
          ],
        );
      },
    );
  }
}
