<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게임 메인 화면</title>
<script src="../js/jquery-3.6.4.min.js"></script>
<style>
@font-face {
    font-family: 'NeoDGM';
    src: url('/fonts/neodgm.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}

body {
    width: 1920px;
    height: 1080px;
    display: flex;
    align-items: center;
    justify-content: center;
   
}

header {
  background-color: #afea47;
  padding: 10px 20px;
  display: flex;
}

.wrapper{
    width:1416px;
    height:825px;
    /* background-color: #afea47; */
    font-family: 'NeoDGM';
}

.header-content {
  margin-left : auto;
}

.logo {
  font-size: 0;
  font-weight: bold;
  overflow: hidden; 
  animation: fade-in 1.5s ease-in-out forwards; 
}

@keyframes fade-in {
  0% {
    font-size: 0; 
    opacity: 0; 
  }
  100% {
    font-size: 50px; 
    opacity: 1;
  }
}

.user-info a {
  text-decoration: none;
  color: #333;
  margin-left: 10px;
}

.main-content {
  position: relative;
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
  height: 100vh;
  background-image: url('/img/baseballfield.png'); /* 이미지 파일의 경로를 지정하세요 */
  background-size: cover; /* 이미지를 요소에 맞게 확대/축소하여 채우도록 설정 */
  background-position: center 45%; /* 이미지를 가운데 정렬 */
}

.main-content::after {
  top: 0;
  left: 0;
  position: absolute;
  content: "";
  z-index: 0;
  opacity: 0.5;
  background-image: url('/img/baseballfield.png'); /* 이미지 파일의 경로를 지정하세요 */
  background-size: cover; /* 이미지를 요소에 맞게 확대/축소하여 채우도록 설정 */
  background-position: center 45%; /* 이미지를 가운데 정렬 */  
}
.buttons {
  margin-top: 20px;
}

.main-button {
  background-color: #333;
  color: #fff;
  border: none;
  padding: 10px 20px;
  margin: 5px;
  cursor: pointer;
  font-family: 'NeoDGM'; 
}

.modal {
  display: none;
  position: fixed;
  top: 50%; 
  left: 50%;
  transform: translate(-50%, -50%);
  width: 300px; 
  height: 200px; 
  background-color: white;
  z-index: 9999; 
}

.modal-content {
  background-color: #fff;
  padding: 20px;
  border-radius: 5px;
  text-align: center;
}

.modal-button {
  background-color: #333;
  color: #fff;
  border: none;
  padding: 10px 20px;
  margin: 5px;
  cursor: pointer;
  font-family: 'NeoDGM'; 
}

</style>
</head>
<body>
<div class=wrapper>
  <header>
    <div class="header-content">
      <div class="user-info">
        <a href="#">로그인</a> / <a href="#">회원가입</a>
      </div>
    </div>
  </header>
  
  <main>
    <div class="main-content">
      <div class="logo">DBO League</div>
      <div class="buttons">
        <button class="main-button">게임하기</button>
        <button class="main-button">게임설명</button>
        <button class="main-button">랭킹</button>
      </div>
    </div>
  </main>
  
 <div id="modal" class="modal">
    <div class="modal-content">
      <button class="modal-button">랭킹게임</button>
      <button class="modal-button">일반게임</button>
      <button class="close-modal">닫기</button> <!-- 모달창 닫기 버튼 -->
    </div>
  </div>
</div>
  <script>
    const gameButton = document.querySelector('.main-button');
    const modal = document.getElementById('modal');
    const closeModalButtons = document.querySelectorAll('.close-modal'); // 여러 개의 닫기 버튼 선택

    gameButton.addEventListener('click', () => {
      modal.style.display = 'block';
    });

    // 각각의 닫기 버튼에 클릭 이벤트를 연결하여 모달창을 닫는 기능 추가
    closeModalButtons.forEach(button => {
      button.addEventListener('click', () => {
        modal.style.display = 'none';
      });
    });
  </script>
</body>
</html>