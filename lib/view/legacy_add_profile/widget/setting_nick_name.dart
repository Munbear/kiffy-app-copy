import 'package:Kiffy/view/add_profile/service/text_form_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:http/retry.dart';

class SettingNickName extends HookConsumerWidget {
  final String hinText;
  final String labelText;
  final bool isShowed;
  final TextEditingController? usreNameController;
  final GlobalKey<FormState> globalKey;

  SettingNickName({
    super.key,
    required this.hinText,
    required this.labelText,
    required this.isShowed,
    this.usreNameController,
    required this.globalKey,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textController = ref.watch(textControllerProvider);
    final userName = useState('');
    return Column(
      children: [
        SizedBox(
          height: 50,
          child: TextFormField(
            controller: textController,
            onChanged: (value) {},
            // 유효성 검사
            validator: (value) {
              if (value!.isEmpty) {
                return "이름이 입력해 주세요";
              }
            },
            autofocus: isShowed ? false : true,
            textAlign: TextAlign.center,
            textInputAction: TextInputAction.done,
            style: const TextStyle(
              color: Colors.black87,
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(vertical: 15),
              floatingLabelBehavior: FloatingLabelBehavior.auto,
              hintText: hinText,
              hintStyle: const TextStyle(
                color: Colors.grey,
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
              labelStyle: const TextStyle(color: Colors.grey, fontSize: 18, fontWeight: FontWeight.w500),
              focusedBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: Color(0xff0031AA), width: 1),
              ),
            ),
          ),
        ),
        ElevatedButton(
            onPressed: () {
              globalKey.currentState!.validate();
            },
            child: Text("버튼")),
      ],
    );
  }
}
