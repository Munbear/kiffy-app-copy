import 'package:Kiffy/domain/common/border._style.dart';
import 'package:Kiffy/domain/core/enum/contact_type.dart';
import 'package:flutter/material.dart';

class ProfileInputSnsButton extends StatelessWidget {
  final ContactType? selectedContactType;
  final ValueChanged<ContactType> onChanged;

  const ProfileInputSnsButton({super.key, required this.onChanged, this.selectedContactType});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: ContactType.values.map((contactType) {
        return GestureDetector(
          onTap: () {
            onChanged(contactType);
          },
          child: Container(
            height: 55,
            width: 55,
            margin: const EdgeInsets.only(right: 10),
            decoration:
            contactType == selectedContactType ? BorderGradientCircleShape.outlineGradientBoxDecoration : null,
            child: Container(
              padding: const EdgeInsets.all(4),
              decoration: BorderGradientCircleShape.innerDecoration,
              child: Stack(
                children: [
                  // icon Image
                  ContactType.contactAppIcon(contactType),
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: selectedContactType == contactType ? null : Colors.white.withOpacity(0.7),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}
