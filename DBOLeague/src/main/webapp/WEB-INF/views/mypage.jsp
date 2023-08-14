<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html lang="ko">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>DBO 마이페이지</title>
    <style>
      * {
        margin: 0px;
        padding: 0px;
        box-sizing: border-box;
      }
      /* 페이지 레이아웃 설정 */
      body {
        width: 1920px;
        margin: 0 auto;
      }
      #container {
        width: 1416px;
        height: 825px;
        margin: 238px auto;
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
        margin-left: 280px;
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
        width: 40%;
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
      #exp-info {
        width: 60%;
        display: flex;
        align-items: center;
      }
      #exp-info > div {
        margin-bottom: 9px;
      }
      #exp-info > div > span {
        font-size: 30px;
        font-weight: 500;
      }
      #exp-info progress {
        width: 450px;
        height: 70px;
        margin-right: 40px;
        margin-left: 10px;
      }
      #play-stat {
        display: flex;
        flex-wrap: wrap;
        justify-content: center;
        align-items: center;
      }
      .stat-block {
        width: 200px;
        border: 2px solid black;
      }
      .stat-block p {
        text-align: center;
      }
      #latest-result table {
        text-align: center;
        border: 2px solid black;
        border-collapse: collapse;
      }
      #latest-result td,
      #latest-result th {
        border: 2px solid black;
      }
    </style>
  </head>
  <body>
    <div id="container">
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
            </ul>
          </div>
          <div id="exp-info">
            <div>
              <span>EXP :</span>
            </div>
            <progress value="20" max="100"></progress>
            <span>20 / 100</span>
          </div>
        </div>
        <div id="main-body">
          <section>
            <div id="play-stat">
              <div class="stat-block">
                <p>플레이한 게임 수</p>
                <p>10회</p>
              </div>
              <div class="stat-block">
                <p>이긴 횟수</p>
                <p>5회</p>
              </div>
              <div class="stat-block">
                <p>승률</p>
                <p>50%</p>
              </div>
              <div class="stat-block">
                <p>총 획득한 경험치</p>
                <p>13000exp</p>
              </div>
            </div>
          </section>
          <section>
            <div id="latest-result">
              <p>최근 전적</p>
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
                    <td>승</td>
                    <td>3회</td>
                    <td>23.08.11</td>
                  </tr>
                  <tr>
                    <td>승</td>
                    <td>3회</td>
                    <td>23.08.11</td>
                  </tr>
                  <tr>
                    <td>승</td>
                    <td>3회</td>
                    <td>23.08.11</td>
                  </tr>
                  <tr>
                    <td>승</td>
                    <td>3회</td>
                    <td>23.08.11</td>
                  </tr>
                  <tr>
                    <td>승</td>
                    <td>3회</td>
                    <td>23.08.11</td>
                  </tr>
                </tbody>
              </table>
            </div>
          </section>
        </div>
      </main>
    </div>
  </body>
</html>
