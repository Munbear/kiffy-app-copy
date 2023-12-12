import 'package:Kiffy/constant/contact_type.dart';
import 'package:Kiffy/screen_module/common/input/widget/kiffy_text_field.dart';
import 'package:Kiffy/screen_module/common/space/widget/space.dart';
import 'package:Kiffy/screen_module/common/style/widget/border._style.dart';
import 'package:Kiffy/screen_module/profile/provider/profile_input_validator_provider.dart';
import 'package:Kiffy/screen_module/profile/widget/add_profile/add_profile_input_header.dart';
import 'package:Kiffy/screen_module/profile/widget/profile_input_next_button.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';

final contactIdProvider = StateProvider((ref) => "");
final contactTypeProvider = StateProvider<ContactType?>((ref) => null);

class AddProfileInputContact extends ConsumerWidget {
  final Function(ContactType contactType, String contactId) onNext;

  const AddProfileInputContact({super.key, required this.onNext});

  bool _verify(WidgetRef ref) {
    if (!ref
        .read(profileInputValidatorProvider)
        .verifyContactId(ref.read(contactIdProvider))) {
      Fluttertoast.showToast(
        msg: tr("text.profile.contact.contact_id.validation"),
        fontSize: 16,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
      );
      return false;
    }
    if (!ref
        .read(profileInputValidatorProvider)
        .verifyContactType(ref.read(contactTypeProvider))) {
      Fluttertoast.showToast(
        msg: tr("text.profile.contact.contact_type.validation"),
        fontSize: 16,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
      );
      return false;
    }

    return true;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          const ProfileInputContactHeader(),
          const Space(height: 20),
          const ProfileInputContactTypeSelector(),
          const Space(height: 20),
          const ProfileInputContactIdInput(),
          const Space(height: 20),
          ProfileInputNextButton(onPressed: () {
            if (!_verify(ref)) {
              return;
            }

            onNext(ref.read(contactTypeProvider)!, ref.read(contactIdProvider));
          }),
        ],
      ),
    );
  }
}

/// ***********************************
///         연락처 입력 화면 헤더
/// **********************************
class ProfileInputContactHeader extends StatelessWidget {
  const ProfileInputContactHeader({super.key});

  @override
  Widget build(BuildContext context) => Align(
        alignment: Alignment.topLeft,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AddProfileInputHeaderTitle(
                text: tr("text.profile.contact.contact_type")),
            AddProfileInputHeaderSubTitle(
                text: tr("text.profile.input_profile.last_process")),
          ],
        ),
      );
}

/// ***********************************
///           연락처 타입 입력
/// **********************************
class ProfileInputContactTypeSelector extends ConsumerWidget {
  const ProfileInputContactTypeSelector({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var selectedContactType = ref.watch(contactTypeProvider);

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: ContactType.values.map((contactType) {
          return GestureDetector(
            onTap: () {
              ref.read(contactTypeProvider.notifier).state = contactType;
            },
            child: Container(
              height: 55,
              width: 55,
              margin: const EdgeInsets.only(right: 10),
              decoration: selectedContactType == contactType
                  ? BorderGradientCircleShape.outlineGradientBoxDecoration
                  : null,
              child: Container(
                padding: const EdgeInsets.all(4),
                decoration: BorderGradientCircleShape.innerDecoration,
                child: Stack(
                  children: [
                    // icon Image
                    Container(
                      clipBehavior: Clip.hardEdge,
                      decoration: const BoxDecoration(shape: BoxShape.circle),
                      child: ContactType.contactAppIcon(contactType),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: contactType == contactType
                            ? null
                            : Colors.white.withOpacity(0.7),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}

/// ***********************************
///           연락처 값 입력
/// **********************************
class ProfileInputContactIdInput extends ConsumerWidget {
  const ProfileInputContactIdInput({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        const ProfileInputContactIdInputTitle(),
        const Space(height: 8),
        KiffyTextField(
          hintText: "",
          onChanged: (t) => ref.read(contactIdProvider.notifier).state = t,
        ),
        const Space(height: 2),
        Align(
          alignment: Alignment.topLeft,
          child: Text(
            tr("text.profile.input_profile.contact"),
            style: const TextStyle(
              fontSize: 13,
              color: Color(0xFF0031AA),
            ),
          ),
        ),
      ],
    );
  }
}

class ProfileInputContactIdInputTitle extends StatelessWidget {
  const ProfileInputContactIdInputTitle({super.key});

  @override
  Widget build(BuildContext context) => Align(
        alignment: Alignment.topLeft,
        child: Text(
          tr("text.profile.contact.contact_id"),
          style: const TextStyle(
            fontSize: 20,
            color: Colors.black,
            fontWeight: FontWeight.w500,
          ),
        ),
      );
}
