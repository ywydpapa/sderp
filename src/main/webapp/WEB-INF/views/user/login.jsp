<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value ="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="en">

<head>
    <title>소프트코어 서비스 로그인 </title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimal-ui">
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="description" content="#">
    <meta name="keywords" content="Admin , Responsive, Landing, Bootstrap, App, Template, Mobile, iOS, Android, apple, creative app">
    <meta name="author" content="#">
    <!-- Favicon icon -->
     <script src="http://code.jquery.com/jquery-3.2.1.min.js"></script>
    <link rel="icon" href="../assets/images/favicon.ico" type="image/x-icon">
    <!-- Google font--><link href="https://fonts.googleapis.com/css?family=Open+Sans:400,600,800" rel="stylesheet">
    <!-- Required Fremwork -->
    <link rel="stylesheet" type="text/css" href="${path}/assets/css/bootstrap/css/bootstrap.min.css">
    <!-- themify-icons line icon -->
    <link rel="stylesheet" type="text/css" href="${path}/assets/icon/themify-icons/themify-icons.css">
    <!-- ico font -->
    <link rel="stylesheet" type="text/css" href="${path}/assets/icon/icofont/css/icofont.css">
    <!-- Style.css -->
    <link rel="stylesheet" type="text/css" href="${path}/assets/css/style.css">
	<link rel="stylesheet" type="text/css" href="${path}/assets/css/style2.css">
    
<script>
$(document).ready(function(){
	$("#btnlogin").click(function(){
		var compId=$("#compId").val();
		var userId=$("#userId").val();
		var userPasswd=$("#userPasswd").val();
		if(userId==""){
			alert("아이디를 입력해 주세요.");
			$("#userId").focus();
			return;
		}
		if(compId==""){
				alert("회사 아이디를 입력해 주세요.");
				$("#compId").focus();
				return;
			}
		if(userPasswd==""){
				alert("암호를 입력해 주세요.");
				$("#userPasswd").focus();
				return;
			}
		document.form1.action="${pageContext.request.contextPath}/user/login_check.do";
		ducument.form1.submit();
	});
});
</script>


</head>

<body class="fix-menu">
    <!-- Pre-loader start --> 
    <div class="theme-loader">
    <div class="ball-scale">
        <div class='contain'>
            <div class="ring"><div class="frame"></div></div>
            <div class="ring"><div class="frame"></div></div>
            <div class="ring"><div class="frame"></div></div>
            <div class="ring"><div class="frame"></div></div>
            <div class="ring"><div class="frame"></div></div>
            <div class="ring"><div class="frame"></div></div>
            <div class="ring"><div class="frame"></div></div>
            <div class="ring"><div class="frame"></div></div>
            <div class="ring"><div class="frame"></div></div>
            <div class="ring"><div class="frame"></div></div>
        </div>
    </div>
</div>
    <!-- Pre-loader end -->
    <section class="login p-fixed d-flex text-center bg-primary common-img-bg">
        <!-- Container-fluid starts -->
        <div class="container-fluid">
            <div class="row" align="center">
                <div class="col-sm-12">
                    <!-- Authentication card start -->
                    <div class="signin-card card-block auth-body">
                        <form name="form1" class="md-float-material" method="post">
                            <div class="text-center">
								<img src="${path}/assets/images/auth/sc_ci2.png" alt="소프트코어">
                                <!--<img src="${path}/assets/images/auth/logo-dark.png" alt="logo.png">-->
                            </div>
                            <div class="auth-box">
								<!-- 
								<div class="row m-b-20">
									<div class="col-md-3"  >
										<h3 class="text-center txt-primary"></h3>
									</div>
								 </div> -->
								<div class="inwrap">
									<p class="text-inverse b-b-default text-center p-b-10">로그인 하십시오.</p>
									<div class="input-group">
										<input type="text" id="compId" name="compId" class="form-control" placeholder="회사 아이디" required>
										<span class="md-line"></span>
									</div>
									<div class="input-group">
										<input type="text" id="userId" autocomplete="off" name="userId" class="form-control" placeholder="사용자 아이디" required>
										<span class="md-line"></span>
									</div>
									<div class="input-group">
										<input type="password" id="userPasswd" autocomplete="off" name="userPasswd" class="form-control" placeholder="암호를 입력해 주십시오." required>
										<span class="md-line"></span>
									</div>
									<div class="row m-t-30">
										<div class="col-md-12">
											<button type="submit" id="btnlogin" name="btnlogin" class="btn btn-primary btn-md btn-block waves-effect text-center m-b-20">LOGIN</button>
										</div>
									</div>
								</div>
                            </div>
                        </form>
                        <!-- end of form -->
                    </div>
                    <!-- Authentication card end -->
                </div>
                <!-- end of col-sm-12 -->
            </div>
            <!-- end of row -->
        </div>
        <!-- end of container-fluid -->
    </section>
    <!-- Required Jquery -->
    <script type="text/javascript" src="${path}/assets/js/popper.js/js/popper.min.js"></script>
    <!-- jquery slimscroll js -->
    <script type="text/javascript" src="${path}/assets/js/common-pages.js"></script>
</body>

</html>
