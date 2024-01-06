import 'package:Kiffy/constant/contact_type.dart';
import 'package:Kiffy/screen_module/common/style/widget/border._style.dart';
import 'package:flutter/material.dart';

class ProfileContactTypeSelect extends StatelessWidget {
  ContactType? selectedContactType;
  final Function(ContactType contactType) onTap;

  ProfileContactTypeSelect({
    super.key,
    this.selectedContactType,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: ContactType.values.map((contactType) {
            return GestureDetector(
              onTap: () {
                onTap(contactType);
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
                        decoration: BoxDecoration(shape: BoxShape.circle),
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
      ),
    );
  }
}
