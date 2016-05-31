<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>글쓰기 폼</title>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-2.2.2.min.js">	
</script>
<script>
	
</script>
<style>
   
   #titleerror {
   
      color:red;
   
   }
   
   #contentserror {
   
      color:red;
      
   }
   
</style>
</head>
<body>
	<form action="insert" method="post">
		<fieldset
			style="width: 380px; display: table; margin-left: auto; margin-right: auto; margin-top: 50px;">

			<legend>글 쓰기</legend>

			<label for="title">글 제목</label><br> <input type="text"
				id="title" name="title" style="width: 370px;"/>
			<br>
			<span id="titleerror">
			<spring:bind path="board.title">
				${status.errorMessage }<!-- 설정한 에러메세지 출력 -->
			</spring:bind>
			</span>
			<br>
			<br>
			<label for="contents">글 내용</label><br>
			<textarea rows="10" cols="50" id="contents" name="contents"></textarea>
			<span id="contentserror">
            <spring:bind path="board.contents">
				${status.errorMessage }<!-- 설정한 에러메세지 출력 -->
			</spring:bind>
			</span>
			<br>
            <br>
			<button type="submit">글쓰기</button>
			<br>
			
		</fieldset>
	</form>
</body>
</html>