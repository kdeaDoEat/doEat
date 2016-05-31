<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>수정 하기</title>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-2.2.2.min.js">	
</script>
<script>
$(function() {

	$("#modifybtn").on("click",modsubmitgo);		
	
});

function modsubmitgo(){
	
	var result = confirm("이대로 수정하시겠습니까?");
	if(result){
		
		$("#modform").submit();
		
	}
	
}
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
	<form action="modify" method="post"  id="modform">
		<fieldset
			style="width: 380px; display: table; margin-left: auto; margin-right: auto; margin-top: 50px;">

			<legend>수정 하기</legend>
            <input type="hidden" value="${board.num}" name="num"/>
			<label for="title">글 제목</label><br> <input type="text"
				id="title" name="title" style="width: 370px;" value="${board.title}"/>
			<br>
			<span id="titleerror">
			<spring:bind path="board.title">
				${status.errorMessage }<!-- 설정한 에러메세지 출력 -->
			</spring:bind>
			</span>
			<br>
			<br>
			<label for="contents">글 내용</label><br>
			<textarea rows="10" cols="50" id="contents" name="contents">${board.contents}</textarea>
			<span id="contentserror">
            <spring:bind path="board.contents">
				${status.errorMessage }<!-- 설정한 에러메세지 출력 -->
			</spring:bind>
			</span>
			<br>
            <br>
			<button type="button" id="modifybtn">수정하기</button>
			<br>
			
		</fieldset>
	</form>
</body>
</html>