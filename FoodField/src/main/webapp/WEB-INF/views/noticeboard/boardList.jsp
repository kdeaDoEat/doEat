<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%><%--계산을 쓸려면 fmt!! --%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시판 리스트</title>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-2.2.2.min.js">	
</script>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script>

	$(function() {

		$("#writebtn").on("click", writego);
		$("#searchbtn").on("click",gosearch);
		$("#search").keypress(function(e) {
			if (e.keyCode == 13) gosearch();   
			  
	    });

	});

	function writego() {

		location.href = "write";

	}
	
	function gosearch() {
		
		location.href="list?currpage=1&type="+$("#searchoption").val()+"&word="+$("#search").val();
		
	}
	
</script>
<style>

    table{
       margin-left:auto;
       margin-right:auto;
       width:800px;
    }
    tr{
    
       height:40px;
    }
    tr:nth-child(even){
       background-color:skyblue;
       color:white;
       
    }
    td:nth-child(1){
       
       width:70px;
       
    }
    td:nth-child(3){
       
       width:120px;
       
    }
    td:nth-child(4){
       
       width:100px;
       
    }
    th{
       height:40px;
       background-color:gray;
       color:white;
    }
    #belownavi{
    
       display:table;
       margin-left:auto;
       margin-right:auto;
    
    }
    #pageoutput{
       
       display:table;
       margin-left:auto;
       margin-right:auto;
    
    }
    
</style>
</head>
<body>

	<table>
		<output id="pageoutput">${page.currpage}/${page.totalpage}</output>
		<tr>
			<th>글 번호</th>
			<th>글 제목</th>
			<th>글쓴이</th>
			<th>글쓴 날짜</th>
		</tr>
		<c:forEach var="board" items="${boardlist}" varStatus="status">
			<tr>
				<td>${board.num}</td>
				<td><a href="view?num=${board.num}">${board.title}</a></td>
				<td>${board.nickname}</td>
				<td>${board.w_date}</td>
			</tr>
		</c:forEach>
	</table>
    <div id="belownavi">
    <ul class="pagination">
	<fmt:parseNumber var="currdivppp" type="number"
		value="${page.currpage/page.ppp}" integerOnly="true" />

	<c:if test="${(page.currpage % page.ppp) != 0}">

		<fmt:parseNumber var="currstart" type="number"
			value="${(currdivppp*page.ppp)+1}" />

		<c:if test="${(currdivppp*page.ppp)+page.ppp > page.totalpage}">
			<fmt:parseNumber var="currend" type="number"
				value="${page.totalpage}" />
		</c:if>
		<c:if test="${(currdivppp*page.ppp)+page.ppp <= page.totalpage}">
			<fmt:parseNumber var="currend" type="number"
				value="${(currdivppp*page.ppp)+page.ppp}" />
		</c:if>

		<c:if test="${currdivppp>0}">
			<li><a href="list?currpage=${currstart-page.ppp}&type=${search.type}&word=${search.word}">이전</a></li>
		</c:if>

		<c:forEach var="i" begin="${currstart}" end="${currend}"
			varStatus="status">
			<li><a href="list?currpage=${status.current}&type=${search.type}&word=${search.word}">${status.current}</a></li>
		</c:forEach>

		<c:if test="${currend != page.totalpage}">
			<li><a href="list?currpage=${currend+1}&type=${search.type}&word=${search.word}">다음</a></li>
		</c:if>

	</c:if>

	<c:if test="${(page.currpage % page.ppp) == 0}">

		<fmt:parseNumber var="currstart" type="number"
			value="${((currdivppp-1)*page.ppp)+1}" />

		<c:if test="${currdivppp*page.ppp > page.totalpage}">
			<fmt:parseNumber var="currend" type="number"
				value="${page.totalpage}" />
		</c:if>
		<c:if test="${currdivppp*page.ppp <= page.totalpage}">
			<fmt:parseNumber var="currend" type="number"
				value="${currdivppp*page.ppp}" />
		</c:if>

		<c:if test="${currdivppp>1}">
			<li><a href="list?currpage=${currstart-page.ppp}&type=${search.type}&word=${search.word}">이전</a></li>
		</c:if>

		<c:forEach var="i" begin="${currstart}" end="${currend}"
			varStatus="status">
			<li><a href="list?currpage=${status.current}&type=${search.type}&word=${search.word}">${status.current}</a></li>
		</c:forEach>

		<c:if test="${currend != page.totalpage}">
			<li><a href="list?currpage=${currend+1}&type=${search.type}&word=${search.word}">다음</a></li>
		</c:if>

	</c:if>
    </ul>
	<button type="button" id="writebtn" class="btn btn-default" style="margin-top:-67.5px;">글쓰기</button>
	<br>

	<select name="type" id="searchoption" style="margin-left:-50px;">
		<option value="제목">제목</option>
		<option value="내용">내용</option>
		<option value="작성자">작성자</option>
	</select>
	<input name="word" type="text" id="search"/>
	<button type="button" id="searchbtn" class="btn btn-default">검색</button>
    </div>
</body>
</html>