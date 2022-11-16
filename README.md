# cart_sample

yongju's new Flutter project.

기대됩니다!


## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.


# 🚀 1단계 - buildMethod를 Widget으로 분리하기

### 요구사항
- [ ] buildMethod로 구현된 코드들을 Widget으로 구현
  - [x] 가게명 위젯
    - [x] 생성자로 가게명을 주입 받는다.
  - [x] 상품 위젯
    - [x] 생성자로 상품명(메뉴명)을 주입 받는다.
    - [x] 생성자로 상품설명을 주입 받는다.
    - [x] 생성자로 가격을 주입 받는다.
  - [x] 더 담으러 가기 버튼
  - [ ] 결제 금액 위젯
  - [ ] 결제하기 버튼
- [ ] Stateless Widget으로 구현
- [ ] 데이터를 생성자로 전달 받아서 다른 음식점, 다른 메뉴도 표시할 수 있도록 수정
- [ ] class 네이밍은 자유롭게 하되, 의미 파악이 명확하도록 작성해주세요.



### note
- Dart 
  - DO name libraries, packages, directories, and source files using lowercase_with_underscores.
  - 라이브러리, 패키지, 디렉토리, 소스파일은 소문자와 언더스코어를 사용한다. [링크](https://dart.dev/guides/language/effective-dart/style#do-name-libraries-and-source-files-using-lowercase_with_underscores)
    - snake case 라는 표현을 안쓰네..?
- Flutter
  - 플러터 위젯을 사용하기 위해서는 반드시 상단에 위젯을 import를 해주어야 한다. `Dart != Flutter`
    - `import 'package:flutter/material.dart';`
    - `import 'package:flutter/cupertino.dart';`
    - meterial, cupertino는 위젯을 관리하는 테마? 같은 것 같다.. 멀티 플랫폼을 지원하기 위한.
    - 매번 import를 직접 입력해줘야하는 불편함.
    - 두 가지 import 방식의 차이점은? 멀티 모듈을 활용한 외부 프로젝트도 import 가능?
      - `import 'package:cart_sample/component/button_add_more.dart';`
      - `import 'component/button_add_more.dart.dart';`
  - 클래스를 만드니 key를 주입받는 생성자를 추가하라는데 Key는 위젯에서 사용하는 값으로 확인. 
    - key를 왜 사용하는지, 어떤 방식으로 사용해야 하는지 공부할 필요 있음!
  - 클래스 생성자
    - 자바와는 다르게(?) 멤버 변수에 할당하는 로직이 없다!
    - 생성자에서 인자를 여러개 받도록 정의된 경우 생성자를 호출할 때 인자명을 명시해줘야 한다.