
# 🛍 오픈마켓 OPEN MARKET
> **프로젝트 기간** : 2022.07.11 월  ~ 2022.07.12 화 </br>**리뷰어** : [콘](@protocorn93)
---
## 🪧 목차
- [📜 프로젝트 소개](#-프로젝트-소개)
- [👥 팀원](#-팀원)
- [💾 개발환경 및 라이브러리](#-개발환경-및-라이브러리)
- [💡 Step 1 핵심경험](#-step-1-핵심경험)
- [🕰 타임라인](#-타임라인)
- [🧑‍💻 코드 설명](#-코드-설명)
- [⛹🏻‍♀️ 트러블 슈팅](#%EF%B8%8F-트러블-슈팅)
- [⌨️ 커밋 규칙](#%EF%B8%8F-커밋-규칙)
- [🔗 참고 링크](#-참고-링크)


<br>

## 📜 프로젝트 소개
> 물건 팔아요~ 오픈 마켓 : 상품 목록 리스트와 그리드 뷰 형식으로 보여주는 화면 구성

<br>

## 👥 팀원

| **재재(ZZBAE)** | **주디(Judy)** |
|:---:|:---:|
|![](https://i.imgur.com/Xa9oBRA.png)|<img src="https://i.imgur.com/n304TQO.jpg" width="460" height="460" />|
|[Github](https://github.com/ZZBAE)|[Github](https://github.com/Judy-999)|

<br>

## 💾 개발환경 및 라이브러리
[![swift](https://img.shields.io/badge/swift-5.6-orange)]() [![xcode](https://img.shields.io/badge/Xcode-13.4.1-blue)]()
<br>


## 💡 Step 1 핵심경험
- [x] 파싱한 JSON 데이터와 매핑할 모델 설계
- [x] URL Session을 활용한 서버와의 통신
- [x] CodingKeys 프로토콜의 활용
- [x] 네트워크 상황과 무관한 네트워킹 데이터 타입의 단위 테스트(Unit Test)
<br>

## 🕰 타임라인

- **7/11 (월)** :  step1-1  모델 타입 구현
- **7/12 (화)**: URLSession, MockURLSession 구현, UnitTest (step1-2) 후 step1 PR
- **7/13 (수)**: 리뷰기반 리팩토링 (UICollectionViewList 연습)
- **7/14 (목)**:  UICollectionViewList 연습구현 후 기본 틀 생성
- **7/15 (금)**: 이미지, 상품이름, 가격 넣어보기 (min) (+ customCell로 만들고, 악세서리,,,)
<br>

## 🧑‍💻 코드 설명

### **Model** 
#### 1) Product
> 상품 정보를 파싱할 구조체
- JSON 키 값을 스위프트의 네이밍에 맞게 변환하기 위해 `CodingKeys` 프로토콜의 활용

#### 2) **Page**
> 상품 리스트를 가진 페이지 정보를 파싱할 구조체
- JSON 키 값을 스위프트의 네이밍에 맞게 변환하기 위해 `CodingKeys` 프로토콜의 활용

#### 3) **Currency**
> 통화의 단위를 나타내는 열거형
- case: `krw = "KRW"`, `usd = "USD"`
<br>

### **Protocol**
#### 1) URLSessionProtocol
```swift
dataTask(with request: URLRequest, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTaskProtocol
```
- 위 메서드를 구현하도록 함
- `URLSession`과 `MockURLSession`에서 채택

#### 2) URLSessionDataTaskProtocol
- `resume()`을 구현하도록 함
- `URLSessionDataTask`와 `MockURLSessionDataTask`에서 채택
<br>

### **URLSession**
#### 1) **URLSessionProvider**
> 네트워킹에 사용할 세션을 제공하는 클래스
- `session` : 통신에 사용할 세션 프로퍼티 -> `URLSession` 또는 `MockURLSession`
- `baseURL` : api-host를 담은 프로퍼티
- `dataTask` : `session`의 `dataTask` 메서드를 통해 서버로 부터 데이터를 받아오는 메서드
- `receivePage` : `URLRequest`를 만들어 `dataTask`를 통해 상품 리스트를 받아오는 메서드

#### 2) **DataTaskError**
> 통신 과정에서 발생할 수 있는 에러를 정의한 열거형
- case: `incorrectResponseError`, `invalidDataError`

### **Mock**
#### 1) **MockURLSession**
> Mock 테스트를 위해 사용할 가짜 세션
- `isSuccess`: 인위적으로 결정할 통신 성공, 실패 여부 프로퍼티
- `dataTask` : 실제로 통신하지 않고 지정된 결과를 반환하는 메서드

#### 2) **MockURLSessionDataTask**
> URLSessionDataTaskProtocol에 있는 resume 함수 변경
- `newResume()`은 `resume()`의 실행을 하는 함수
<br>

##  ⛹🏻‍♀️ 트러블 슈팅
### 1. **URLSession 관련 로직 고민**
요구명세서에 나와있는 것처럼 실제 API 서버와 통신하지 않고, `MockData`를 사용하여 테스트를 하기 위해 `MockURLSession`을 생성하고, `URLSession`도 동일하게 protocol을 채택하고 extension 구현을 해주었습니다. 처음에는 `mockURLSession`을 굳이 구현해주지 않고 어차피 나중에 사용할 (실제 서버와 소통을 하는) `URLSession`을 활용해주려고 했는데, 그러면 step 1의 명세대로 구현을 하기가 어려울 것 같아 따로 `mockURLSession`을 생성해주었습니다.<br>
그리고 `URLSessionProvider` 생성 후 `URLSessionProvider`에 있는 `dataTask` 메서드를 구현해준 뒤 `MockURLSession`에서 그 메서드를 가로채와서 상세구현 후 `MockData`로 UnitTest를 진행하는 방식으로 전반적인 step 1 의 방향을 잡았습니다
<br>

### 2. **Mock 테스트를 한 방법**
UnitTest는 서버와 소통을 하지 않는 `MockURLSession`으로 진행했습니다. `MockURLSession` 내부의 `dataTask`는 실제 서버 통신을 하지 않고 `isSuccess`프로퍼티를 통해 임의로 지정한 성공-실패 여부에 따라 `HTTPURLResponse`를 보내도록 했습니다. 성공 시 **MockData**를 반환하고, 실패 시 400번대 응답코드를 반환하도록 했습니다.
<br>
UnitTest에서는`receivePage` 메서드를 통해 서버요청이 성공한 경우에는 받아온 **jsonData**가 이미 가지고 있는 **mockData**와 같은지, 서버요청이 실패한 경우에는 에러를 반환하는지를 테스트하는 함수를 만들어주었습니다. 혹시 추가로 할 수 있는 테스트는 어떤 종류가 있을지, 아니면 더 이상 테스트를 하지 않아도 되는지 콘의 의견이 궁금합니다.
<br>

### 3. **URLSessionDataTask deprecated warning 해결**
밑의 사진처럼 `URLSessionDataTask`에서 deprecated warning이 떴는데, 코드 빌드에는 문제가 되지 않았지만 애플에서 지양하도록 권장하는 경고이기 때문에 해결을 하고 싶었습니다.

![](https://i.imgur.com/iRiU811.png)

>    1. `URLSessionDataTask`를 상속받으면서 생기는 에러니까 상속 대신에 `URLSessionDatatTaskProtocol`을 만들고 conform하면?
>    2. `MockURLSessionDataTask`를 `URLSessionDataTask`의 상속이 아니라 `URLSessionDatatTaskProtocol`을 채택하도록 변경
>    3. `resume` 앞에 override 키워드 제거
>    4. `URLSessionProtocol`의 `dataTask` 함수에서 `URLSessionDataTask`를 반환한 부분을 `URLSessionDataTaskProtocol`을 반환하도록 변경
>    5. `URLSession`에는 `URLSessionDataTaskProtocol`을 반환하는 기본 메서드가 없어서 `URLSession`안에서 해당 함수를 선언해주고, 이 안에서는 `dataTask(with:completionHandler:)`함수 호출

<br> 이런 흐름의 생각을 반영하여 `URLSessionDatatTaskProtocol`을 생성한 후 `URLSessionDataTask`과 `MockURLSessionDataTask`이 protocol을 conform하게끔 만들어주었습니다.
<br>

## ⌨️ 커밋 규칙
* feat    : 기능 추가 (새로운 기능)
* refactor : 리팩토링 (네이밍 수정 등)
* style   : 스타일 (코드 형식, 세미콜론 추가: 비즈니스 로직에 변경 없음)
* docs    : 문서 변경 (문서 추가, 수정, 삭제)
* test    : 테스트 (테스트 코드 추가, 수정, 삭제: 비즈니스 로직에 변경 없음)
* chore   : 기타 변경사항 (빌드 스크립트 수정 등)
<br>

## 🔗 참고 링크

[wody's tistory](https://wody.tistory.com/10)<br>[wody's notion](https://wodylikeios.notion.site/URLSession-Unit-Test-7a57917280b84a92b5a644adfac6246c)<br>[Fetching Website Data into Memory](https://developer.apple.com/documentation/foundation/url_loading_system/fetching_website_data_into_memory)<br>[Implementing Modern Collection Views](https://developer.apple.com/documentation/uikit/views_and_controls/collection_views/implementing_modern_collection_views)<br>[raywendelich test project](https://www.raywenderlich.com/16906182-ios-14-tutorial-uicollectionview-list#toc-anchor-003)<br>[URLSession](https://developer.apple.com/documentation/foundation/urlsession)<br>[오동나무의 비동기 테스트](https://yagom.net/courses/unit-test-%ec%9e%91%ec%84%b1%ed%95%98%ea%b8%b0/lessons/%eb%b9%84%eb%8f%99%ea%b8%b0-%eb%a9%94%ec%84%9c%eb%93%9c-%ed%85%8c%ec%8a%a4%ed%8a%b8%ed%95%98%ea%b8%b0/topic/completionhandler-%ed%85%8c%ec%8a%a4%ed%8a%b8%ed%95%98%ea%b8%b0/)<br>
