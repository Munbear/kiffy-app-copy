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

final multiSelecteState = StateProvider.autoDispose<List<int>>((ref) => []);

final singleSelecteState = StateProvider.autoDispose<int?>((ref) => null);

final selecteZodiac = StateProvider.autoDispose<String?>((ref) => null);

final selectedMbitFirst = StateProvider.autoDispose<String?>((ref) => null);
final selectedMbitSecond = StateProvider.autoDispose<String?>((ref) => null);
final selectedMbitThird = StateProvider.autoDispose<String?>((ref) => null);
final selectedMbitFourth = StateProvider.autoDispose<String?>((ref) => null);
