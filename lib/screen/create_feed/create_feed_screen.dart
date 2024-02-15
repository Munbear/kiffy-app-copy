import 'dart:io';

import 'package:Kiffy/constant/style/gab.dart';
import 'package:Kiffy/screen/custom_album/custom_album_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class CreateFeedScreen extends StatelessWidget {
  static String get routeName => 'createFeed';
  static String get routeLocation => '/createFeed';

  const CreateFeedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // 헤더
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                // crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      "Cancel",
                      style: textStyle.bodyMedium!.apply(color: Colors.red),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      backgroundColor: const Color(0xff0031AA),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Text(
                      "Share",
                      style: textStyle.bodySmall!.apply(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
            // 포스팅 컨트롤 바
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      // 유저 정보
                      Row(
                        children: [
                          SizedBox(
                            width: 32,
                            height: 32,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(50),
                              child: Image.asset(
                                "assets/images/test_image.png",
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Gab.width12,
                          Text(
                            "userName",
                            style: textStyle.bodyMedium,
                          )
                        ],
                      ),
                      Gab.height12,
                      const Divider(),
                      // 텍스트 영역
                      TextFormField(
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(500),
                        ],
                        maxLines: null,
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.zero,
                          border: InputBorder.none,
                          hintText: "내용을 입력해 주세요",
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 128,
              child: ListView.separated(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                separatorBuilder: (context, index) {
                  return Gab.width4;
                },
                itemBuilder: (context, index) {
                  return Stack(
                    children: [
                      SizedBox(
                        width: 112,
                        height: 112,
                        child: Image.asset(
                          "assets/images/test_image.png",
                          fit: BoxFit.cover,
                        ),
                      )
                    ],
                  );
                },
              ),
            ),
            // 사진 불러오기 영역
            Container(
              color: Colors.grey[200],
              padding: const EdgeInsets.only(right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {
                      context
                          .pushNamed<List<File>?>(CustomAlbumScreen.routeName);
                    },
                    icon: SvgPicture.asset("assets/svg/gallery.svg"),
                  ),
                  Text(
                    "0 / 500",
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
