import 'package:Kiffy/infra/openapi_client.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:openapi/openapi.dart';

final optionProfileTagProvider = FutureProvider.autoDispose<List<dynamic>>(
  (ref) async {
    final res = ref.read(openApiProvider).getTagApi().apiTagV1TagGet();
    return [];
  },
);
