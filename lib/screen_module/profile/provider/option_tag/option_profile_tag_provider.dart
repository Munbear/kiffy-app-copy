import 'package:Kiffy/constant/mbti_type.dart';
import 'package:Kiffy/constant/zodiac_type.dart';
import 'package:Kiffy/infra/openapi_client.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:openapi/openapi.dart';

// 테그 가져오기
final optionProfileTagProvider =
    FutureProvider.autoDispose<List<ProfileTagViewTagTypesInner>>(
  (ref) async {
    Response<ProfileTagView> res =
        await ref.read(openApiProvider).getTagApi().apiTagV1TagGet();
    List<ProfileTagViewTagTypesInner> data = res.data!.tagTypes.toList();
    return data;
  },
);

// id 값 받기
final multiSelecteState = StateProvider.autoDispose<List<int>>((ref) => []);
// 남에게 듣는 성격 id
final singleSelecteState = StateProvider.autoDispose<int?>((ref) => null);
// mbti
final selectedMbitState = StateProvider.autoDispose<MBTI?>((ref) => null);
// 별자리
final selecteZodiac = StateProvider.autoDispose<Zodiac?>((ref) => null);
