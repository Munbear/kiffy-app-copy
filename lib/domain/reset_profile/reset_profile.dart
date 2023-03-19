import 'package:Kiffy/domain/common/custom_bottom_nav_bar.dart';
import 'package:Kiffy/domain/core/model/ContactType.dart';
import 'package:Kiffy/domain/profile/page/add_profile_image_page.dart';
import 'package:Kiffy/domain/profile/provider/add_profile_input_provider.dart';
import 'package:Kiffy/domain/profile/widget/add_profile_input_image_card.dart';
import 'package:Kiffy/domain/profile/widget/add_profile_input_validation_text.dart';
import 'package:Kiffy/infra/media_client.dart';
import 'package:Kiffy/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gradient_borders/gradient_borders.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../common/custom_app_bar.dart';

class ResetProfile extends HookConsumerWidget {
  const ResetProfile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final inputImageMaxLength = 6;
    var inputImages = useState<List<AddProfileInputImageItem>>(List.empty());
    var inputImagesValidation = useState(AddProfileInputItemValidation.success());
    var userProfile = ref.read(addProfileInputProvider);

    void onAddedListener(String path) {
      uploadImage(path).then((res) => inputImages.value = [
            ...inputImages.value,
            AddProfileInputImageItem(
              filePath: path,
              url: res.url,
              id: res.id,
              orderNum: inputImages.value.length - 1,
            )
          ]);
    }

    void onDeletedListener(int index) {
      var copiedList = inputImages.value.getRange(0, inputImages.value.length).toList();
      copiedList.removeAt(index);
      inputImages.value = copiedList;
    }

    var inputIntroValidation = useState(AddProfileInputItemValidation.success());
    var inputIntro = useState("");

    var inputContactId = useState("");
    var inputContactType = useState<ContactType?>(null);

    var inputContactValidation = useState(AddProfileInputItemValidation.success());

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        centerTitle: true,
        titleSpacing: 0,
        elevation: 0.5,
        title: const CustomAppBar(
          title: "Modify Profile",
          titleColor: Color(0xff0031AA),
          fontSize: 20,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              // 사진 선택 타이틀 텍스트
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    "Select your pictures",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SvgPicture.asset('assets/svg/tips_icon.svg'),
                ],
              ),
              const SizedBox(height: 10),

              // 사진 첨부 버튼 레이아웃
              GridView.builder(
                shrinkWrap: true,
                itemCount: inputImageMaxLength,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 1 / 1.3,
                  mainAxisSpacing: 15,
                  crossAxisSpacing: 15,
                ),
                itemBuilder: (context, index) => AddProfileInputImageCard(
                  props: AddProfileInputImageCardProps(
                    index: index,
                    onDeleted: (idx) => onDeletedListener(idx),
                    onAdded: (path) => onAddedListener(path),
                    filePath: inputImages.value.length > index ? inputImages.value.elementAt(index).filePath : null,
                  ),
                ),
              ),
              const SizedBox(height: 10),

              // 사진 2개 이상 등록 안내 텍스트
              Align(
                alignment: Alignment.centerLeft,
                child: AddProfileInputValidationText(
                  normalText: "* You must select at least two sheets.",
                  validation: inputImagesValidation.value,
                ),
              ),
              const SizedBox(height: 30),

              // 자기소개 입력 폼,
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    "Introduce yourself ",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const Text(
                    "(option)",
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.black,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  const Spacer(),
                  SvgPicture.asset('assets/svg/tips_icon.svg'),
                ],
              ),
              const SizedBox(height: 10),
              TextFormField(
                onChanged: (t) => inputIntro.value = t,
                minLines: 5,
                maxLines: 5,
                style: const TextStyle(fontSize: 20, color: Color(0xFF6C6C6C)),
                decoration: const InputDecoration(
                    hintText: "Please enter it.",
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xffcecece), width: 2.0),
                      borderRadius:
                          BorderRadius.only(bottomLeft: Radius.circular(15), bottomRight: Radius.circular(15), topRight: Radius.circular(15)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xff0031AA), width: 3.0),
                      borderRadius:
                          BorderRadius.only(bottomLeft: Radius.circular(15), bottomRight: Radius.circular(15), topRight: Radius.circular(15)),
                    ),
                    contentPadding: EdgeInsets.all(18)),
              ),
              const SizedBox(height: 10),
              Align(
                alignment: Alignment.centerLeft,
                child: AddProfileInputValidationText(
                  normalText: "* This will increase your matching probability.",
                  validation: inputIntroValidation.value,
                ),
              ),
              const SizedBox(height: 20),

              const Text(
                "Messenger for kiffy",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Container(
                    height: 55,
                    width: 55,
                    margin: const EdgeInsets.only(left: 10),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: inputContactType.value == ContactType.LINE
                          ? const GradientBoxBorder(
                              gradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment(-0.94, 1.8),
                                colors: [
                                  Color(0xffBA00FF),
                                  Color(0xffB003FA),
                                  Color(0xff960AEE),
                                  Color(0xff6A15DB),
                                  Color(0xff2F25BF),
                                  Color(0xff0031AA),
                                ],
                              ),
                            )
                          : null,
                    ),
                    child: IconButton(
                      padding: const EdgeInsets.all(5),
                      onPressed: () => inputContactType.value = ContactType.LINE,
                      icon: Image.asset(
                        "assets/icons/line_icon.png",
                      ),
                    ),
                  ),
                  Container(
                    height: 55,
                    width: 55,
                    margin: const EdgeInsets.only(left: 5),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: inputContactType.value == ContactType.WHATSAPP
                          ? const GradientBoxBorder(
                              gradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment(-0.94, 1.8),
                                colors: [
                                  Color(0xffBA00FF),
                                  Color(0xffB003FA),
                                  Color(0xff960AEE),
                                  Color(0xff6A15DB),
                                  Color(0xff2F25BF),
                                  Color(0xff0031AA),
                                ],
                              ),
                            )
                          : null,
                    ),
                    child: IconButton(
                      padding: const EdgeInsets.all(5),
                      onPressed: () => inputContactType.value = ContactType.WHATSAPP,
                      icon: Image.asset(
                        "assets/icons/whatsapp_icon.png",
                        width: 68,
                        height: 68,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),

              Text(
                "ID for contact",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(height: 10),
              // 아이디 입력 폼
              TextField(
                onChanged: (t) => inputContactId.value = t,
                style: const TextStyle(fontSize: 20, color: Color(0xFF6C6C6C)),
                decoration: const InputDecoration(
                    hintText: "Please enter it.",
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xffcecece), width: 2.0),
                      borderRadius:
                          BorderRadius.only(bottomLeft: Radius.circular(15), bottomRight: Radius.circular(15), topRight: Radius.circular(15)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xff0031AA), width: 3.0),
                      borderRadius:
                          BorderRadius.only(bottomLeft: Radius.circular(15), bottomRight: Radius.circular(15), topRight: Radius.circular(15)),
                    ),
                    contentPadding: EdgeInsets.all(18)),
              ),
              const SizedBox(height: 8),
              Align(
                alignment: Alignment.centerLeft,
                child: AddProfileInputValidationText(
                  normalText: "* When a match is made, it’s shown to the woman.",
                  validation: inputContactValidation.value,
                ),
              ),

              const SizedBox(height: 30),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    "Delete Account",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    backgroundColor: const Color(0xff0031AA),
                  ),
                ),
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const CustomBottomNavBar(currentPath: "/mypage"),
    );
  }
}
