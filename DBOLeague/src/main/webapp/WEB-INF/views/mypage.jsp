<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html lang="ko">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>DBO 마이페이지</title>
    <script src="/js/jquery-3.6.4.min.js"></script>
    <link rel="stylesheet" href="/css/common.css" />
    <link rel="stylesheet" href="/css/mypage.css" />
  </head>
  <body>
    <div class="wrapper">
      <header>
        <div></div>
        <div id="title">
          <span class="font-XL">DBO LEAGUE</span>
        </div>
        <div id="id-logout">
          <span class="font-S">아이디</span> <!-- ${memberDto.member_id} -->
          <span id="logout-btn" class="font-S">로그아웃</span>
        </div>
      </header>
      <main>
        <div id="main-header">
          <div id="user-info" class="font-M">
            <ul>
              <li>Lv1. 닉네임</li> <!-- ${memberDto.member_nick} -->
              <li>소속팀 : 자바 스크립터즈</li> <!-- ${memberDto.member_team} -->
              <li>이메일 : dbo@mail.com</li> <!-- ${memberDto.member_email} -->
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
          					<button id="change-nick-btn" class="font-M">닉네임 변경</button>
          				</td>
          				<td>
          					<button id="change-pw-btn" class="font-M">비밀번호 변경</button>
          				</td>
          			</tr>
          			<tr>
          				<td>
          					<button id="anything-btn" class="font-M">뭔가 추가할 거</button>
          				</td>
          				<td>
          					<button id="delete-member-btn" class="font-M">회원탈퇴</button>
          				</td>
          			</tr>
          		</tbody>
          	</table>
          </div>
        </div>
        <div id="main-body">
          <section>
          	<div id="play-stat">
          		<div>
              	<p class="font-L">플레이 통계</p>
              </div>
              <div>
		            <table class="font-M">
		            	<tbody>
		            		<tr>
		            			<td>플레이한 게임 수</td>
		            			<td>이긴 횟수</td>
		            		</tr>
		            		<tr>
		            			<td>10회</td> <!-- ${memberDto.member_total} -->
		            			<td>5회</td> <!-- ${memberDto.member_win} -->
		            		</tr>
		            		<tr>
		            			<td>총 획득한 경험치</td>
		            			<td>승률</td>
		            		</tr>
		            		<tr> <!-- 승률 계산 : 게임횟수 0일 때, 소수점 1자리까지 표현 -->
		            			<td>13000exp</td> <!-- ${memberDto.member_allexp} -->
		            			<td>50%</td> <!-- ${memberDto.member_win / memberDto.member_total * 100} -->
		            		</tr>
		            	</tbody>
		            </table>
	            </div>
           	</div>
          </section>
          <section>
            <div id="latest-result">
            	<div>
              	<p class="font-L">최근 전적</p>
              </div>
              <div>
	              <table class="font-S">
	                <tbody>
	                  <tr class="font-M">
	                    <td>결과</td>
	                    <td>도전 회차</td>
	                    <td>도전 날짜</td>
	                  </tr>
	                	<%--
	                	<c:forEach var="record" items="${recordList}">
	                		<tr>
		                    <td>${record.single_result ? 성공 : 실패}</td>
		                    <td>${record.single_all}회</td>
		                    <td>${record.exp_date}</td>
		                  </tr>
	                	</c:forEach>
		                --%>
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
    <div id="record-detail" style="display: none">
    	<p>전적 상세내용</p>
    	<p>정답 : 5314</p> <!-- ${single.single_answer} -->
    	<table>
    		<thead>
	    		<tr>
	    			<th>회차</th>
	    			<th>도전한 수</th>
	    			<th>결과</th>
	    		</tr>
    		</thead>
    		<tbody>
    			<%--
    			<c:forEach items="${recordList[0]}" var="inning">
    				<tr>
		    			<td>${inning.innings_count}</td>
		    			<td>${inning.innings_chall}</td>
		    			<td><span style="color: FFD400">${inning.innings_strike}S</span> <span style="color: green">${inning.innings_ball}B</span></td>
	    			</tr>
    			</c:forEach> 
    			--%>
    			<tr>
	    			<td>1</td>
	    			<td>5314</td>
	    			<td><span style="color: FFD400">4S</span> <span style="color: green">0B</span></td>
    			</tr>
    		</tbody>
    	</table>
    </div>
  </body>
  <script src="/js/mypage.js"></script>
</html>
