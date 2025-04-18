import 'package:Kiffy/constant/enum/option_profile_type.dart';
import 'package:Kiffy/constant/enum/zodiac_type.dart';
import 'package:Kiffy/screen_module/common/button/widget/main_blue_button.dart';
import 'package:Kiffy/screen_module/my/provider/my_provider.dart';
import 'package:Kiffy/screen_module/common/provider/option_profile_tag_provider.dart';
import 'package:Kiffy/screen_module/add_profile/provider/profile_input_validator_provider.dart';
import 'package:Kiffy/screen_module/add_profile/section/add_option_profile_mbti.dart';
import 'package:Kiffy/screen_module/add_profile/section/add_option_profile_server_form.dart';
import 'package:Kiffy/screen_module/add_profile/widget/add_option_profile_text_form.dart';
import 'package:Kiffy/screen_module/add_profile/widget/zodiac_list.dart';
import 'package:Kiffy/screen_module/edit_profile/provider/edit_profile_provider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:openapi/openapi.dart';

class EditOptionProfileScreen extends ConsumerWidget {
  static String get routeName => "editOptionProfile";
  static String get routeLocation => "/editOptionProfile";
  final OptionProfileType editProfileType;
  final String title;

  const EditOptionProfileScreen({
    super.key,
    required this.title,
    required this.editProfileType,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final items = ref.watch(optionProfileTagProvider);
    if (items.isLoading) {
      return const Center(child: CircularProgressIndicator());
    } else if (items.hasError) {
      return const Text("Oops something wrong");
    }

    final myProfile = ref.watch(
      myProvider.select((value) => value.requireValue.profile),
    );

    final bb = myProfile?.tags?.tagTypes.map((p0) => p0.tags!.map((e) => e.id));
    List<int> initOptionProfileInfo =
        bb?.expand((element) => element).map((e) => e.toInt()).toList() ?? [];

    // 성격 id
    final optionPersonalityValue = myProfile?.tags?.tagTypes
        .where((element) => element.tagType == TagTypeEnumView.PERSONALITY_TYPE)
        .map((e) => e.tags?.map((p0) => p0.id))
        .toString();
    final cleanedString =
        optionPersonalityValue!.replaceAll('(', '').replaceAll(')', '');
    final initPersonalityValue = int.tryParse(cleanedString.trim());

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        centerTitle: true,
        titleSpacing: 0,
        elevation: 0,
        leading: IconButton(
          padding: EdgeInsets.zero,
          constraints: const BoxConstraints(),
          onPressed: () => Navigator.pop(context),
          icon: const Icon(
            Icons.arrow_back_ios_new,
            size: 18,
          ),
        ),
        title: Text(
          tr("text.my.modify_profile"),
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: Color(0xff0031AA),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Builder(
                  builder: (context) {
                    switch (editProfileType) {
                      case OptionProfileType.relationship:
                        return OptionProfileSeverForm(
                          onTap: (id) {
                            ref
                                .read(profileInputValidatorProvider)
                                .optionProfileMultiSelector(
                                    ref.read(multiSelecteState), id);
                          },
                          title: title,
                          items: items.value![1],
                          initOptionProfileValue: initOptionProfileInfo,
                          hasDivider: false,
                          isMultiSelecte: true,
                        );
                      case OptionProfileType.personality:
                        return OptionProfileSeverForm(
                          onTap: (id) {
                            ref
                                .read(singleSelecteState.notifier)
                                .update((state) => state = id);
                          },
                          title: title,
                          items: items.value![2],
                          initPersonalityValue: initPersonalityValue,
                          hasDivider: false,
                          isMultiSelecte: false,
                        );
                      case OptionProfileType.coffee:
                        return OptionProfileSeverForm(
                          onTap: (id) {
                            ref
                                .read(profileInputValidatorProvider)
                                .optionProfileMultiSelector(
                                    ref.read(multiSelecteState), id);
                          },
                          title: title,
                          initOptionProfileValue: initOptionProfileInfo,
                          items: items.value![3],
                          hasDivider: false,
                          isMultiSelecte: true,
                        );
                      case OptionProfileType.language:
                        return OptionProfileSeverForm(
                          onTap: (id) {
                            ref
                                .read(profileInputValidatorProvider)
                                .optionProfileMultiSelector(
                                    ref.read(multiSelecteState), id);
                          },
                          title: "What language do you speak?",
                          items: items.value![0],
                          initOptionProfileValue: initOptionProfileInfo,
                          hasDivider: false,
                          isMultiSelecte: true,
                        );
                      case OptionProfileType.physical:
                        return AddOptionProfileTextForm(
                          onChagedTall: (height) {
                            ref
                                .read(editProfileProvider.notifier)
                                .resetHeight(height);
                          },
                          onChagedWeight: (weight) {
                            ref
                                .read(editProfileProvider.notifier)
                                .resetWeight(weight);
                          },
                          initHeight: myProfile?.height,
                          initWeight: myProfile?.weight,
                        );
                      case OptionProfileType.mbti:
                        return AddOptionProfileMbti(
                          hasDivider: false,
                          initValue: myProfile?.mbti,
                        );
                      case OptionProfileType.zodiac:
                        return ZodiacList(
                          title: title,
                          itemList: Zodiac.values,
                          showDivider: false,
                          initValue: myProfile?.zodiac,
                        );
                      default:
                        return Container();
                    }
                  },
                ),
              ),
            ),
            MainBlueButton(
              onTap: () {
                ref
                    .read(editProfileProvider.notifier)
                    .resetProfile(
                      ref.read(multiSelecteState),
                      ref.read(singleSelecteState),
                      ref.read(selectedMbitState),
                      ref.read(selecteZodiac),
                    )
                    .then(
                  (value) {
                    ref.read(editProfileProvider.notifier).save();
                    Navigator.pop(context);
                  },
                );
              },
              text: "Edit",
            ),
          ],
        ),
      ),
    );
  }
}
