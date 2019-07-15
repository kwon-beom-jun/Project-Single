<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
     
<c:forEach var="answerList" items="${answerList }">
<br>
<input type="hidden" class="" name="userId" value="${answerList.userId }">


<div class="row">
	<div class="col-lg-2"></div>
	<div class="col-lg-5">
		<small>작성일 : ${answerList.replyCreatedate }</small>
	</div>
	<div class="col-lg-5"></div>
</div>
<div class="row">
	<div class="col-lg-2"></div>
	<div class="col-lg-8" style="border: 1px solid #444444; background-color: #fff;">
		<br>
		<br>


		<div class="row">
			<div class="col-lg-1"></div>
			<div class="col-lg-3"><strong>${answerList.userNickname }</strong> 님 답변</div>
			<div class="col-lg-5"></div>
			<div class="col-lg-3">
				<c:if test="${userInfo.userId == answerList.userId }">
					<a class="answerDelete">
						<button type="button" class="btn btn-outline-danger">삭제</button>
						<input type="hidden" class="replyNum" name="replyNum" value="${answerList.replyNum }">
					</a>
				</c:if>
			</div>
		</div>
		<div class="row">
			<div class="col-lg-1"></div>
			<div class="col-lg-10">
				<hr style="background-color: #6c757d">
			</div>
			<div class="col-lg-1"></div>
		</div>
		<div class="row">
			<div class="col-lg-1"></div>
			<div class="col-lg-10">
				<br>
				<!-- 내용넣기 -->
				${answerList.replyContent}<br>
			</div>
			<div class="col-lg-1"></div>
		</div>
		<br><br><br>
		
		
		
	</div>
	<div class="col-lg-2"></div>
</div>
<br>




</c:forEach>












