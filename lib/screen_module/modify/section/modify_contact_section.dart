import 'package:Kiffy/constant/contact_type.dart';
import 'package:Kiffy/screen_module/common/my/provider/my_provider.dart';
import 'package:Kiffy/screen_module/profile/widget/profile_input_contact_id.dart';
import 'package:Kiffy/screen_module/profile/widget/profile_input_contact_type.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:openapi/openapi.dart';

class ModifyContactSection extends ConsumerStatefulWidget {
  const ModifyContactSection({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ModifyContactSectionState();
}

class _ModifyContactSectionState extends ConsumerState<ModifyContactSection> {
  late ContactType myContactType;
  late String myContactId;

  @override
  void initState() {
    final mySnsInfo = ref.read(myProvider).getProfile();
    if (mySnsInfo.contacts.first.contactType.name == "LINE") {
      myContactType = ContactType.LINE;
    }
    if (mySnsInfo.contacts.first.contactType.name == "WHATSAPP") {
      myContactType = ContactType.WHATSAPP;
    }

    myContactId = mySnsInfo.contacts.first.contactId;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 28),
      child: Column(
        children: [
          ProfileInputContactType(
            contactType: myContactType,
            onChanged: (inputContactType) {
              setState(() {
                myContactType = inputContactType;
              });
            },
          ),
          ProfileInputContactId(
              contactId: myContactId,
              onChanged: (newContactId) {
                myContactId = newContactId;
              },
              initContactId: myContactId),
        ],
      ),
    );
  }
}
