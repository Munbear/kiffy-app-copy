Kiffy Application
---

## 패키지 구조
```
main.dart
ㄴ config : 설정파일들 ( route, firebase, constants 등 )
ㄴ bakcend : Backend API 통신부
ㄴ view : screen과 widget을 담는 저장소
  ㄴ {domainName} : 도메인 이름 (예 : 인증/프로필/탐색 등)
    ㄴ screen : screen(페이지)
    ㄴ widget : 위 스크린들에서 사용되는 위젯들 / ViewModel과 함께 사용함
    ㄴ service : 위 Screen 및 위젯에서 사용되는 API 및 로직 및 프로바이더
```

## 언어파일 다운로드받기
```shell
# translations 디렉토리로 이동
$ cd assets/translations

# 번역 파일 다운로드
$ localazy download json
```