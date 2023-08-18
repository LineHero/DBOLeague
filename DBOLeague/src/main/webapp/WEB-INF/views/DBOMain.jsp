<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>게임 메인 화면</title>
<script src="../js/jquery-3.6.4.min.js"></script>
<link rel="stylesheet" href="/css/common.css" />
<link rel="stylesheet" href="/css/main.css" />
</head>
<body>
<div class=wrapper>
  <header>
    <div class="header-content">
      <div class="user-info font-M">
        <a href="/login">로그인</a> / <a href="/join">회원가입</a>
      </div>
    </div>
  </header>
  
 	<main>
	    <div class="main-background">
	    
	    	<div id="modal" class="modal">
	    		<div class="close-modal">
			      	<img src="/img/xbutton.png">
			    </div>
			    <div class="modal-content">
			    	<div class="rankgamebtn">
			    		<div class="rankimage">
							<img src="/img/modal-button.png/">
						</div>
						<div class="ranktext">랭킹게임</div>
					</div>
			    	<div class="normalgamebtn">
			    		<div class="normalimage">
							<img src="/img/modal-button.png/">
						</div>
						<div class="normaltext">일반게임</div>
					</div>
			    </div>
	  		</div>
	  		
	      <div class="thelogo">
		      <div class="logoimg"><img src="/img/dbologo3.png"></div>
		      <div class="logo">DBO League</div>
	      </div>
	      <div class="buttons">
	        <div class="main-button start">
	        	<img src="/img/pixelbtnred.png">
	        	<div class="textinbtn font-XL">게임하기</div>
	        </div>
	        <div class="main-button readme">
	        	<img src="/img/pixelbtnyellow.png">
				<div class="textinbtn font-XL">게임설명</div>
			</div>
	        <div class="main-button ranking">
	        	<img src="/img/pixelbtengreen.png">
	        	<div class="textinbtn font-XL">랭킹</div>
	        </div>
	      </div>
	    </div>
	    
	</main>
  
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