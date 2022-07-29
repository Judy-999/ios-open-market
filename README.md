
# 🛍 오픈마켓 OPEN MARKET
> **프로젝트 기간** : 2022.07.11 월  ~ 2022.07.20 수 </br>**리뷰어** : [콘](@protocorn93)
---
## 🪧 목차
- [📜 프로젝트 소개](#-프로젝트-소개)
- [👥 팀원](#-팀원)
- [💾 개발환경 및 라이브러리](#-개발환경-및-라이브러리)
- [💡 Step 1 핵심경험](#-step별-핵심경험)
- [🕰 타임라인](#-타임라인)
- [📱 구현 화면](#-구현-화면)
- [🧑‍💻 코드 설명](#-코드-설명)
- [⛹🏻‍♀️ STEP 1 트러블 슈팅](#%EF%B8%8F-step-1-트러블-슈팅)
- [⛹🏻‍♀️ STEP 2 트러블 슈팅](#%EF%B8%8F-step-2-트러블-슈팅)
- [⛹🏻‍♀️ STEP 3 트러블 슈팅](#%EF%B8%8F-step-3-트러블-슈팅)
- [⌨️ 커밋 규칙](#%EF%B8%8F-커밋-규칙)
- [🔗 참고 링크](#-참고-링크)


<br>

## 📜 프로젝트 소개
> 물건 팔아요~ 오픈 마켓<br>
> 상품 목록 리스트와 그리드 뷰 형식으로 보여주는 화면 구성, 새로운 상품을 등록할 수 있는 화면 구성, 실제 서버와 통신하여 등록한 상품을 생성할 수 있는 기능.

<br>

## 👥 팀원

| **재재(ZZBAE)** | **주디(Judy)** |
|:---:|:---:|
|![](https://i.imgur.com/Xa9oBRA.png)|<img src="https://i.imgur.com/n304TQO.jpg" width="400" height="400" />|
|[Github](https://github.com/ZZBAE)|[Github](https://github.com/Judy-999)|

<br>

## 💾 개발환경 및 라이브러리
[![swift](https://img.shields.io/badge/swift-5.6-orange)]() [![xcode](https://img.shields.io/badge/Xcode-13.4.1-blue)]()
<br>


## 💡 Step별 핵심경험
- [x] 파싱한 JSON 데이터와 매핑할 모델 설계
- [x] URL Session을 활용한 서버와의 통신
- [x] CodingKeys 프로토콜의 활용
- [x] 네트워크 상황과 무관한 네트워킹 데이터 타입의 단위 테스트(Unit Test)
- [x] Safe Area을 고려한 오토 레이아웃 구현
- [x] Collection View의 활용
- [x] Mordern Collection View 활용
- [x] multipart/form-data의 구조 파악
- [x] URLSession을 활용한 multipart/form-data 요청 전송
- [x] 사용자 친화적인 UI/UX 구현 (적절한 입력 컴포넌트 사용, 알맞은 키보드 타입 지정)
- [x] UIAlertController 액션의 completion handler 활용
- [x] UIAlertController의 textFields 활용
- [x] UICollectionView 를 통한 좌우 스크롤 기능 구현

<br>

## 🕰 타임라인

**첫째 주**
| 날짜 | 내용 |
|:---:|:---:|
|**7/11(월)**|step1-1  모델 타입 구현|
|**7/12(화)**|URLSession, MockURLSession 구현, UnitTest (step1-2) 후 STEP 1 PR|
|**7/13(수)**|리뷰기반 STEP 1 리팩토링 (UICollectionViewList 연습)|
|**7/14(목)**|UICollectionViewList 연습구현 후 기본 틀 생성|
|**7/15(금)**|List CollectionView 기본 구현, 리드미 작성|

**둘째 주**
| 날짜 | 내용 |
|:---:|:---:|
|**7/18(월)**|서버에서 데이터 가져온 후 ListCell 화면 구현|
|**7/19(화)**|GridCell 화면 구현 및 개인 공부|
|**7/20(수)**|View안 세부적인 부분 수정, 에러 핸들링, loadingIndicator 화면 구현 후 STEP 2 PR|
|**7/21(목)**|개인 공부|
|**7/22(금)**|리드미 작성 및 STEP 2 리뷰 반영 리팩토링 진행|

**셋째 주**
| 날짜 | 내용 |
|:----:|:---:|
|**7/25(월)**|step2의 간단한 리팩토링 및 multipart-formdata 공부|
|**7/26(화)**|서버와 소통하는 post, patch, delete 연습용 코드로 multipart-formdata 기능 구현|
|**7/27(수)**|상품등록화면 구성 구현, UIImagePickerController 활용하여 이미지 부분 구현|
|**7/28(목)**|상품등록 textView와 키보드, 연습용 코드를 실제 서버와 소통할 수 있게끔 수정, 상품등록화면을 상품수정화면으로 재사용할 수 있게끔 구현|
|**7/29(금)**|추가 리팩토링, Readme.md 작성 및 step 1 PR|

<br>

---

## 📱 구현 화면

| 상품의 ListView | 상품의 GridView | 상품을 등록하는 화면 |
|:---:|:---:|:---:|
|![](https://i.imgur.com/qODkdGJ.gif)|![](https://i.imgur.com/LXZsYu6.gif)|![](https://i.imgur.com/djsjE9H.gif)|

| 상품 기본 정보 입력 | 상품 상세 설명 입력 | 상품의 이미지 최대 5장까지 추가 |
|:---:|:---:|:---:|
|![](https://i.imgur.com/YjFMx7A.gif)|![](https://i.imgur.com/AOUbqYN.gif)|![](https://i.imgur.com/4gvsZuo.gif)|
|상품명, 상품가격, 할인가격, 재고수량 정보 입력할 때 해당 키보드가 나오게끔 구현|상품의 상세 설명이 길어져도 밑에서 올라오는 키보드가 설명칸을 가리지 않게끔 구현|상품 이미지를 정사각형으로 넣을 수 있고, 1장 ~ 5장을 추가할 수 있도록 구현|

---

## 🧑‍💻 코드 설명
**[ STEP 1 ]**
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

#### 4) **Item**
> product Model에서 가져온 정보를 뷰에다가 뿌려줄 Item 정보들
- `productImage`(상품이미지), `productName`(상품이름), `price`(상품의 원래 가격), `bargainPrice`(상품의 할인된 가격), `stock`(잔여수량), `devidePrice`(상품 가격을 천의 단위로 , 넣어주는 함수)

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

**[ STEP 2 ]**
### **View**
#### 1) LoadingIndicator
> 로딩화면을 시작하고 끝내는 클래스
- `showLoading`: 로딩화면을 실행하는 타입 메서드
- `hideLoading`: 로딩화면을 정지하는 타입 메서드

#### 2) MarketListCollectionViewCell
> 상품들을 List 형태로 보여주는 컬렉션 뷰 셀 
- `imageView`: 상품의 이미지
- `accessoryImageView`: 우측 `>` 이미지
- `nameLabel`: 상품의 이름 라벨
- `priceLabel`: 상품의 원가, 할인가격 라벨
- `stockLabel`: 상품의 잔여수량 라벨
- `horizontalStackView`: 상품 이름과 `subHorizontalStackView`를 묶어준 스택뷰
- `subHorizontalStackView`: 잔여수량, `>`를 묶어준 스택뷰
- `verticalStackView`: `horizontalStackView`와 상품 가격 라벨을 묶어준 스택뷰
- `entireStackView`: `verticalStackView`와 상품의 이미지를 묶어준 스택뷰
- `arrangeSubView`: 각 스택뷰의 Constraint를 잡아준 함수
- `extension CALayer {func addBottomBorder()}`: 셀 밑에 선처럼 보이게 `bottomBorder`를 만들어주는 함수


#### 3) MarketGridCollectionViewCell
> 상품들을 Grid 형태로 보여주는 컬렉션 뷰 셀
- `imageView`: 상품의 이미지
- `nameLabel`: 상품의 이름 라벨
- `priceLabel`: 상품의 원가, 할인가격 라벨
- `stockLabel`: 상품의 잔여수량 라벨
- `verticalStackView`: 위에 4가지 라벨을 묶어준 스택뷰
- `arrangeSubView`: 스택뷰의 Constraint를 잡아준 함수


### **ViewController**
#### 1) **MarketCollectionViewController**
> 상품 목록을 List와 Grid 형식으로 보여주는 컬렉션 뷰 셀을 관리하는 뷰컨트롤러
- `createListLayout` : List 형식의 `UICollectionViewLayout`을 반환하는 메서드
- `createGridLayout` : Grid 형식의 `UICollectionViewLayout`을 반환하는 메서드
- `makeListDataSource` : List Cell의 **Registration**을 설정하고 **DataSource**를 생성하는 메서드
- `makeGridDataSource` : : Grid Cell의 **Registration**을 설정하고 **DataSource**를 생성하는 메서드
- `receivePageData` : 서버를 통해 상품 데이터를 받아오는 메서드
- `applySnapshots` : 받아온 데이터로 **SnapShot**을 생성해 데이터소스에 적용하는 메서드
- `indexChanged` :`segmentedControl`의 값이 변경되었을 때 뷰의 모양을 바꾸는 메서드
<br>

**[ STEP 3 ]**

### **Model** 
#### **Param**
> 상품 등록 화면에 표시되는 해당 상품 정보들의 타입
- `vendorInfo`: 판매자의 `secret`과 `identifier`를 담은 열거형
- `Param`: productName(상품명), price(상품가격), discountedPrice(할인가격), currency(통화단위), stock(재고수량), description(상품상세설명), secret(VendorInfo의 사용자 비밀번호)
- `ImageParam`: imageName(이미지 파일 이름), imageType(이미지 파일 타입), imageData(이미지 데이터 타입)
<br>

### **View**
#### 화면 구성 정리본
<img src="https://i.imgur.com/uo6MJEY.png" width="500" height="500" />


#### 1) AddProductView
> 새로운 상품을 등록(또는 수정)하는 화면
- `arrangeSubView`: 요소들을 `SubView`에 넣고 제약을 설정하는 메서드 
- `createParam`: 입력된 정보들을 `Param`으로 반환해주는 메서드
- `configure`: `Param`의 각 요소들을 각각의 칸`(TextField)`에 넣어주는 메서드

#### 2) AddProductCollectiongViewCell
> 상품 등록 화면에서 이미지의 설정을 해주는 셀
- `arrangeSubView`: 상품 이미지의 constraint를 설정해주는 메서드
<br>

### ViewController
#### AddProductViewController
> 상품등록(또는 수정)하는 뷰를 관리하는 컨트롤러 
- `changeToEditMode`: 상품등록화면을 상품수정화면에서 사용할 수 있게끔 해주는 메서드
- `configureUI`: 상단의 네비게이션 아이템 넣어준 부분의 layout 잡아주는 메서드
- `goBack`: 상품리스트 화면으로 돌아가는 objc 메서드
- `goBackWithUpdate`: 상품의 정보들을 입력해준 후 post 해주고, 성공과 실패의 얼럿을 띄워주는 메서드
- `CollectionView's DataSource & Delegate`: `UICollectionViewDataSource`, `UICollectionViewDelegate`를 채택하여 뷰를 재사용할 수 있고, 이미지의 indexPath를 계산하여 얼럿을 띄워주고 제약을 걸어주는 메서드
- `ImagePickerController`: `UIImagePickerControllerDelegate`와 `UINavigationControllerDelegate`를 채택하여, post할 이미지의 설정과 제약을 걸어주는 메서드
- `UITextView`: `textView`에 작성을 시작하고 끝낼때의 `viewConstraint`를 조절해주는 메서드
<br>

---

## ⛹🏻‍♀️ STEP 1 트러블 슈팅
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

## ⛹🏻‍♀️ STEP 2 트러블 슈팅

### 1. 뷰 Constraint 관련
#### 1) `contentView` vs `self`
```swift
// MarketGridCollectionViewCell.swift
self.addSubview(verticalStackView)

NSLayoutConstraint.activate([
	 verticalStackView.topAnchor.constraint(equalTo: self.topAnchor, constant: 8),
         verticalStackView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -8),
	 verticalStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -8),
	 verticalStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 8),
	 imageView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.58)
])
```
Grid 셀과 List 셀 모두 콘텐츠에 대한 제약을 `self`와 관련하여 잡아주었습니다. **CollectionViewCell**에서 적어준 코드이니 `self`는 셀 자신이고 `contentView`는 셀 내부의 콘텐츠 영역이라고 생각해서 처음에는 `contentView`로 제약을 걸어주었습니다
<br>하지만 `contentView`에 제약을 설정하니 아래 사진에서 같이 콘텐츠(특히 이미지)가 셀 크기를 벗어나는 문제가 있어 `self`로 `constraints`를 주었는데 `self`로 셀에 직접 제약을 걸어도 되는지 궁금했습니다.

| **`self`로만 제약 걸어줄 때** | **`self.contentView`로 제약 걸어줄 때** |
|:---:|:---:|
|<img src="https://i.imgur.com/NFCiDqc.jpg" width="250" height="500" />|<img src="https://i.imgur.com/RVAJEoF.jpg" width="250" height="500" />|

해당 질문에 대해 리뷰어인 콘이 `contentView`에 해야한다고 알려주셨습니다. `contentView`의 공식문서에서 편집 모드일 때 레이아웃에 적절히 배치되기 위해서는 `contentView`에 아이템을 추가하는 것을 권장하고 있습니다.
> "you should add them to the content view so they position appropriately as the cell transitions in to and out of editing mode."

<br>

![](https://i.imgur.com/3J8bIHd.png)
⬆️ 해당 부분 변경된 코드 사진 첨부

처음에 `contentView`에 제약을 걸었을 때 문제가 생겼던 이유는 `self`에 `addsubView()`로 `stackView`를 추가하고 제약은 `contentView`에 걸었기 때문이었습니다.. `contentView`에  `addsubView()` 하는 것으로 변경하니 해결되었습니다.
<br>

#### 2) translatesAutoresizingMaskIntoConstraints 범위
`translatesAutoresizingMaskIntoConstraints = false` 는 전체를 감싼 `stackView`에서만 해주어도 되는지, 혹은 `stackView` 내부에 있는 모든 콘텐츠(label, image 등)마다 따로 설정을 해줘야하는건지 궁금했는데, 뷰 내부적으로 자동으로 false로 설정이 된다고 리뷰어분께서 설명해주셨습니다. 하지만 그래도 뷰 정의시 false로 지정하는 습관을 가져가는게 좋다고 해주셔서 각각의 콘텐츠마다 설정을 해주었습니다.
<br>

### 2. 콘솔 에러
처음 실행했을 때는 오류가 없다가 리스트 뷰에서 그리드 뷰로 전환하면 콘솔창에 `LayoutConstraints`관련 에러 메세지가 출력되었습니다. 빌드할 때는 지장이 가지 않고 뷰도 잘 나오기 때문에 어떤 문제인지 찾기 어려웠습니다.

<img src="https://i.imgur.com/ugHyK8y.png" width="600" height="400" />

<br>하지만 1번 트러블 슈팅 내용인 셀의 아이템들을 `contentView`에 넣고 제약을 걸어주었더니 자연스럽게 해결된 것으로 보아 아마 `self`로 셀 자체에 제약을 건 상태로 `Layout`을 변경하면서 문제가 생겼던 것 같습니다. 

<br>

### 3. StackView에 ImageView 넣기
컬렉션 뷰를 표시하면서 가장 문제였던 것은 이미지였습니다. List와 Grid 형식 모두 먼저 크게 하나의 **StackView**로 **Cell**에 제약을 걸고 그 **StackView**에 **ImageView**와 **Label**을 넣었습니다. 하지만 특히 이미지가 셀을 벗어나거나 크기가 제멋대로 나오는 문제가 자주 발생했습니다. 현재는 이미지에 크기를 지정하여 표시되는 것은 해결하였는데 혹시 **StackView** 안에 **ImageView**를 넣는 것이 좋지 않은 방법인가 고민했습니다.

리뷰어 콘이 말씀해주신 것처럼, 이미지뷰에 별도 사이즈를 지정하거나 제약을 가하지 않으면 이미지 크기가 이미지뷰의 크기가 되기 때문에 밑의 사진 처럼 나오는 것 ``(intrinsic content size)`` 이라고 이해했습니다.

| **제각각인 이미지 사이즈 예시** | **이미지 사이즈 제약 실패 예시** |
|:---:|:---:|
|<img src="https://i.imgur.com/yLg1jSC.jpg" width="300" height="600" />|![](https://i.imgur.com/xvb55xa.gif)|

<br>

## ⛹🏻‍♀️ STEP 3 트러블 슈팅
### 1. 텍스트뷰 자동 스크롤 
**TextView**에 글자를 입력 시 글자가 키보드에 가려지지 않게 즉 키보드 위로 자동으로 스크롤되도록 하는 요구사항이 있습니다. 키보드 위로 글자가 보이게 하는 방법을 세가지로 시도해봤습니다.

#### 1) StackView의 Constraint 변경
```swift
extension ProductViewController: UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
        productView.entireStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -300).isActive = true
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        productView.entireStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -8).isActive = true
    }
}
```
첫 번쩨는 **TextView**가 속해있는 **StackView**의 **Constraint**를 변경해보려고 했습니다. 키보드 크기만큼 **bottom**을 올렸다가 입력이 끝나면 내리도록 했는데 올리는 것은 성공했으나 다시 내려오지 않았습니다.

#### 2) View의 높이 변경
```swift
extension ProductViewController: UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
         view.frame.size.height -= 300
    }

    func textViewDidEndEditing(_ textView: UITextView) {
        view.frame.size.height += 300
    }
}
```
두 번째 방법으로 전체 **View**의 높이를 변경해봤습니다. 키보드 크기만큼 올린 후 다시 내려오는 것이 가능했으니 빈 부분이 검정색으로 보이고 **View**가 압축되어 일그러졌습니다.

#### 3) Content Offset 변경
```swift
extension ProductViewController: UITextViewDelegate {
    func textViewDidChange(_ textView: UITextView) {
        productView.descriptionTextView.setContentOffset(CGPoint(x: 0, y:  productView.descriptionTextView.contentSize.height - productView.descriptionTextView.bounds.height + 300), animated: false)
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        productView.descriptionTextView.setContentOffset(CGPoint(x: 0, y:  productView.descriptionTextView.contentSize.height - productView.descriptionTextView.bounds.height), animated: false)
    }
}
```
마지막으로는 **TextView**의 스크롤의 커서 위치를 조절하려 했습니다. 하지만 입력을 시작하자마자 키보드 위치로 커서가 이동해버렸고, 입력을 끝내면 다시 위로 이동시키는 것이 어려웠습니다.

#### 시도했던 방법의 예시와 문제점
| StackView| View    | Content Offset   |
| :---: | :---: | :-------------: |
| ![](https://i.imgur.com/5zIHntC.gif)              | ![](https://i.imgur.com/jsvOAix.gif) | ![](https://i.imgur.com/UIqfDXS.gif)                      |
| TextView의 크기가 줄어들었으나 다시 돌아오지 않음 | 위로 올라간 후 다시 내려오지만 view가 압축되어 일그러짐   | 처음부터 중간에서 시작하게 되고 입력이 끝나면 아래로 이동 |

<br>

#### (최종) 첫 번째 방법 사용
최종적으로 첫 번째 방법을 사용했습니다. 첫 시도에서 발생했던 문제는 계속 새로운 **Constraint**를 추가해서 상충됐기 때문이었습니다. 

```swift
private lazy var viewConstraint = productView.entireStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -260)

extension AddProductViewController: UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
        viewConstraint.isActive = true
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        viewConstraint.isActive = false
    }
}
```
하나의 **Constraint**를 선언해 `isActive`를 조절하는 방식으로 했습니다. 또한 기본적으로 뷰를 구성할 때 지정한 **bottom** 제약의 **Priority**를 낮춰서 상충없이 동작하도록 구현했습니다.
<br>

### 2. 스크롤 시 상품에 맞지 않는 이미지가 나오는 문제 해결
빠르게 스크롤 하다보면 엉뚱한 사진이 띄워져 있는 문제가 있었습니다. 서버를 통해 사진을 받아오는 요청은 비동기로 진행되고, **Cell**이 재사용되기 때문에 발생하는 문제였습니다. 사진의 용량이 크거나 느린 네트워크일 경우 이전에 요청한 사진이 뒤늦게 돌아와서 잘못된 이미지가 떴습니다.

[**문제 예시 - 제다이가 된 주디와 웡빙 (원래는 연예인 사진)**]

<img src="https://i.imgur.com/TnUm6tg.jpg" width="250" height="500" />

<br>이미지를 요청한 **Cell**과 현재 **Cell**이 일치하지 않았을 때의 문제이므로 **Cell**에 이미지를 할당하기 전에 이미지를 요청했던 **Cell** 비교하여 **Cell**이 일치한 경우에만 이미지를 넣도록 하여 해결했습니다.

```swift
 guard indexPath == self.collectionView.indexPath(for: cell) else { return }
```
<br>

### 3. 상위 셀 생성해 상속받기
이전 스텝에서 사용한 **LIST**와 **Grid Cell**이 중복된 코드가 많아 해결하고 싶었습니다.
`UICollectionViewCell`을 상속받는 `MarketCollectionViewCell`을 생성해 중복되는 UI와 메서드를 갖도록 했습니다. 이후 **LIST**와 **Grid Cell**이 `MarketCollectionViewCell`를 상속받아 사용할 수 있도록 하여 코드의 중복을 줄이고 추상화해 줄 수 있었습니다.
<br>

### 4. Alert은 Main Thread에서 실행하기
**get**이나 **post**와 같은 서버 요청이 실패한 경우 얼럿을 띄워 사용자에게 알려주도록 했는데 통신이 실패했을 때 얼럿이 뜨지 않고 아래와 같은 에러가 발생했습니다.

**Alert을 메인 스레드에서 하지 않았을 때 나타난 에러**
![](https://i.imgur.com/IkZy5AD.png)

얼럿을 띄우는 것 역시 UI 동작이기 때문에 `Main Thread`에서 실행되도록 변경해 해결했습니다.
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
**[Step 1]**<br>
[wody's tistory](https://wody.tistory.com/10)<br>[wody's notion](https://wodylikeios.notion.site/URLSession-Unit-Test-7a57917280b84a92b5a644adfac6246c)<br>[Fetching Website Data into Memory](https://developer.apple.com/documentation/foundation/url_loading_system/fetching_website_data_into_memory)<br>[Implementing Modern Collection Views](https://developer.apple.com/documentation/uikit/views_and_controls/collection_views/implementing_modern_collection_views)<br>[raywendelich test project](https://www.raywenderlich.com/16906182-ios-14-tutorial-uicollectionview-list#toc-anchor-003)<br>[URLSession](https://developer.apple.com/documentation/foundation/urlsession)<br>[오동나무의 비동기 테스트](https://yagom.net/courses/unit-test-%ec%9e%91%ec%84%b1%ed%95%98%ea%b8%b0/lessons/%eb%b9%84%eb%8f%99%ea%b8%b0-%eb%a9%94%ec%84%9c%eb%93%9c-%ed%85%8c%ec%8a%a4%ed%8a%b8%ed%95%98%ea%b8%b0/topic/completionhandler-%ed%85%8c%ec%8a%a4%ed%8a%b8%ed%95%98%ea%b8%b0/)<br>
**[Step 2]**<br>
[contentView](https://developer.apple.com/documentation/uikit/uitableviewcell/1623229-contentview)<br>[wody - UILabel에 취소선 (strikethroughStyle) 적용하기](https://wody.tistory.com/18)<br>[UICollectionViewCompositionalLayout](https://ios-development.tistory.com/945)<br>[Lists in UICollectionView](https://developer.apple.com/videos/play/wwdc2020/10026)<br>[UIActivityIndicatorView](https://ios-development.tistory.com/682)<br>[modernCellConfiguration](https://developer.apple.com/videos/play/wwdc2020/10027/)<br>[UICollectionViewDataSource](https://developer.apple.com/documentation/uikit/uicollectionviewdatasource)<br>[implementing Modern CollectionView](https://developer.apple.com/documentation/uikit/views_and_controls/collection_views/implementing_modern_collection_views)<br>
**[Step 3]**<br>
[UIImagePickerController 를 사용해 이미지 수정 및 가져오기](https://silver-g-0114.tistory.com/44)<br>[MultiPart통신 (멀티파트 이미지업로드)](https://nsios.tistory.com/39)<br>[URLSession으로 multipart/form-data request하기-wody](https://wody.tistory.com/16)<br>[UIImagePickerControllerDelegate](https://developer.apple.com/documentation/uikit/uiimagepickercontrollerdelegate)<br>[UITextViewDelegate](https://developer.apple.com/documentation/uikit/uitextviewdelegate)
