import 'package:Kiffy/domain/common/custom_app_bar.dart';
import 'package:Kiffy/domain/common/custom_bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class WithdrawFinal extends HookConsumerWidget {
  const WithdrawFinal({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 26),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),
              SvgPicture.asset("assets/svg/warning_icon.svg"),
              const SizedBox(height: 19),
              const Center(
                child: Text(
                  "Withdrawal",
                  style: TextStyle(fontSize: 20, color: Color(0xff0031AA), fontWeight: FontWeight.w600),
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                "Are you sure you want to delete the account?",
                style: TextStyle(fontSize: 15, color: Color(0xff6c6c6c), fontWeight: FontWeight.w400),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
              const Text(
                "If you delete an account, it cannot be recovered.",
                style: TextStyle(fontSize: 15, color: Color(0xff6c6c6c), fontWeight: FontWeight.w400),
                textAlign: TextAlign.center,
              ),
              const Spacer(),
              ElevatedButton(
                onPressed: () {
                  // selectedReasonValidation.value = ref.read(withdrawalProvider.notifier).setReason(selectedReason.value);
                  // if (selectedReasonValidation.value.isValid) {
                  //   print("hellp");
                  // } else {
                  //   print("fail");
                  // }
                },
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
            ],
          ),
        ),
      ),
      bottomNavigationBar: const CustomBottomNavBar(currentPath: "/mypage"),
    );
  }
}
