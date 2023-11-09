Kiffy Mobile App
---

## 패키지 구조

```
main.dart
ㄴ config : 설정파일들 ( route, firebase 등 )
ㄴ constant : 공통 상수 ( enum 등 )
ㄴ screen : 화면 ( Scaffold )
ㄴ screen-module : 화면에서 사용하는 요소들
  ㄴ provider : 화면에서 사용하는 기능을 정의하는 곳 ( Provider / AutoDisposeStateNotifierProvider )
  ㄴ section : StatefulWidget / ConsumerStatefulWidget ( riverpod은 section에서만 사용할 수 있음 )
  ㄴ widget : StatelessWidget / StatefulWidget
ㄴ util : 유용한 함수를 모아놓는 곳
ㄴ infra : API 관련 코드
```

## 다국어 지원

- 언어 번역은 localazy를 사용합니다 --> [Localazy](https://localazy.com/p/kiffy)
- localzy에 접속해서 먼저 번역작업을 시작해주세요
  - 새로운 key가 필요하다면 source language에서 추가해주세요
  - 생성된 새로운 키를 각 나라의 언어에 맞게 번역해서 저장합니다

### 언어파일 다운로드

터미널에서 아래 명령어를 실행해주세요
```shell
# translations 디렉토리로 이동
$ cd assets/translations

# 번역 파일 다운로드
$ localazy download json
```

### 번역 사용하는 법

`tr()` 메소드를 이용해 언어파일을 사용할 수 있습니다.
```dart
import 'package:easy_localization/easy_localization.dart';

Text(tr("text.some.key"));
```

## OpenAPI (API Client) 사용하는 방법

pubspec.yaml에서 아래의 commit hash (version)을 올려주시면 자동으로 최신 API 클라이언트 코드를 사용할 수 있습니다. --> [확인하러가기](https://github.com/kiiffy/idl/commits/main)
```yaml
  openapi:
    git:
      url: git@github.com:kiiffy/idl.git
      path: openapi/gen/api/dart-dio
      ref: 최신 커밋 해시
```


## 앱 빌드하기
Android는 Android App Bundle 로 빌드해서 스토어에 등록합니다

루트디렉토리에서
```bash
$ flutter build appbundle --flavor prod
```
