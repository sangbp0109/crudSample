<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@include file="/WEB-INF/views/common/common.jsp"%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>userJoin</title>
<link rel="styleSheet" href="/resources/style/regMember.css">
</head>
<body>
<form class="join" method="post">
	<table align="center">
		<tr>
			<td>
				<a href="/board/boardList.do">List</a>
			</td>
		</tr>
	</table>
	<table align="center" border="1">
		<tr>
			<td>id<span class="warning" id="idRepuire">*</span></td>
			<td>
				<input type="text" name="userId" id="id" class="id" autofocus /> 
				<input type="button" id="idCheckBtn" class="idCheck" value="�ߺ�Ȯ��"  /><br />
				<span class="warning noDisplay" id="idWarning">�ߺ�Ȯ���� ������ �ּ���</span> 
			</td>
		</tr>
		<tr>
			<td>pw <span class="warning" id="pwRequire">*</span></td>
			<td>
				<input type="password" name="userPw" id="pw" class="pw" /><br>
				<span class="warning" id="pwWarning">6~12 �ڸ��� ��й�ȣ�� �Է��� �ֻ���.</span>
			</td>
		</tr>	
		<tr>
			<td>pw check <span class="warning" id="pw2Require">*</span></td>
			<td>
				<input type="password" id="pw2" class="pw2" /><br>
				<span class="warning noDisplay" id="pwSameWarning">�Է��Ͻ� ��й�ȣ�� ��ġ���� �ʽ��ϴ�.</span>
			</td>
		</tr>
		<tr>	
			<td>name <span class="warning" id="nameRequire">*</span></td>
			<td>
				<input type="text" name="userName" id="name" class="name" />
			</td>
		</tr>
		<tr>
			<td>phone <span class="warning" id="phoneRequire">*</span></td>
			<td>
				<select name="userPhone1">
					<c:forEach var="item" items="${phoneList}" varStatus="status">
						<option value="${item.codeName }">${item.codeName }</option>
					</c:forEach>
				</select>
				-
				<input type="text" name="userPhone2" id="phone2" class="phoneBox">
				-
				<input type="text" name="userPhone3" id="phone3" class="phoneBox"><br>
				<span class="warning noDisplay" id="phoneRegCheck">��ȭ��ȣ ��Ŀ� �����ּ���.000-0000-0000</span>
			</td>
			
		</tr>
		<tr>	
			<td>postNo</td>
			<td>
				<input type="text" name="userPostNo" id="postNo" class="postNo" placeholder="xxx-xxx" /><br>
				<span class="warning noDisplay" id="postNoRegCheck">�����ȣ ��Ŀ� �����ּ���.000-000</span>
				
			</td>
		</tr>
		<tr>	
			<td>address</td>
			<td>
				<input type="text" name="userAddr" id="address" class="address" />
			</td>
		</tr>
		<tr>	
			<td>company</td>
			<td>
				<input type="text" name="userCompany" id="company" class="company" />
			</td>
		</tr>
	</table>
	<table align="center">
		<tr>
			<td>
			<input id="submit" type="button" value="�����ϱ�">
			</td>
		</tr>
	</table>
	<!-- 
				<button>�ۼ��Ϸ�</button>
				<input id="submit" type="button" value="�����ϱ�">
	 -->				
	
				<!-- 
				�̸�<br/>
				<input type="text" name="name" autofocus /><br/><br/>
				��ȭ<br/>
				<input type="text" name="phone" /><br/><br/>
				 -->	
	
</form>

<script type="text/javascript">
	
	// pw ��ȿ�� üũ
	let pw = document.querySelector('#pw');
	pw.addEventListener('keyup',pwRegCheck);
	function pwRegCheck(){
		let pwReg = /^[A-Za-z0-9]{6,12}$/;
		let pwVal = pw.value;
		let pwRequire = document.querySelector('#pwRequire');
		
		if(pwReg.test(pwVal)){
			pwWarning.classList.add('noDisplay');
			pwRequire.classList.replace('warning', 'success');
			return true
		}else{
			pwWarning.classList.remove('noDisplay');
			pwRequire.classList.replace('success', 'warning');
			return false
		}
	}
	
	// ��й�ȣ Ȯ�� ��ġ ��ȿ��
	let pw2 = document.querySelector('#pw2');
	pw2.addEventListener('keyup',pw2SameCheck);
	function pw2SameCheck(){
		let pwValue = pw.value;
		let pw2Value = pw2.value;
		let pwSameBox = document.querySelector('#pwSameWarning');
		let pw2Require = document.querySelector('#pw2Require');

		// ����������
		if(pwValue !== pw2Value){
			pwSameBox.classList.remove('noDisplay');
			pw2Require.classList.replace('success', 'warning')
			return false
		}else{
			pwSameBox.classList.add('noDisplay');
			pw2Require.classList.replace('warning', 'success')

			return true
		}
	}
	
	// name null üũ
	let nameVal = document.querySelector('#name');
	let nameRequire = document.querySelector('#nameRequire');
	nameVal.addEventListener('keyup', nameCheck);
	function nameCheck(){
		if(nameVal.value === '' || nameVal.value === null || nameVal.value === undefined){
			nameRequire.classList.replace('success', 'warning');
			return false
		}else{
			nameRequire.classList.replace('warning', 'success');
			return true
		}
	}
	
	// phone ��ȿ�� üũ
	let phone2 = document.querySelector('#phone2');
	let phone3 = document.querySelector('#phone3');
	let phoneRegBox = document.querySelector('#phoneRegCheck');
	let phoneRequired = document.querySelector('#phoneRequire');
	phone2.addEventListener('keyup', phoneCheck);
	phone3.addEventListener('keyup', phoneCheck);

	function phoneCheck(){
		let phoneReg = /^[0-9]{4}$/;
		if(phoneReg.test(phone2.value) && phoneReg.test(phone3.value)){
			phoneRegBox.classList.add('noDisplay');
			phoneRequired.classList.replace('warning', 'success')
			return true
		}else{
			
			phoneRegBox.classList.remove('noDisplay');
			phoneRequired.classList.replace('success', 'warning')

			return false
		}

	}
	
	// �����ȣ ��ȿ�� üũ
	let postNo = document.querySelector('#postNo');
	postNo.addEventListener('keyup',postRegCheck);
	function postRegCheck(){
		let postReg = /^\d{3}-\d{3}/;
		let postVal = postNo.value;
		let postCheckBox = document.querySelector('#postNoRegCheck');
		
		if(postReg.test(postVal)){
			postCheckBox.classList.add('noDisplay');
			return true;
		}else{
			postCheckBox.classList.remove('noDisplay');
			return false;
		}
	}
	
	// id �ߺ�üũ
	let idCheckPass = false;
	let idCheckBtn = document.querySelector('#idCheckBtn');
	let id = document.querySelector('#id');
	let idRepuired = document.querySelector('#idRepuire');
	idCheckBtn.addEventListener('click',idCheckBtnEvent);
	function idCheckBtnEvent(){
		let idVal = id.value;
		$j.ajax({
			url: '/idCheck.do',
			data: "id=" + idVal,
			type: 'post',
			dataType: 'json',
			success: function(responseObj){
				// true �� �ش� id �� �����ϹǷ� �ߺ�üũ ����
				if(responseObj.isExist){
					alert('�ش� id�� �����մϴ�. �ٸ� ���̵� ����� �ּ���.')
					idRepuired.classList.replace('success','warning');
					idCheckPass = false;
				}else{
					alert('��밡���� ID �Դϴ�.');
					idRepuired.classList.replace('warning','success');
					idCheckPass = true;
				}
			}
		})
	};
	
	id.addEventListener('keyup', idKeyUpCheck);
	function idKeyUpCheck(){
		idRepuired.classList.replace('success','warning');
		idCheckPass = false;
	}
	
	// ����
	let submitBtn = document.querySelector('#submit');
	submitBtn.addEventListener('click', joinUser);
	function joinUser(){
		if(!idCheckPass){
			alert('id �ߺ�üũ�� ������ �ֻ���');
			return
		}
		
		if(!pwRegCheck()){
			alert('��й�ȣ ����� �����ּ���.');
			return
		}
		
		if(!pw2SameCheck()){
			alert('��й�ȣ�� ��ġ���� �ʽ��ϴ�.')
			return
		}
		
		if(!nameCheck()){
			alert('�̸��� �Է��� �ֻ���.')
			return
		}
		
		if(!phoneCheck()){
			alert('�ڵ��� ��ȣ ����� �����ּ���.');
			return
		}
		
		if(!postRegCheck()){
			alert('�����ȣ ����� �����ּ���.');
			return
		}
		
		let param = $j('.join').serialize();
		$j.ajax({
			url: '/user/userJoinAction.do',
			dataType: "json",
			type: "POST",
		    data : param,
		    success: function(data, textStatus, jqXHR)
		    {
				alert("���� �Ϸ�");
				
				alert("�޼���:"+data.success);	
				
				location.href = "/board/boardList.do?pageNo=1";
		    },
		    error: function (jqXHR, textStatus, errorThrown)
		    {
		    	alert("���� ����");
		    }
		});
		
		
		
	}
	
	
</script>

</body>
</html>