<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div id="modal-container">
	<div class="modal-background">
		<div class="modal">
			<h2 id="modalselection"></h2>
			<div class="modallayout">
				<div class="motitle">
					<p class="buyingwhat"></p>
				</div>
				<div class="moex">
					<c:choose>
						<c:when test="${empty myitems}">
							<div class="divider justifycenter">
								<div>
									<span class="noitems">구매한 아이템이 없습니다... 먼저 아이템을 구매해 주세요!</span>
								</div>
							</div>
						</c:when>
						<c:otherwise>
							<c:forEach items="${myitems}" var="dto">
								<c:choose>
									<c:when test="${dto.nicknameitem_use eq true}">
										<div class="divider">
											<div class="divitem">
												<span class="textspans">${dto.nicknameitem_name}</span>
											</div>
											<div class="divex ${dto.nicknameitem_name}">
												<span class="textspans">적용 예시입니다 !!!</span>
											</div>
											<div class="divnowwhat">
												<span class="textspans">적용중</span>
											</div>
										</div>
									</c:when>
									<c:otherwise>
										<div class="divider">
											<div class="divitem">
												<span class="textspans">${dto.nicknameitem_name}</span>
											</div>
											<div class="divex ${dto.nicknameitem_name}">
												<span class="textspans">적용 예시입니다 !!!</span>
											</div>
											<div class="divnowwhat">
												<span class="textspans">미적용</span>
											</div>
										</div>
									</c:otherwise>
								</c:choose>
							</c:forEach>
						</c:otherwise>
					</c:choose>
				</div>
				<div class="modalconfirm">
					<div class="modalno">
						<span class="modalbtn noc cursorPointer"></span>
					</div>
				</div>
				<form id="itembuy" action="/itembuy" method="post">
					<input type="hidden" name="item" id="item" /> <input type="hidden"
						name="price" id="price" />
				</form>
			</div>
		</div>
	</div>

</div>