import 'package:Kiffy/screen_module/my_setting/widget/withdrawal_reason_item.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class WithdrawalReason extends StatefulWidget {
  final ValueChanged<String> onChanged;

  const WithdrawalReason({super.key, required this.onChanged});

  @override
  State<WithdrawalReason> createState() => _WithdrawalReasonState();
}

class _WithdrawalReasonState extends State<WithdrawalReason> {
  final List<String> reasons = [
    tr("text.my_setting.withdrawal.reason1"),
    tr("text.my_setting.withdrawal.reason2"),
    tr("text.my_setting.withdrawal.reason3"),
    tr("text.my_setting.withdrawal.reason4"),
  ];
  String? selectedReason;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: reasons
          .map(
            (reason) => WithdrawalReasonItem(
                reason: reason,
                onTap: (selectReason) {
                  setState(() {
                    selectedReason = selectReason;

                    if (selectedReason != null) {
                      widget.onChanged(selectedReason!);
                    }
                  });
                },
                isSelected: selectedReason == reason),
          )
          .toList(),
    );
  }
}
