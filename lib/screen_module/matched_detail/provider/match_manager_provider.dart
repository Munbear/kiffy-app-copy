import 'package:Kiffy/infra/openapi_client.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final matchManagerProvider = Provider((ref) => MatchManagerProvider(ref: ref));

class MatchManagerProvider {
  Ref ref;

  MatchManagerProvider({
    required this.ref,
  });

  Future<void> cancelMatch(String matchId) async {
    ref.read(openApiProvider).getMatchApi().apiMatchV1MatchMatchIdDelete(
          matchId: matchId,
        );
  }
}
