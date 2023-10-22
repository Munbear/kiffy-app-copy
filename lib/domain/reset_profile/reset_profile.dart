import 'package:Kiffy/domain/common/custom_bottom_nav_bar.dart';
import 'package:Kiffy/domain/core/enum/contact_type.dart';
import 'package:Kiffy/screen/profile/add_profile_image_screen.dart';
import 'package:Kiffy/screen_module/profile/provider/profile_input_provider.dart';
import 'package:Kiffy/screen_module/profile/widget/profile_input_image_card.dart';
import 'package:Kiffy/screen_module/profile/widget/profile_input_validation_text.dart';
import 'package:Kiffy/infra/media_client.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gradient_borders/gradient_borders.dart';

import '../common/custom_app_bar.dart';

class ResetProfile extends ConsumerStatefulWidget {
  static String get routeLocation => "/resetProfile";

  static String get routeNmae => "resetProfile";

  const ResetProfile({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ResetProfileState();
}

class _ResetProfileState extends ConsumerState<ResetProfile> {
  int inputImageMaxLength = 6;
  List<AddProfileInputImageItem> inputImages = List.empty();
  var inputImagesValidation = AddProfileInputItemValidation.success();

  void onAddedListener(String path) {
    ref.read(uploadMedia).uploadImage(path).then((res) => inputImages = [
          ...inputImages,
          AddProfileInputImageItem(
            filePath: path,
            url: res.url,
            id: res.id,
            orderNum: inputImages.length - 1,
          )
        ]);
  }

  void onDeletedListener(int index) {
    var copiedList = inputImages.getRange(0, inputImages.length).toList();
    copiedList.removeAt(index);
    inputImages = copiedList;
  }

  var inputIntroValidation = AddProfileInputItemValidation.success();
  String inputIntro = "";

  String inputContactId = "";
  ContactType? inputContactType = null;

  var inputContactValidation = AddProfileInputItemValidation.success();

  @override
  Widget build(BuildContext context) {
    var userProfile = ref.read(profileInputProvider);

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
                itemBuilder: (context, index) => PhotoInputCard(
                  index: index,
                  onDeleted: (idx) => onDeletedListener(idx),
                  onAdded: (path) => onAddedListener(path),
                  filePath: inputImages.length > index ? inputImages.elementAt(index).filePath : null,
                ),
              ),
              const SizedBox(height: 10),

              // 사진 2개 이상 등록 안내 텍스트
              Align(
                alignment: Alignment.centerLeft,
                child: ProfileInputValidationText(
                  normalText: "* You must select at least two sheets.",
                  validation: inputImagesValidation,
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
                onChanged: (t) => inputIntro = t,
                minLines: 5,
                maxLines: 5,
                style: const TextStyle(fontSize: 20, color: Color(0xFF6C6C6C)),
                decoration: const InputDecoration(
                    hintText: "Please enter it.",
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xffcecece), width: 2.0),
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(15),
                          bottomRight: Radius.circular(15),
                          topRight: Radius.circular(15)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xff0031AA), width: 3.0),
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(15),
                          bottomRight: Radius.circular(15),
                          topRight: Radius.circular(15)),
                    ),
                    contentPadding: EdgeInsets.all(18)),
              ),
              const SizedBox(height: 10),
              Align(
                alignment: Alignment.centerLeft,
                child: ProfileInputValidationText(
                  normalText: "* This will increase your matching probability.",
                  validation: inputIntroValidation,
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
                      border: inputContactType == ContactType.LINE
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
                      onPressed: () => inputContactType = ContactType.LINE,
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
                      border: inputContactType == ContactType.WHATSAPP
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
                      onPressed: () => inputContactType = ContactType.WHATSAPP,
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
                onChanged: (t) => inputContactId = t,
                style: const TextStyle(fontSize: 20, color: Color(0xFF6C6C6C)),
                decoration: const InputDecoration(
                    hintText: "Please enter it.",
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xffcecece), width: 2.0),
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(15),
                          bottomRight: Radius.circular(15),
                          topRight: Radius.circular(15)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xff0031AA), width: 3.0),
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(15),
                          bottomRight: Radius.circular(15),
                          topRight: Radius.circular(15)),
                    ),
                    contentPadding: EdgeInsets.all(18)),
              ),
              const SizedBox(height: 8),
              Align(
                alignment: Alignment.centerLeft,
                child: ProfileInputValidationText(
                  normalText: "* When a match is made, it’s shown to the woman.",
                  validation: inputContactValidation,
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
