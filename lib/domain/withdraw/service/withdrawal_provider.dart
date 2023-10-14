import 'package:Kiffy/domain/withdraw/service/withdraw_reason.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

var withdrawalProvider =
    StateNotifierProvider<WithdrawalInputState, WithdrawalInput>(
        (ref) => WithdrawalInputState(ref));

// 최종 회원 탈퇴 사유 객체
class WithdrawalInput {
  String reason;
  String? otherReason;

  WithdrawalInput({
    required this.reason,
    this.otherReason,
  });
}

// 회원 탈퇴 유효성검사 객체
class SelecteWithdrawalReason {
  bool isValid;
  String validationMessage;

  SelecteWithdrawalReason({
    required this.isValid,
    required this.validationMessage,
  });

  static SelecteWithdrawalReason fail(String message) =>
      SelecteWithdrawalReason(isValid: false, validationMessage: message);

  static SelecteWithdrawalReason success() =>
      SelecteWithdrawalReason(isValid: true, validationMessage: "");
}

class WithdrawalInputState extends StateNotifier<WithdrawalInput> {
  final Ref ref;

  WithdrawalInputState(this.ref)
      : super(
          WithdrawalInput(
            reason: WithDrawalReason.enumToString(WithDrawalReason.startNew),
            otherReason: "",
          ),
        );

  SelecteWithdrawalReason setReason(String? reason) {
    if (reason == null) {
      return SelecteWithdrawalReason.fail("* Please select reason");
    }

    state.reason = reason;
    return SelecteWithdrawalReason.success();
  }
}
