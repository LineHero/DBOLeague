<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

  <meta charset="UTF-8">
  <title>게임 메인 화면</title>

  <style>
  @font-face {
    font-family: 'NeoDGM';
    src: url('/fonts/neodgm.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}
  body {
  margin: 0;
  padding: 0;
  background-color: #afea47;
  font-family: 'NeoDGM'; 
}

header {
  background-color: rgba(255, 255, 255, 0.8);
  padding: 10px 20px;
  display: flex;
  justify-content: space-between;
  align-items: center;
}

.header-content {
  display: flex;
  align-items: right;
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
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
  height: 80vh;
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

/* Responsiveness */
@media screen and (max-width: 768px) {
  .header-content {
    flex-direction: column;
    align-items: flex-start;
  }

  .user-info {
    margin-top: 10px;
  }
}
</style>
</head>
<body>
  <header>
    <div class="header-content">
      <div class="hlogo">게임 로고</div>
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