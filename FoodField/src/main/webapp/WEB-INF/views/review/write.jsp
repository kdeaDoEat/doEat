<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<% String cp = request.getContextPath(); %> <%--ContextPath 선언 --%>
<!DOCTYPE html>
<html>
<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Food Field<%=cp %></title>

    <!-- Bootstrap Core CSS -->
    <link href="<%=cp%>/resources/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="<%=cp%>/resources/bootstrap/css/half-slider.css" rel="stylesheet">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    <style type="text/css">
     #top {background-color: white; text-align: right;}
    </style>
    <script type="text/javascript" src="<%=cp%>/resources/editor/js/HuskyEZCreator.js" charset="utf-8"></script>
	<script type="text/javascript" src="//cdnjs.cloudflare.com/ajax/libs/jquery/1.9.0/jquery.js"></script>
    <script src="http://code.jquery.com/jquery-2.1.1.min.js" type="text/javascript"></script>
    <script src="<%=cp%>/resources/bootstrap/js/bootstrap.min.js"></script>
	<script type="text/javascript">
	var oEditors = [];
		$(function() {
			
			$('#searchmap').on('click',function(){
				if($('#place').val() == ''){
					alert('검색단어를 입력해주세요!');
				}else{
					var popUrl = "searchMap?search="+$('#place').val();	//팝업창에 출력될 페이지 URL
					var popOption = "width=670, height=660, resizable=no, scrollbars=no, status=no;";    //팝업창 옵션(optoin)
					window.open(popUrl,"",popOption);
				} 
			});
			
			
			nhn.husky.EZCreator.createInIFrame({
				oAppRef: oEditors,
				elPlaceHolder: "ir1",
				//SmartEditor2Skin.html 파일이 존재하는 경로
				sSkinURI: "<%=cp%>/resources/editor/SmartEditor2Skin.html",	
				htParams : {
					// 툴바 사용 여부 (true:사용/ false:사용하지 않음)
					bUseToolbar : true,				
					// 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
					bUseVerticalResizer : true,		
					// 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
					bUseModeChanger : true,			
					fOnBeforeUnload : function(){
						
					}
				}, 
				fOnAppLoad : function(){
					//기존 저장된 내용의 text 내용을 에디터상에 뿌려주고자 할때 사용
					oEditors.getById["ir1"].exec("PASTE_HTML", ["기존 DB에 저장된 내용을 에디터에 적용할 문구"]);
				},
				fCreator: "createSEditor2"
			});
			
		})
		
	</script>
</head>
<body>
<!-- Navigation -->
    <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
    <div id="top" >
         <a href="#">로그인</a>&nbsp;&nbsp;&nbsp;
         <a href="#">회원가입</a>&nbsp;&nbsp;&nbsp;
         <a href="#">QnA</a>&nbsp;&nbsp;&nbsp;
    </div>
        <div class="container">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="main">푸드필드</a>
            </div>
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav">
                    <li>
                        <a href="notice">공지사항</a>
                    </li>
                    <li>
                        <a href="free">자유게시판</a>
                    </li>
                    <li>
                        <a href="review">맛집 리뷰</a>
                    </li>
                    <li>
                        <a href="select">오늘의 메뉴</a>
                    </li>
                </ul>
            </div>
            <!-- /.navbar-collapse -->
        </div>
        <!-- /.container -->
    </nav>
    
    <header class="other slide">
    </header>
    
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
            	<form name="inputForm">

				<table width="100%">
					<tr>
						<td>제목</td>
						<td><input type="text" id="title" /></td>
						<td>장소</td>
						<td><input type="text" id="place"><input type="button" value="검색" id="searchmap"></td>
					</tr>
            		<tr>
            			<td>가게이름</td>
            			<td><input type="text" name="shop_name" readonly="readonly"></td>
            			<td>가게주소</td>
            			<td><input type="text" name="shop_add" readonly="readonly"></td>
            		</tr>
					<tr>
						<td>내용</td>
						<td colspan="3"><textarea rows="10" cols="30" id="ir1" name="content"
								style="width: 766px; height: 412px;"></textarea></td>
					</tr>
					<tr>
						<td colspan="4"><input type="button" id="save" value="저장" />
							<input type="button" value="취소" /></td>
					</tr>
				</table>
				<!-- <table class="one">
            	<tr><td>제목</td><td><input type="text"></td></tr>
            	<tr><td>장소</td><td><input type="text" id="place"><input type="button" value="검색" id="searchmap"></td></tr>
            	<tr><td>가게이름</td><td><input type="text" name="shop_name" readonly="readonly"></td></tr>
            	<tr><td>가게주소</td><td><input type="text" name="shop_add" readonly="readonly"></td></tr>
            	<tr><td>사진</td><td><input type="file"></td></tr>
            	<tr><td>내용</td><td><textarea rows="10" cols="30" id="ir1" name="content" style="width:766px; height:412px; "></textarea></td></tr>
            	</table> -->
           		</form>
            </div>
        </div>
        <!-- Footer -->
        <footer>
            <div class="row">
                <div class="col-lg-12">
                    <p>Copyright &copy; Your Website 2014</p>
                </div>
            </div>
            <!-- /.row -->
        </footer>
    </div>
    
    <!-- jQuery -->
    <script src="<%=cp%>/resources/bootstrap/js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="<%=cp%>/resources/bootstrap/js/bootstrap.min.js"></script>
    
</body>
</html>