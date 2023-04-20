import 'package:Kiffy/model/paging_view/paging_view.dart';
import 'package:Kiffy/model/user_profile_view/user_profile_view.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'matched_user_profiles_view.freezed.dart';
part 'matched_user_profiles_view.g.dart';

@freezed
class MatchedUserProfilesView with _$MatchedUserProfilesView {
  factory MatchedUserProfilesView({
    required List<UserProfileView> list,
    required PagingView paging,
  }) = _MatchedUserProfilesView;

  factory MatchedUserProfilesView.fromJson(Map<String, dynamic> json) => _$MatchedUserProfilesViewFromJson(json);
}
