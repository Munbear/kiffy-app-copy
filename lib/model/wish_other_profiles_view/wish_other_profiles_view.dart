import 'package:Kiffy/model/paging_view/paging_view.dart';
import 'package:Kiffy/model/user_profile_view/user_profile_view.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'wish_other_profiles_view.freezed.dart';
part 'wish_other_profiles_view.g.dart';

@freezed
class WishOtherProfilesView with _$WishOtherProfilesView {
  factory WishOtherProfilesView({
    required List<UserProfileView> list,
    required PagingView paging,
  }) = _WishOtherProfilesView;

  factory WishOtherProfilesView.fromJson(Map<String, dynamic> json) => _$WishOtherProfilesViewFromJson(json);
}
