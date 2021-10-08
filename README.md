# servlet-practices
# Servlet & JSP

정리는 내 블로그에 https://ok-vamos.tistory.com/27

일딴 Servlet & JSP 하기 전에 네트웍의 이해가 필요하다. 무작정 따라 하면 그냥 아... 이게 이거구나 하고 넘어 갈수는 있지만 그래도 알고 가자.

필자가 다 알지는 못해도 내가 알고 있는것 기반으로 적을껀데 틀린 것 있으면 피드백 부탁드립니다.

## 인터넷( 네트웍 통신)의 이해

### 인터넷 (Internet)

-   TCP/IP 기반의 네트워크가 전세계적으로 확대되어 하나로 연결된 네트워크들의 네트워크 (네트워크의 결합체)

### TCP / IP

-   하드웨어, 운영체계, 접속 매체와 관계없이 동작할 수 있는 개방형 구조
-   OSI 7 계층에서 4계층으로 단순화.

[##_Image|kage@TeMSr/btrg4KGHvIn/7iAkGenTYz1zQC9AMoWqgk/img.png|alignCenter|data-origin-width="802" data-origin-height="366" data-ke-mobilestyle="widthOrigin"|||_##]

```
TCP/IP 가 정말 중요한데 잘 모르는게 현실이다. 위의 내용은 너무 사전적이라 외우기도 싫다. 

그래서 최대한 쉽게 정리해보겠다.

일딴 패킷이 뭔지 알아야한다.
DATA 인터넷 망을 타고 데이터를 전송 할 때
작게 짤라서 보내준다.

마치 SF의 영화에 워프(순간이동)할때 사람을 원자나 분자 단위로 눈에 안보이게 작게 만들어서 다른 공간에보내는 것과 비슷하다.

원자단위로 분해된 사람이 목적지에 도달해서 다시 원위치로 가야되는데....다리가 팔위치로 가있고 눈이 입위치에 있거나 손가락이랑 발가락이 바뀌어서 도착하면 안될 것이다. 혹은 다른사람의 원자가 섞여서 얼굴이 서로 바뀌거나 눈이 서로 바뀌면 안된다.

순간이동 완전히 되기 전에 제대로 도착했는지, 출발이랑 똑같은지, 도착하지 않은 부분이 있는지 확인해야한다.

정리하면
분해 --> 도착전 확인 --> 도착

이게 패킷 통신이다.

좀 엉뚱하지만 이해가 되었으면 한다.

오늘날 인터넷 통신의 대부분은 패킷통신을 기본으로 하고있다. TCP/IP는 이러한 패킷 통신을 위한 인터넷의 규약이다.
IP는 데이터의 조각들을 최대한 빨리 목적지로 보내는 역할을 합니다. 조각들의 순서가 뒤바뀌거나 일부가 누락되더라도 크게 상관하지 않고 보내는 데 집중한다. 
TCP는 IP보다 느리지만 꼼꼼한 방식을 사용한다. 도착한 조각을 점검하여 줄을 세우고 망가졌거나 빠진 조각을 다시 요청한다. 두 방식의 조합을 통하여 인터넷 데이터 통신을 하는 것을 묶어 TCP/IP라고 부르는 것이다.

이해하는데 도움이 되었으면 한다.
```

### 서비스 (클라이언트 / 서버 통신 )

-   서버 : 네트워크에서 서비스를 제공하는 컴퓨터
-   클라이언트 : 네트워크에서 서비스를 제공받는 컴퓨터
-   하드웨어적 구분은 사실상 없음

[##_Image|kage@bpzwFV/btrg1LfOplB/2l0V5spArLBJ5becKYQiAK/img.png|alignCenter|data-origin-width="569" data-origin-height="314" data-ke-mobilestyle="widthOrigin"|||_##]

### HTTP (Hyper Text Transfer Protocol)

-   WWW 서비스를 위한 TCP/IP 응용계층 프로토콜 중 하나
-   웹 서버 와 클라이언트는 HTTP를 이용한 통신
-   무 상태 연결 (stateless connection)

[##_Image|kage@SZtmP/btrg4JODAbS/k6kkREuM56pzyQhuxYbZd1/img.png|alignCenter|data-origin-width="606" data-origin-height="451" data-ke-mobilestyle="widthOrigin"|||_##]

#### 위의 그림을 잘 보면

[##_Image|kage@Ab9nD/btrg0oSKznf/fJII9YcI4efOqWAMtRhAz0/img.png|alignCenter|data-origin-width="332" data-origin-height="66" data-ke-mobilestyle="widthOrigin"|||_##]

-   이 정보들이 패킷안에 저장되어 보내진다. 저장되는 방식이 프로토콜(규약)이다.
-   헤더에는 통신할 준비가 되어있는지, 데이터가 제대로 가는지, 데이터가 변질되지않았는지, 수신자가 얼마나 받고 빠진 부분이 있는지의 데이터 들이 있다.
-   바디에는  
    [##_Image|kage@bwArGH/btrg4Jnxy4F/nB38ckvm1gVqIs5qkVH5kk/img.png|alignCenter|data-origin-width="385" data-origin-height="162" data-ke-mobilestyle="widthOrigin"|||_##]
-   이 것도 마찬가지로 다시 반환될때도 정보들이 패킷안에 저장되어 보내진다.

### URL (Uniform Resource Locator)

-   인터넷 상의 자원의 위치
-   특정 웹 서버의 특정파일에 접근하기 위한 경로 혹은 주소

[##_Image|kage@ST2tu/btrg6uRcrZK/mEnizetTQNkE7iMK0BpAXK/img.png|alignCenter|data-origin-width="531" data-origin-height="110" data-ke-mobilestyle="widthOrigin"|||_##]

## 정적인(static) 웹 페이지 ( 퍼블리싱 )

[##_Image|kage@bWLtQe/btrg2hyPw32/ch101LTCtkIh8p5IR38FDk/img.png|alignCenter|data-origin-width="709" data-origin-height="216" data-ke-mobilestyle="widthOrigin"|||_##]

1.  HTML(Hypertext Markup Language)은 브라우저가 웹 페이지로 변환하는 언어이다.
2.  정적인 웹 페이지는 파일 형태로 저장되어 있으면서 사용자의 입력에 따라 변하지 않는 HTML 문서이다.
3.  HTTP(Hypertext Transfer Protocol)는 웹 브라우저와 웹 서버가 통신하는 프로토콜이다.
4.  웹 브라우저는 HTTP 요청(HTTP request) 메시지를 서버에 전달함으로써 웹 서버의 페이지를 요청한다.
5.  웹 서버는 HTTP 응답(HTTP response) 메시지를 전달함으로써 HTTP 요청에 응답한다. 정적인 웹 페이지에서는 HTTP 응답이 HTML 문서를 포함한다.

## 동적인 웹 페이지를 만들어 내는 모든 기술

[##_Image|kage@zexde/btrg3OvRFdC/W7UttrR8706YbIvcMC9zdk/img.png|alignCenter|data-origin-width="716" data-origin-height="213" data-ke-mobilestyle="widthOrigin"|||_##]

-   Servlet
-   JSP (Java Server Page)

1.  동적인 웹 페이지는 웹 어플리케이션에 의해 생성되는 HTML 문서이다. 웹 브라우저가 웹 애플리케이션에 전달한 파라미터 값에 따라 웹 페이지가 변한다.
2.  웹 서버가 동적인 웹 페이지에 대한 요청을 받으면 서버는 웹 애플리케이션으로 요청을 넘긴다. 그러면 애플리케이션이 HTML 문서를 생성하여 웹 서버로 결과를 전달한다.
3.  웹 서버는 HTML 문서를 HTTP 응답(HTTP response)으로 감싼 후 브라우저로 결과를 전달한다.
4.  전달 받은 HTML 문서가 정적인 HTML 파일에서 왔는지 아니면 웹 애플리케이션에 의해 동적으로 생성된 문서인지 브라우저는 알지 못한다. 어느 쪽이든 브라우저는 전달받은 HTML 문서를 화면에 표시한다.

## 정적 웹페이지 VS 동적 웹페이지

[##_Image|kage@UdRI4/btrg2hyQIuM/VLzPlaJP3SLGXpmmnIyUfK/img.png|alignCenter|data-origin-width="641" data-origin-height="168" data-ke-mobilestyle="widthOrigin"|||_##]

\[ 정적 페이지 접근 시 웹 문서 전송 \]

[##_Image|kage@vnqp5/btrg2LGwP7n/NbHHyyScRUSKw33UifjzZ1/img.png|alignCenter|data-origin-width="764" data-origin-height="414" data-ke-mobilestyle="widthOrigin"|||_##]

\[ 동적 페이지 접근 시 웹 문서 전송 \]

# 정리하면

[##_Image|kage@C0Qaq/btrg4LsQfGH/dkvUapPHOkFJh0mtU926s0/img.png|alignCenter|data-origin-width="656" data-origin-height="375" data-ke-mobilestyle="widthOrigin"|||_##]

## 대충 위의 사진 느낌인데.... 그림을 못그려서 죄송합니다...
