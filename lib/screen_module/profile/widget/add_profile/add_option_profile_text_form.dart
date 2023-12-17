import 'package:Kiffy/screen_module/common/space/widget/space.dart';
import 'package:flutter/material.dart';

class AddOptionProfileTextForm extends StatelessWidget {
  final ValueChanged<String> onChagedTall;
  final ValueChanged<String> onChagedWeight;

  const AddOptionProfileTextForm({
    super.key,
    required this.onChagedTall,
    required this.onChagedWeight,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              "How tall are you?",
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontFamily: 'AppleSDGothicNeoM00',
                fontWeight: FontWeight.w400,
                height: 0,
              ),
            ),
            Space(width: 4),
            Text(
              "*Only number",
              style: TextStyle(
                color: Color(0xFF0031AA),
                fontSize: 13,
                fontFamily: 'AppleSDGothicNeoL00',
                fontWeight: FontWeight.w400,
                height: 0,
              ),
            ),
          ],
        ),
        const Space(height: 10),
        // 키
        SizedBox(
          height: 48,
          child: TextFormField(
            onChanged: (tall) => onChagedTall(tall),
            textAlignVertical: TextAlignVertical.center,
            keyboardType: TextInputType.number,
            style: const TextStyle(
              color: Color(0xFF0031AA),
            ),
            decoration: const InputDecoration(
              contentPadding:
                  EdgeInsets.symmetric(vertical: 12, horizontal: 16),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xFFCECECE), width: 2),
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(16),
                  bottomRight: Radius.circular(16),
                  bottomLeft: Radius.circular(16),
                ),
              ),
              disabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xFF0031AA), width: 2),
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(16),
                  bottomRight: Radius.circular(16),
                  bottomLeft: Radius.circular(16),
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xFF0031AA), width: 2),
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(16),
                  bottomRight: Radius.circular(16),
                  bottomLeft: Radius.circular(16),
                ),
              ),
            ),
          ),
        ),
        const Space(height: 24),
        const Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              "How much do you weigh?",
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontFamily: 'AppleSDGothicNeoM00',
                fontWeight: FontWeight.w400,
                height: 0,
              ),
            ),
            Space(width: 4),
            Text(
              "*Only number",
              style: TextStyle(
                color: Color(0xFF0031AA),
                fontSize: 13,
                fontFamily: 'AppleSDGothicNeoL00',
                fontWeight: FontWeight.w400,
                height: 0,
              ),
            ),
          ],
        ),
        const Space(height: 10),
        // 몸무게
        SizedBox(
          height: 48,
          child: TextFormField(
            onChanged: (weight) => onChagedWeight(weight),
            textAlignVertical: TextAlignVertical.center,
            keyboardType: TextInputType.number,
            style: const TextStyle(
              color: Color(0xFF0031AA),
            ),
            decoration: const InputDecoration(
              contentPadding:
                  EdgeInsets.symmetric(vertical: 12, horizontal: 16),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xFFCECECE), width: 2),
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(16),
                  bottomRight: Radius.circular(16),
                  bottomLeft: Radius.circular(16),
                ),
              ),
              disabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xFF0031AA), width: 2),
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(16),
                  bottomRight: Radius.circular(16),
                  bottomLeft: Radius.circular(16),
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xFF0031AA), width: 2),
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(16),
                  bottomRight: Radius.circular(16),
                  bottomLeft: Radius.circular(16),
                ),
              ),
            ),
          ),
        ),
        // 구분선
        const Space(height: 16),
        const Divider(),
        const Space(height: 25),
      ],
    );
  }
}
