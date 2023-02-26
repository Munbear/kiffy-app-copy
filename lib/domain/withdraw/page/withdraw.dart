import 'package:Kiffy/domain/common/custom_app_bar.dart';
import 'package:Kiffy/domain/core/widget/global_bottom_navigation.dart';
import 'package:Kiffy/domain/withdraw/service/withdraw_reason.dart';
import 'package:Kiffy/domain/withdraw/service/withdrawal_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class WithdrawPage extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var selectedReason = useState<String>("");
    var selectedReasonValidation = useState(SelecteWithdrawalReason.success());
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        centerTitle: true,
        titleSpacing: 0,
        elevation: 0.5,
        title: const CustomAppBar(
          title: "Withdrawal",
          titleColor: Color(0xff828282),
          fontSize: 20,
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 18),
          const Text(
            "What is the reason for your withdrdawal?",
            style: TextStyle(
              fontSize: 18,
              color: Color(0xff6c6c6c),
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(height: 35),
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: WithDrawalReason.values.map((reason) {
              return GestureDetector(
                onTap: () {
                  selectedReason.value = WithDrawalReason.enumToString(reason);
                },
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 35, vertical: 5),
                  padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 21),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                      color: selectedReason.value == WithDrawalReason.enumToString(reason) ? const Color(0xff0031AA) : const Color(0xffcecece),
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    WithDrawalReason.enumToString(reason),
                    style: TextStyle(
                      fontSize: 20,
                      color: selectedReason.value == WithDrawalReason.enumToString(reason) ? const Color(0xff0031AA) : const Color(0xff6c6c6c),
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 35),
            child: ElevatedButton(
              onPressed: () {
                selectedReasonValidation.value = ref.read(withdrawalProvider.notifier).setReason(selectedReason.value);
                if (selectedReasonValidation.value.isValid) {
                  print("hellp");
                } else {
                  print("fail");
                }
              },
              child: Text(
                "Next",
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
          const SizedBox(height: 26),
          const CustomBottomNavigationBar(),
        ],
      ),
    );
  }
}
