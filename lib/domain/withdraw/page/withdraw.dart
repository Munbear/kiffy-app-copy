import 'package:Kiffy/config/router/route.dart';
import 'package:Kiffy/domain/common/custom_app_bar.dart';
import 'package:Kiffy/domain/common/custom_bottom_nav_bar.dart';
import 'package:Kiffy/domain/withdraw/service/withdraw_reason.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class WithdrawPage extends ConsumerStatefulWidget {
  static String get routeLocation => "/withdraw";
  static String get routeName => "withdraw";

  const WithdrawPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _WithdrawPageState();
}

class _WithdrawPageState extends ConsumerState<WithdrawPage> {
  String selectedReason = "";
  // var selectedReasonValidation = useState(SelecteWithdrawalReason.success());
  @override
  Widget build(BuildContext context) {
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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
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
                    selectedReason = WithDrawalReason.enumToString(reason);
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 5),
                    padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 21),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                        color: selectedReason == WithDrawalReason.enumToString(reason) ? const Color(0xff0031AA) : const Color(0xffcecece),
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      WithDrawalReason.enumToString(reason),
                      style: TextStyle(
                        fontSize: 20,
                        color: selectedReason == WithDrawalReason.enumToString(reason) ? const Color(0xff0031AA) : const Color(0xff6c6c6c),
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
            const Spacer(),
            ElevatedButton(
              onPressed: () {
                ref.read(routerProvider).pushNamed("withdrawText");
                // selectedReasonValidation.value = ref.read(withdrawalProvider.notifier).setReason(selectedReason.value);
                // if (selectedReasonValidation.value.isValid) {
                //   print("hellp");
                // } else {
                //   print("fail");
                // }
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
            const SizedBox(height: 26),
          ],
        ),
      ),
      bottomNavigationBar: const CustomBottomNavBar(currentPath: "/mypage"),
    );
  }
}
