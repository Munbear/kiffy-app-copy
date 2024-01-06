import 'package:Kiffy/config/router/route.dart';
import 'package:Kiffy/infra/openapi_client.dart';
import 'package:Kiffy/screen/sign/sign_in_screen.dart';
import 'package:Kiffy/screen_module/withdrawal_screen_module/widget/withdrawal_reason.dart';
import 'package:Kiffy/screen_module/sign/provider/auth_provider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:openapi/openapi.dart';

class WithdrawalSection extends ConsumerStatefulWidget {
  const WithdrawalSection({super.key});

  @override
  ConsumerState<WithdrawalSection> createState() => _WithdrawalSectionState();
}

class _WithdrawalSectionState extends ConsumerState<WithdrawalSection> {
  int STEP = 1;
  String? selectedReason;

  Widget process() {
    if (STEP == 1) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 18),
          Text(
            tr("text.my_setting.withdrawal.question"),
            style: const TextStyle(
              fontSize: 18,
              color: Color(0xff6c6c6c),
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(height: 35),
          WithdrawalReason(
            onChanged: (reason) {
              setState(() {
                selectedReason = reason;
              });
            },
          ),
          const Spacer(),
          ElevatedButton(
            onPressed: () {
              if (selectedReason == null) {
                return;
              }

              setState(() {
                STEP = 2;
              });
            },
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 20),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              backgroundColor: const Color(0xff0031AA),
            ),
            child: Text(
              tr("text.next"),
              style: const TextStyle(
                fontSize: 20,
              ),
            ),
          ),
          const SizedBox(height: 26),
        ],
      );
    }

    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 26),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            SvgPicture.asset("assets/svg/warning_icon.svg"),
            const SizedBox(height: 19),
            Center(
              child: Text(
                tr("text.my.setting.withdrawal"),
                style: TextStyle(
                    fontSize: 20,
                    color: Color(0xff0031AA),
                    fontWeight: FontWeight.w600),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              tr("text.my.setting.withdrawal.last_question"),
              style: TextStyle(
                  fontSize: 15,
                  color: Color(0xff6c6c6c),
                  fontWeight: FontWeight.w400),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            Text(
              tr("text.my.setting.withdrawal.last_question2"),
              style: TextStyle(
                  fontSize: 15,
                  color: Color(0xff6c6c6c),
                  fontWeight: FontWeight.w400),
              textAlign: TextAlign.center,
            ),
            const Spacer(),
            ElevatedButton(
              onPressed: () async {
                await ref
                    .read(openApiProvider)
                    .getMyApi()
                    .apiUserV1MyWithdrawalDelete(
                        withdrawalRequest: WithdrawalRequest((b) {
                  b.reasons.add(selectedReason!);
                }));

                await ref.read(authProvider).logout();

                ref.read(routerProvider).replace(SignInScreen.routeLoaction);
              },
              child: Text(
                tr("text.my.setting.withdrawal.complete"),
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 20),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                backgroundColor: const Color(0xff0031AA),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: process(),
    );
  }
}
