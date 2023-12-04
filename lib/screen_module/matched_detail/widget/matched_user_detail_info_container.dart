import 'package:Kiffy/screen_module/common/my/provider/my_provider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:openapi/openapi.dart';

class MatchedUserDetailInfoContainer extends ConsumerWidget {
  // final BuiltList<UserProfileContactView> contactInfo;
  final DateTime lastCheck;
  final String emoji;

  const MatchedUserDetailInfoContainer({
    super.key,
    // required this.contactInfo,
    required this.lastCheck,
    required this.emoji,
  });

  Widget snsImage(aa) {
    switch (aa) {
      case "LINE":
        return Image.asset(
          "assets/images/line_image.png",
          width: 30,
          height: 30,
        );
      default:
        return Image.asset(
          "assets/images/line_image.png",
          width: 30,
          height: 30,
        );
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final myGender = ref.read(myProvider.notifier).getProfile().gender;
    // final contactType = contactInfo.map((item) => item.contactType);
    // final contactId = contactInfo.map((item) => item.contactId);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 11),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 18),

          /// 연락처 아이디 및 마지막 프로필 시간
          Text(
            myGender == GenderEnumView.FEMALE
                ? tr("text.match.detail.contact1.female")
                : "",
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
          ),

          // Container(
          //   margin: const EdgeInsets.only(left: 30),
          //   width: MediaQuery.of(context).size.width,
          //   padding: const EdgeInsets.symmetric(vertical: 10),
          //   decoration: const BoxDecoration(
          //     border: Border(
          //       bottom: BorderSide(color: Colors.grey),
          //     ),
          //   ),
          //   child: myGender == GenderEnumView.FEMALE
          //       ? Row(
          //           children: [
          //             snsImage(contactType.first.name),
          //             const SizedBox(width: 9),
          //             Text(contactId.first.toString()),
          //           ],
          //         )
          //       : Text(lastCheck.toString()),
          // ),
          // const SizedBox(height: 20),

          Text(
            myGender == GenderEnumView.FEMALE
                ? "✔️ ${tr("text.match.detail.contact_title.female")}"
                : "✔️ ${tr("text.match.detail.contact_title")}",
            style: const TextStyle(
              fontSize: 20,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.only(left: 28),
            child: Text(
              myGender == GenderEnumView.FEMALE
                  ? tr("text.match.detail.contact_subtitle.female")
                  : tr("text.match.detail.contact_subtitle"),
              style: const TextStyle(
                fontSize: 13,
                color: Colors.black,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: ElevatedButton(
              onPressed: () {
                Clipboard.setData(
                  ClipboardData(text: emoji),
                );
              },
              style: ElevatedButton.styleFrom(
                elevation: 0,
                padding:
                    const EdgeInsets.symmetric(horizontal: 18, vertical: 22),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
                backgroundColor: const Color(0xffEEEEEE),
              ),
              child: Text(
                "Hello $emoji",
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
          const SizedBox(height: 8),
          if (myGender == GenderEnumView.FEMALE)
            const Padding(
              padding: EdgeInsets.only(left: 30, bottom: 30),
              child: Text(
                "*Click to copy!",
                style: TextStyle(
                    color: Color(0xff0031AA),
                    fontSize: 13,
                    fontWeight: FontWeight.w400),
              ),
            ),
        ],
      ),
    );
  }
}
