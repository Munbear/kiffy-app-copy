import 'package:Kiffy/domain/common/border._style.dart';
import 'package:Kiffy/screen_module/common/widget/space.dart';
import 'package:flutter/material.dart';
import 'package:openapi/openapi.dart';

class OtherWishUserProfileChipRemained extends StatelessWidget {
  final OtherWishUserProfileView otherWish;

  const OtherWishUserProfileChipRemained({super.key, required this.otherWish});

  // lockMessageFullScreenPopup(context) {
  //   return showDialog(
  //     barrierColor: Colors.white.withOpacity(0.7),
  //     context: context,
  //     builder: (context) {
  //       return Column(
  //         mainAxisAlignment: MainAxisAlignment.center,
  //         children: [
  //           Row(
  //             mainAxisAlignment: MainAxisAlignment.center,
  //             children: [
  //               Image(
  //                 width: 14,
  //                 height: 19,
  //                 image: AssetImage("assets/images/lock_image.png"),
  //               ),
  //               SizedBox(width: 5),
  //               Text(
  //                 "Match with 10 opponents!",
  //                 style: TextStyle(
  //                   fontSize: 20,
  //                   color: Color(0xff0031AA),
  //                   fontWeight: FontWeight.w500,
  //                 ),
  //               ),
  //             ],
  //           ),
  //           SizedBox(height: 10),
  //           Text(
  //             "That way, you can see the person who likes you.",
  //             style: TextStyle(
  //               fontSize: 13,
  //               fontWeight: FontWeight.w400,
  //             ),
  //           ),
  //         ],
  //       );
  //     },
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // lockMessageFullScreenPopup(context);
      },
      child: Column(
        children: [
          Container(
            decoration:
                BorderGradientBorderRadius50.outlineGradientBoxDecoration,
            child: Container(
              padding: const EdgeInsets.all(4),
              width: 80,
              height: 80,
              decoration: BorderGradientBorderRadius50.innerDecoration,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Image.network(
                  otherWish.userProfile.medias.first.url,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          const Space(height: 8),
          Text(
            otherWish.userProfile.name,
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w400,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
