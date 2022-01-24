<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@include file="/WEB-INF/views/common/common.jsp"%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>login</title>
<link rel="styleSheet" href="/resources/style/regMember.css">
</head>
<script type="text/javascript">
	$j(document).ready(function(){
		
		$j("#loginBtn").on("click",function() {
			var userId = $j("#userId").val();
			var userPw = $j("#userPw").val();
			
			if(userId == "") {
				alert("아이디를 입력하세요.");
				$j("#userId").focus();
				return;
			} else if($j("#userId").val().length > $j("#userId").val().replace(/\s/gi,"").length) {
				alert("아이디엔 공백이 들어갈 수 없습니다.");
				$j("#userId").focus();
				return;
			} else if(!/^[a-zA-Z0-9]{4,15}$/.test($j("#userId").val())) {
				alert("아이디는 4~12자의 영어와 숫자만 사용이 가능합니다.");
				$j("#userId").focus();
				return;
			} else if(userPw == "") {
				alert("비밀번호를 입력하세요.");
				$j("#userPw").focus();
				return;
			}
			//폼 내부의 데이터를 전송할 주소
			document.userLogin.action="${path}/user/userLogin.do";
			//제출
			document.userLogin.submit();
		});
	});
</script>
<body>
<form class="userLogin" method="post">

	<!-- 
	<table align="center" border="1">
		<tr>
			<td>id</td>
			<td>
				<input type="text" name="userId" id="userId" class="userId" autofocus /> 
			</td>
		</tr>
		<tr>
			<td>pw</td>
			<td>
				<input type="password" name="userPw" id="userPw" class="userPw" /><br>
			</td>
		</tr>	
	</table>
	<table align="center">
		<tr>
			<td align="right">
			<input type="button" class="loginBtn" value="로그인하기" id="login" onclick="fn_userLogin(this.form)" />
			</td>
		</tr>
	</table>
	 -->
	<table border="1" align="center">
		<tr>
			<td>아이디</td>
			<td><input name="userId" id="userId"/></td>
		</tr>
		<tr>
			<td>비밀번호</td>
			<td><input type="password" name="userPw" id="userPw"/></td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				<input type="submit" id="loginBtn" value="Login">
			<c:if test="${msg == 'failure'}">
				<div style="color:red; font-size:12px;">
					아이디 또는 비밀번호가 일치하지 않습니다.
				</div>
			</c:if>
			<c:if test="${msg == 'logout'}">
				<div style="color:red; font-size:12px;">
					로그아웃 되었습니다.
				</div>
			</c:if>
			</td>
		</tr>
	</table>
</form>

	

<script type="text/javascript">
	
	<%--
	var userId = '<%=(String)session.getAttribute("userId")%>';
	if(userId =="null"){ 
		console.log("세션 null상태"); 
	} else { 
		console.log(userId);
	}
	
	function fn_userLogin(f) {
		
			f.action = '/user/loginAction.do';
			f.submit();
	}
	
	
	function fn_userLogin(){
		
		var userId = $j("#userId").val();
		var userPw = $j("#userPw").val();
		
		if(!userId){
			alert("아이디를 확인해주세요.");
			$j("#userId").focus();
			return false;
		}else if(!userPw){
			alert("비밀번호를 확인해주세요.");
			$j("#userPw").focus();
			return false;
		}else {
			login(userId,userPw);
		}
		
		
	}
	--%>
	
	
	/*
	$j(document).ready(function(e){
		$j('#login').click(function(){
	
			// 입력 값 체크
			if($j.trim($('#userId').val()) == ''){
				alert("아이디를 입력해 주세요.");
				$j('#userId').focus();
				return;
			}else if($j.trim($('#userPw').val()) == ''){
				alert("패스워드를 입력해 주세요.");
				$j('#userPw').focus();
				return;
			}
			
			//전송
			$('#loginFrm').submit();

		});
		
	});
	*/

	
	
	
		

</script>
</body>
</html>