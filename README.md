# DBOLeague
숫자야구 게임(Bulls and Cows) 플레이할 수 있는 웹 사이트

## 🖥️ 프로젝트 소개
-	코딩에 지친 개발자들을 위해 숫자야구 게임을 즐길 수 있는 유희용 사이트
-	웹에서 바로 플레이할 수 있게 하여 개발자가 코딩을 하다 잠깐 창을 돌려 쉽게 게임을 즐길 수 있도록 했습니다.

## 🕰️ 개발 기간
* 23.08.10 - 23.08.23

### 🧑‍🤝‍🧑 맴버구성
 - 팀장  : 김선웅 - 메인 페이지(메인 페이지 로고, 버튼 UI, 게임설명)
 - 팀원1 : 김종인 - 마이 페이지(마이페이지 정보, 닉네임 변경, 비밀번호 변경, 회원 탈퇴, 플레이 통계, 최근 전적)
 - 팀원2 : 김하늘 - 로그인 및 회원가입 페이지, 통합 및 형상관리
 - 팀원3 : 이민규 - 랭킹 페이지, 커스텀 커서, 로딩 페이지, 커스터마이징 아이템 상점 및 적용 페이지
 - 팀원4 : 조수민 - 게임 페이지(랭킹 반영 게임, 일반 게임)

### ⚙️ 개발 환경
- `Java 17`
- **IDE** : STS 4.18
- **Framework** : Springboot(3.1.2)
- **Database** : Mysql
- **ORM** : Mybatis

## 📌 주요 기능
#### 로그인 - <a href="https://github.com/ha-neu1/DBOLeague/wiki/%EB%A1%9C%EA%B7%B8%EC%9D%B8" >상세보기 - WIKI 이동</a>
- DB값 검증
- 로그인 시 세션(Session) 생성
- 아이디 저장
#### 회원가입 - <a href="https://github.com/ha-neu1/DBOLeague/wiki/%ED%9A%8C%EC%9B%90%EA%B0%80%EC%9E%85" >상세보기 - WIKI 이동</a>
- ID & EMAIL 중복 체크
- 회원가입 시 10개의 팀에서 랜덤으로 1개의 팀에 회원 배정
#### 마이 페이지 - <a href="https://github.com/ha-neu1/DBOLeague/wiki/%EB%A7%88%EC%9D%B4-%ED%8E%98%EC%9D%B4%EC%A7%80" >상세보기 - WIKI 이동</a>
- 회원 정보 표시
- 닉네임, 비밀번호 변경
- 회원탈퇴
- 게임 전적, 전적 상세보기
#### 커스텀 커서 & 로딩 화면 - <a href="https://github.com/ha-neu1/DBOLeague/wiki/%EC%BB%A4%EC%8A%A4%ED%85%80-%EC%BB%A4%EC%84%9C-&-%EB%A1%9C%EB%94%A9-%ED%8E%98%EC%9D%B4%EC%A7%80" >상세보기 - WIKI 이동</a>
- 커스텀 커서 적용
- 로딩 화면 적용
#### 커스터마이징 아이템 관리 & 상점 페이지 - <a href="https://github.com/ha-neu1/DBOLeague/wiki/%EC%BB%A4%EC%8A%A4%ED%85%80-%EC%95%84%EC%9D%B4%ED%85%9C-%ED%8E%98%EC%9D%B4%EC%A7%80" >상세보기 - WIKI 이동</a>
- 커스터마이징 아이템 구매
- 커스터마이징 아이템 적용
#### 랭킹 페이지 - <a href="https://github.com/ha-neu1/DBOLeague/wiki/%EB%9E%AD%ED%82%B9%ED%8E%98%EC%9D%B4%EC%A7%80" >상세보기 - WIKI 이동</a>
- 주간 랭킹 산정, 열람
#### 메인 페이지 - <a href="https://github.com/ha-neu1/DBOLeague/wiki/%EB%A9%94%EC%9D%B8-%ED%8E%98%EC%9D%B4%EC%A7%80" >상세보기 - WIKI 이동</a>
- 게임 모드 선택 및 플레이
- 게임 설명 열람
- Session 유무에 따라서 Header 정보 변경
#### 게임 페이지 - <a href="https://github.com/ha-neu1/DBOLeague/wiki/%EA%B2%8C%EC%9E%84-%ED%8E%98%EC%9D%B4%EC%A7%80" >상세보기 - WIKI 이동</a>
- 게임 플레이
