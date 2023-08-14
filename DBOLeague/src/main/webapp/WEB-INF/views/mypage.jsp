<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html lang="ko">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>DBO 마이페이지</title>
    <script src="../js/jquery-3.6.4.min.js"></script>
    <style>
	    @font-face {
		    font-family: 'NeoDGM';
		    src: url('/fonts/neodgm.woff') format('woff');
		    font-weight: normal;
		    font-style: normal;
			}
      * {
        margin: 0px;
        padding: 0px;
        box-sizing: border-box;
      }
      /* 페이지 레이아웃 설정 */
      body {
        width: 1920px;
        margin: 0 auto;
        display: flex;
		    align-items: center;
		   	justify-content: center;
		   	font-family: 'NeoDGM'; 
      }
      .wrapper {
        width: 1416px;
        height: 825px;
        background-color: efefef;
      }
      header {
        display: flex;
        justify-content: space-between;
        align-items: center;
        width: 100%;
        height: 130px;
      }
      main {
        display: flex;
        flex-direction: column;
      }
      main > div {
        width: 78%;
        margin: 0 auto;
      }
      #main-header {
        display: flex;
        flex-direction: row;
        justify-content: flex-start;
        align-items: center;
        height: 150px;
        margin-bottom: 64px;
        background-color: white;
      }
      #main-body {
        height: 300px;
        display: flex;
      }
      section {
        display: flex;
        align-items: center;
        width: 50%;
        height: 370px;
      }
      section:first-of-type {
        justify-content: flex-start;
      }
      section:last-of-type {
        justify-content: flex-end;
      }
      section > div {
        background-color: white;
        width: 94%;
        height: 100%;
      }
      /* 제목, 로그인 부분 */
      #title {
        margin-left: 290px;
      }
      #title span {
        font-weight: 900;
        font-size: 40px;
      }
      #id-logout {
        margin-right: 155px;
      }
      /* 메인 부분 */
      #user-info {
        width: 60%;
      }
      #user-info ul {
        list-style: none;
        padding: 0px;
        margin: 0px;
        margin-left: 60px;
      }
      #user-info li {
        font-size: 20px;
        margin-bottom: 6px;
      }
      #top-btns {
      	width: 40%;
      }
      #top-btns table {
      	/*border-collapse: collapse;*/
      }
      #top-btns td {
      	border: solid 2px black;
      	width: 150px;
      	height: 50px;
      	background-color: d9d9d9;
      }
      #top-btns button {
      	width: 100%;
      	height: 100%;
      	font-size: 20px;
      	font-family: 'NeoDGM';
      	background-color: transparent;
      	border: none;
      }
      #top-btns button:hover {
      	background-color: white;
      }
      #latest-result,
      #play-stat {
      	display: flex;
      	flex-direction: column;
      }
      #latest-result > div,
      #play-stat > div {
      	display: flex;
      	justify-content: center;
      }
      #latest-result > div:first-of-type,
      #play-stat > div:first-of-type {
      	justify-content: flex-start;
      	margin: 20px;
      	margin-left: 30px;
      	font-size: 25px;
      	font-weight: 600;
      }
      #play-stat table,
      #latest-result table {
      	width: 90%;
      	text-align: center;
        border-collapse: collapse;
      }
      #play-stat table {
      	font-size: 20px;
      }
      #latest-result td,
      #latest-result th,
      #play-stat td {
        border: 2px solid black;
        height: 45px;
      }
      #play-stat table > tbody > tr:nth-child(odd) {
      	font-weight: 600;
      	height: 50px;
      }
      #play-stat table > tbody > tr:nth-child(even) {
      	height: 85px;
      }
    </style>
  </head>
  <body>
    <div class="wrapper">
      <header>
        <div></div>
        <div id="title">
          <span>DBO LEAGUE</span>
        </div>
        <div id="id-logout">
          <span>아이디</span> |
          <span>로그아웃</span>
        </div>
      </header>
      <main>
        <div id="main-header">
          <div id="user-info">
            <ul>
              <li>Lv1. 닉네임</li>
              <li>소속팀 : 자바 스크립터즈</li>
              <li>이메일 : dbo@mail.com</li>
              <li>
              	<span>EXP : </span>
              	<progress value="20" max="100"></progress>
            		<span>20 / 100</span>
              </li>
            </ul>
          </div>
          <div id="top-btns">
          	<table>
          		<tbody>
          			<tr>
          				<td>
          					<button>닉네임 변경</button>
          				</td>
          				<td>
          					<button>비밀번호 변경</button>
          				</td>
          			<tr>
          			<tr>
          				<td>
          					<button>뭔가 추가할 거</button>
          				</td>
          				<td>
          					<button>회원탈퇴</button>
          				</td>
          			<tr>
          		</tbody>
          	</table>
          </div>
        </div>
        <div id="main-body">
          <section>
          	<div id="play-stat">
          		<div>
              	<p>플레이 통계</p>
              </div>
              <div>
		            <table>
		            	<tbody>
		            		<tr>
		            			<td>플레이한 게임 수</td>
		            			<td>이긴 횟수</td>
		            		</tr>
		            		<tr>
		            			<td>10회</td>
		            			<td>5회</td>
		            		</tr>
		            		<tr>
		            			<td>승률</td>
		            			<td>총 획득한 경험치</td>
		            		</tr>
		            		<tr>
		            			<td>50%</td>
		            			<td>13000exp</td>
		            		</tr>
		            	</tbody>
		            </table>
	            </div>
           	</div>
          </section>
          <section>
            <div id="latest-result">
            	<div>
              	<p>최근 전적</p>
              </div>
              <div>
	              <table>
	                <thead>
	                  <tr>
	                    <th>결과</th>
	                    <th>도전 회차</th>
	                    <th>도전 날짜</th>
	                  </tr>
	                </thead>
	                <tbody>
	                  <tr>
	                    <td>성공</td>
	                    <td>3회</td>
	                    <td>23.08.11</td>
	                  </tr>
	                  <tr>
	                    <td>성공</td>
	                    <td>3회</td>
	                    <td>23.08.11</td>
	                  </tr>
	                  <tr>
	                    <td>성공</td>
	                    <td>3회</td>
	                    <td>23.08.11</td>
	                  </tr>
	                  <tr>
	                    <td>성공</td>
	                    <td>3회</td>
	                    <td>23.08.11</td>
	                  </tr>
	                  <tr>
	                    <td>성공</td>
	                    <td>3회</td>
	                    <td>23.08.11</td>
	                  </tr>
	                </tbody>
	              </table>
              </div>
            </div>
          </section>
        </div>
      </main>
    </div>
  </body>
</html>
