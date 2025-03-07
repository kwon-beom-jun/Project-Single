<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- 들고다님 위에 있어야뎀. -->
<c:set var="boardListNum" value="${bp.boardListNum}"/>
<c:set var="key" value="${bp.key}"/>
<c:set var="word" value="${bp.word}"/>

<script type="text/javascript">

//글작성으로 이동
$(function () {
	$(".write").on("click", function () {
		location.href="${root}/board/write?boardListNum="+${boardListNum};
	});
	
	/* $(document).on("click", ".wrtie", function(){
		console.log("11");
		location.href="${root}/board/write?boardListNum="+boardListNum;
	}); */
});



</script>


<!-- 가지고 다님. -->
<%-- <c:set var="boardListNum" value="${parameter.boardListNum }"/>
<c:set var="pg" value="${parameter.pg }"/> --%>
<input type="hidden" id="searchkey" name="key" value="${key}">
<input type="hidden" id="searchword" name="word" value="${word}">
<input type="hidden" id="write" name="write" value="${boardListNum}">



<!-- 테이블 -->
<div class="container">
	<div class="row">
		<div class="col-lg-2">
			<a class="">
				<button type="button" class="btn btn-outline-secondary write" style="color: #007bff; border-color: #007bff;">글작성</button>
			</a>
		</div>
		<div class="col-lg-2"></div>
		<div class="col-lg-1" style="margin-top: 0.5rem;">
		<select name="fruit" id="key">
			<option value="제목" selected="selected">제목</option>
			<option value="작성자">작성자</option>
		</select>
		</div>
		<div class="col-lg-7" style="margin-bottom: 1rem;">
			<div class="input-group lg-3">
				<input id="word" type="text" class="form-control" placeholder="검색 내용">
				<div class="input-group-prepend">
					<button id="search" class="btn btn-outline-primary" type="button">검색</button>  
				</div>
			</div>
		</div>
		
	</div>
</div>



<div class="container">
	<table class="table table-hover">
		<thead>
			<tr>
				 <th>제목</th>
				 <th>작성자</th>
				 <th>작성일</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${bp.list}" var="bp">
			<tr>
				<td>
					<label width="70%" class="contentDetail">
						<a class="boardDetail">
							<input class="boardNum" type="hidden" value="${bp.boardNum }">
							<strong>${bp.boardSubject }</strong>
						</a>
					</label>
				</td>
				<td width="15%">${bp.userNickname }</td>
				<td width="15%">${bp.boardCreatedate }</td>
			</tr>
			</c:forEach>
		</tbody>
	</table><hr>
</div>




<div class="row">

	<div class="col-lg-2"></div>
	
	<div class="col-lg-2">
		<c:if test="${bp.startPage > 1 }">
			<span class="page">
				<button class="page-link" value="${bp.startPage - 1}">이전</button>
			</span>
		</c:if>
	</div>


	<div class="col-lg-4">
		<ul class="pagination" style="width: 240px; margin-left: auto; margin-right: auto;">

			<c:forEach begin="${bp.startPage}" end="${bp.endPage}" step="1" varStatus="i">
				<c:choose>

					<c:when test="${bp.currentPage == i.index}">
						<li class="page-item">
							<span>
								<a class="page-link">${i.index}</a>
							</span>
						</li>
					</c:when>

					<c:otherwise>
						<li class="page-item">
							<span class="page">
								<input class="page-link" type="button" value="${i.index}">
							</span>
						</li>
					</c:otherwise>

				</c:choose> 
			</c:forEach>

		</ul>
	</div>

	<div class="col-lg-2">

		<c:if test="${bp.totalPage > bp.endPage }">
			<span class="page">
				<button class="page-link" value="${bp.endPage+1}">다음</button>
			</span>
		</c:if>

	</div>


	<div class="col-lg-2"><small>총 글수 : ${bp.totalCnt}</small></div>

	
</div>



	
	
	
	
	
	
	
	
	
	
	
	
	
	
	