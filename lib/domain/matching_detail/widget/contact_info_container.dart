import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../infra/match_client.dart';
import '../../core/enum/contact_type.dart';

class ContactInfoContainer extends ConsumerWidget {
  const ContactInfoContainer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userDetailInfo = ref.watch(matchedUserDetailProvider);
    return Container(
      padding: const EdgeInsets.only(bottom: 10),
      margin: const EdgeInsets.only(left: 28, top: 10, right: 60, bottom: 30),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Color(0xff6c6c6c)),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // 여상 유저한테만 보여짐
          if (userDetailInfo!.contacts.first.contactType ==
              ContactType.LINE.name)
            const Image(
                image: AssetImage("assets/images/line_image.png"),
                width: 29,
                height: 29),
          if (userDetailInfo.contacts.first.contactType ==
              ContactType.WHATSAPP.name)
            const Image(
                image: AssetImage("assets/icons/whatsapp_icon.png"),
                width: 29,
                height: 29),
          const SizedBox(width: 8),

          // 여성 유저한테만 보여짐
          Text(
            userDetailInfo.contacts.first.contactId,
            style: const TextStyle(fontSize: 16, color: Color(0xff6c6c6c)),
          )
        ],
      ),
    );
  }
}
