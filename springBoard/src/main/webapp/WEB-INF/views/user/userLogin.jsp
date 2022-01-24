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
				alert("���̵� �Է��ϼ���.");
				$j("#userId").focus();
				return;
			} else if($j("#userId").val().length > $j("#userId").val().replace(/\s/gi,"").length) {
				alert("���̵� ������ �� �� �����ϴ�.");
				$j("#userId").focus();
				return;
			} else if(!/^[a-zA-Z0-9]{4,15}$/.test($j("#userId").val())) {
				alert("���̵�� 4~12���� ����� ���ڸ� ����� �����մϴ�.");
				$j("#userId").focus();
				return;
			} else if(userPw == "") {
				alert("��й�ȣ�� �Է��ϼ���.");
				$j("#userPw").focus();
				return;
			}
			//�� ������ �����͸� ������ �ּ�
			document.userLogin.action="${path}/user/userLogin.do";
			//����
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
			<input type="button" class="loginBtn" value="�α����ϱ�" id="login" onclick="fn_userLogin(this.form)" />
			</td>
		</tr>
	</table>
	 -->
	<table border="1" align="center">
		<tr>
			<td>���̵�</td>
			<td><input name="userId" id="userId"/></td>
		</tr>
		<tr>
			<td>��й�ȣ</td>
			<td><input type="password" name="userPw" id="userPw"/></td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				<input type="submit" id="loginBtn" value="Login">
			<c:if test="${msg == 'failure'}">
				<div style="color:red; font-size:12px;">
					���̵� �Ǵ� ��й�ȣ�� ��ġ���� �ʽ��ϴ�.
				</div>
			</c:if>
			<c:if test="${msg == 'logout'}">
				<div style="color:red; font-size:12px;">
					�α׾ƿ� �Ǿ����ϴ�.
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
		console.log("���� null����"); 
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
			alert("���̵� Ȯ�����ּ���.");
			$j("#userId").focus();
			return false;
		}else if(!userPw){
			alert("��й�ȣ�� Ȯ�����ּ���.");
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
	
			// �Է� �� üũ
			if($j.trim($('#userId').val()) == ''){
				alert("���̵� �Է��� �ּ���.");
				$j('#userId').focus();
				return;
			}else if($j.trim($('#userPw').val()) == ''){
				alert("�н����带 �Է��� �ּ���.");
				$j('#userPw').focus();
				return;
			}
			
			//����
			$('#loginFrm').submit();

		});
		
	});
	*/

	
	
	
		

</script>
</body>
</html>