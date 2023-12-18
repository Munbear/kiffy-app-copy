import 'package:Kiffy/infra/openapi_client.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:openapi/openapi.dart';

// <List<ProfileTagViewTagTypesInner>>
final optionProfileTagProvider =
    FutureProvider.autoDispose<List<ProfileTagViewTagTypesInner>>(
  (ref) async {
    Response<ProfileTagView> res =
        await ref.read(openApiProvider).getTagApi().apiTagV1TagGet();
    List<ProfileTagViewTagTypesInner> data = res.data!.tagTypes.toList();
    return data;
  },
);
