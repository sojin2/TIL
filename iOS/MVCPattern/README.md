# MVC Pattern

## **MVC 패턴이란?**

MVC 패턴은 **애플에서 기본적으로 지원하는 디자인 패턴**으로, **Model + View + Controller** 구조의 아키텍처 패턴을 말합니다.

일반적으로 가장 많이 알려지고, 익숙한 MVC 패턴과는 다르게 Apple은 다른 MVC 패턴을 사용하고 있습니다.

두가지 다 알아봅시다!

### **MVC 패턴 (익숙한)**

![https://blog.kakaocdn.net/dn/Q0f6d/btro8waS0Eh/vBUJXksgh3B2ZkXN4wGVwK/img.png](https://blog.kakaocdn.net/dn/Q0f6d/btro8waS0Eh/vBUJXksgh3B2ZkXN4wGVwK/img.png)

위 이미지가 가장 익숙하고 유명한 MVC 패턴입니다.

이 패턴은 Model, View, Controller로 쉽게 설계가 가능하지만 **Mode과 View가 상당히 의존적**입니다.

그래서 프로젝트가 **커질수록(복잡해질수록) Controller 유지보수가 힘들어집니다. (기술 부채 증가)**

### **Apple MVC 패턴**

Apple에서 사용하는 MVC 패턴은 아래 이미지와 같습니다.

![https://blog.kakaocdn.net/dn/b3rWMJ/btrpaHwumtn/S0gOHFpBdLk0TgE2SBSm0k/img.png](https://blog.kakaocdn.net/dn/b3rWMJ/btrpaHwumtn/S0gOHFpBdLk0TgE2SBSm0k/img.png)

**View와 Controller를 결합**시킨 패턴이며, **매우 쉽고 간편**합니다.

마찬가지로 **프로젝트가 커질수록 ViewController가 방대**해집니다. 때문에 당연히 **유지보수가 힘들어집니다.**

**Model과 VC가 의존**적이기 때문에, **단위테스트 또한 쉽지 않습니다.**

---

### **Model**

**데이터 담당**

보통은 Struct 타입이며 아주 드물게 class 타입도 있습니다.

- 데이터에 관한 로직 담당 (데이터 값 변경 및 관리)
- 비즈니스 로직 수행
- 상태 변화 처리
- 상태 정보 반환

### **View**

**UI 요소(UIView) 담당**

화면에 보여지는 부분입니다.

예를들어) label, button, image 등,,,

- 데이터의 시각화 & UI 담당
- 모델이 처리한 데이터를 컨트롤러에서 받아 사용
- 어떤 데이터와 로직이 있으면 X

### **Controller**

**View와 Model의 중계자**

어떤 식으로 중계하는데요?

View - Model한테 받은 데이터를 ~식으로 표현해줘 (어떻게 뷰를 보여줄지)

Model - 데이터를 수정할 필요가 있겠다! (데이터가 해야 할 수정 및 작업을 알려줌)

- 사용자의 요청을 해석하여 처리하고 결과를 반환

View로부터 사용자의 action을 받아 Model에게 어떤 작업을 해야 하는지 알려주거나,

Model의 데이터 변화를 View에게 전달하여 View를 어떻게 업데이트할지 알려준다.

- Model과 View를 연결 / 중간다리 역할(모델과 데이터의 존재를 혼자 알고있다.)
- 데이터의 흐름 제어

---

## **MVC를 지키며 코딩하는 5가지 방법**

### **1. Model은 Controller와 View에 의존하면 안된다.**

### **2. View는 Model에만 의존하고 Controller엔 의존하면 안된다.**

### **3. View가 Model로 부터 데이터를 받을때는 사용자마다 다르게 보여줘야하는 데이터만 받아야한다.**

### **4. Controller는 Model과 View에 의존해도 된다.**

### **5. View가 Model로 부터 데이터를 받을 때, 반드시 Controller에서 받아야한다**

---

## **장점 및 단점**

### **장점**

- **생산성이 높다** (역할을 분담하여 빠르게 구현)
- 다른 패턴에 비해 **코드량이 적다**.
- 애플에서 기본적으로 지원하고 있는 패턴이기 때문에 **쉽게 접근**할 수 있다.
- 많은 개발자들에게 친숙한 패턴이기 때문에 개발자들이 **쉽게 유지보수** 할 수 있다.
- 개발 속도가 빠르기 때문에 아키텍처가 중요하지 않을 때 사용하거나 **규모가 작은 프로젝트에서 사용하기 좋다.**

### **단점**

- Controller가 View의 Life Cycle까지 관리하기 때문에 View와 Controller를 **분리하기 어렵다**
- **재사용성**이 떨어진다.
- **유닛 테스트를 진행하기 힘들어진다.**
- 대부분의 코드가 **Controller에 밀집**될 수 있다.
- delegate나 datasource 관리, 네트워크 요청, DB에 데이터 요청 등 많은 코드가 Controller에 작성되면 Controller의 **크기는 비대해지고 내부 구조는 복잡**해지게 된다. (컨트롤러의 중복 로직, DB접근성)

---

## **마치며**

MVC 간단하게 정리해보겠습니다.

apple MVC Pattern은 View와 Controller가 결합되어있는 형태이며, apple 공식 아키텍쳐 입니다.

생산성과 유지보수가 좋으며 규모가 작은 프로젝트를 할때 적합한 디자인 패턴입니다.

하지만, 유닛 테스트가 어렵고 대부분의 코드가 Controller에 밀집될 수 있으며 이로인해 내부 구조가 더 복잡해 질 수 있습니다.

그래서 큰 프로젝트를 할때에는 다른 디자인 패턴을 사용하는게 적합합니다. (MVVM같은?)

MVC 예시 코드는 같이 첨부되어있습니다.
