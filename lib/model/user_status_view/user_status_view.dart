import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:Kiffy/domain/core/model/user_status.dart';

part 'user_status_view.freezed.dart';
part 'user_status_view.g.dart';

@freezed
class UserStatusView with _$UserStatusView {
  factory UserStatusView({
    required String id,
    required String email,
    required UserStatus status,
  }) = _UserStatusView;

  factory UserStatusView.fromJson(Map<String, dynamic> json) => _$UserStatusViewFromJson(json);
}
