import 'package:freezed_annotation/freezed_annotation.dart';

part 'paging_view.freezed.dart';
part 'paging_view.g.dart';

@freezed
class PagingView with _$PagingView {
  factory PagingView({
    required String? next,
  }) = _PagingView;

  factory PagingView.fromJson(Map<String, dynamic> json) => _$PagingViewFromJson(json);
}
