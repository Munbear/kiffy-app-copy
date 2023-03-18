import 'package:Kiffy/config/router/route.dart';
import 'package:Kiffy/domain/common/custom_app_bar.dart';
import 'package:Kiffy/domain/common/custom_bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class WithdrawText extends HookConsumerWidget {
  const WithdrawText({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              "What is the reason for your withdrdawal?",
              style: TextStyle(
                fontSize: 18,
                color: Color(0xff6c6c6c),
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(height: 35),
            TextField(
              // onChanged: (t) => inputIntro.value = t,
              minLines: 5,
              maxLines: 5,
              style: const TextStyle(fontSize: 20, color: Color(0xFF6C6C6C)),
              decoration: InputDecoration(
                hintText: "Reason for withdraw",
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Color(0xffcecece), width: 2.0),
                  borderRadius: BorderRadius.circular(8),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Color(0xff0031AA), width: 3.0),
                  borderRadius: BorderRadius.circular(8),
                ),
                contentPadding: const EdgeInsets.all(18),
              ),
            ),
            const Spacer(),
            ElevatedButton(
              onPressed: () {
                ref.read(routerProvider).replace("/withdrawFinal");
              },
              child: const Text(
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
          ],
        ),
      ),
      bottomNavigationBar: const CustomBottomNavBar(currentPath: "/mypage"),
    );
  }
}
