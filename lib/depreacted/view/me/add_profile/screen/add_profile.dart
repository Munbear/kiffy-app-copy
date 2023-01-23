import 'package:Kiffy/global/model/gender_type.dart';
import 'package:Kiffy/main.dart';
import 'package:Kiffy/view/legacy_add_profile/widget/confirm_button.dart';
import 'package:Kiffy/view/me/add_profile/widget/AddProfileInputGender.dart';
import 'package:Kiffy/view/me/add_profile/widget/AddProfileInputText.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AddProfileScreen extends HookConsumerWidget {
  AddProfileScreen({super.key});

  static String get routeName => 'me_add_profile';

  static String get routeLocation => '/me/profile/add';

  var inputListKey = GlobalKey<AnimatedListState>();
  var inputFocus = FocusNode();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var inputValue = useState(AddProfileInputValue());
    var inputCurProcess = useState([
      AddProfileInputText(
        props: AddProfileInputTextProps(
          hintText: "hello",
          onChanged: (val) => print(val),
          autoFocus: false,
        ),
      ),
      AddProfileInputText(
        props: AddProfileInputTextProps(
          hintText: "hello",
          onChanged: (val) => print(val),
          autoFocus: false,
        ),
      ),
      AddProfileInputText(
        props: AddProfileInputTextProps(
          hintText: "이름",
          onChanged: (val) => print(val),
          autoFocus: true,
        ),
      )
    ]);
    var inputProcess = useState(inputCurProcess.value.length - 1);

    proceedInputProcess() {
      inputProcess.value = inputProcess.value - 1;
      FocusScope.of(context).previousFocus();
    }

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              child: Column(
                children: inputCurProcess.value
                    .mapWithIndex(
                      (e, index) => AnimatedOpacity(
                        opacity: inputProcess.value <= index ? 1 : 0,
                        duration: Duration(milliseconds: 500),
                        child: AnimatedContainer(
                          duration: Duration(milliseconds: 200),
                          height: inputProcess.value <= index ? 90 : 0,
                          child: Container(
                            padding: EdgeInsets.all(20),
                            child: e,
                          ),
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              left: 0,
              child: Container(
                padding: EdgeInsets.all(20),
                child: InkWell(
                  onTap: proceedInputProcess,
                  child: ConfirmButton(text: "다음"),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class AddProfileInputValue {
  String? name;
  Gender? gender;
  DateTime? birthDate;
  String? intro;
  List<AddProfileInputValueMedia> medias = List.empty();

  AddProfileInputValue();

  void setName(String name) {
    this.name = name;
  }

  void setGender(Gender gender) {
    this.gender = gender;
  }

  void setBirthDate(DateTime birthDate) {
    this.birthDate = birthDate;
  }

  void setIntro(String intro) {
    this.intro = intro;
  }

  void addMedia(AddProfileInputValueMedia media) {
    this.medias.add(media);
  }

  void removeMediaAt(int index) {
    this.medias.removeAt(index);
  }

  bool isValidate() {
    if (this.name != null &&
        this.gender != null &&
        this.birthDate != null &&
        this.intro != null &&
        this.medias.length > 1) {
      return true;
    }
    return false;
  }
}

class AddProfileInputValueMedia {
  String id;
  int orderNum;

  AddProfileInputValueMedia({
    required this.id,
    required this.orderNum,
  });
}
