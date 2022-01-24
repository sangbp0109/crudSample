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
				<input type="button" id="idCheckBtn" class="idCheck" value="중복확인"  /><br />
				<span class="warning noDisplay" id="idWarning">중복확인을 진행해 주세요</span> 
			</td>
		</tr>
		<tr>
			<td>pw <span class="warning" id="pwRequire">*</span></td>
			<td>
				<input type="password" name="userPw" id="pw" class="pw" /><br>
				<span class="warning" id="pwWarning">6~12 자리의 비밀번호를 입력해 주새요.</span>
			</td>
		</tr>	
		<tr>
			<td>pw check <span class="warning" id="pw2Require">*</span></td>
			<td>
				<input type="password" id="pw2" class="pw2" /><br>
				<span class="warning noDisplay" id="pwSameWarning">입력하신 비밀번호와 일치하지 않습니다.</span>
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
				<span class="warning noDisplay" id="phoneRegCheck">전화번호 양식에 맞춰주세요.000-0000-0000</span>
			</td>
			
		</tr>
		<tr>	
			<td>postNo</td>
			<td>
				<input type="text" name="userPostNo" id="postNo" class="postNo" placeholder="xxx-xxx" /><br>
				<span class="warning noDisplay" id="postNoRegCheck">우편번호 양식에 맞춰주세요.000-000</span>
				
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
			<input id="submit" type="button" value="가입하기">
			</td>
		</tr>
	</table>
	<!-- 
				<button>작성완료</button>
				<input id="submit" type="button" value="가입하기">
	 -->				
	
				<!-- 
				이름<br/>
				<input type="text" name="name" autofocus /><br/><br/>
				전화<br/>
				<input type="text" name="phone" /><br/><br/>
				 -->	
	
</form>

<script type="text/javascript">
	
	// pw 유효성 체크
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
	
	// 비밀번호 확인 일치 유효성
	let pw2 = document.querySelector('#pw2');
	pw2.addEventListener('keyup',pw2SameCheck);
	function pw2SameCheck(){
		let pwValue = pw.value;
		let pw2Value = pw2.value;
		let pwSameBox = document.querySelector('#pwSameWarning');
		let pw2Require = document.querySelector('#pw2Require');

		// 같지않으면
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
	
	// name null 체크
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
	
	// phone 유효성 체크
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
	
	// 우편번호 유효성 체크
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
	
	// id 중복체크
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
				// true 면 해당 id 가 존재하므로 중복체크 실패
				if(responseObj.isExist){
					alert('해당 id가 존재합니다. 다른 아이디를 사용해 주세요.')
					idRepuired.classList.replace('success','warning');
					idCheckPass = false;
				}else{
					alert('사용가능한 ID 입니다.');
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
	
	// 가입
	let submitBtn = document.querySelector('#submit');
	submitBtn.addEventListener('click', joinUser);
	function joinUser(){
		if(!idCheckPass){
			alert('id 중복체크를 진행해 주새요');
			return
		}
		
		if(!pwRegCheck()){
			alert('비밀번호 양식을 맞춰주세요.');
			return
		}
		
		if(!pw2SameCheck()){
			alert('비밀번호가 일치하지 않습니다.')
			return
		}
		
		if(!nameCheck()){
			alert('이름을 입력해 주새요.')
			return
		}
		
		if(!phoneCheck()){
			alert('핸드폰 번호 양식을 맞춰주세요.');
			return
		}
		
		if(!postRegCheck()){
			alert('우편번호 양식을 맞춰주세요.');
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
				alert("가입 완료");
				
				alert("메세지:"+data.success);	
				
				location.href = "/board/boardList.do?pageNo=1";
		    },
		    error: function (jqXHR, textStatus, errorThrown)
		    {
		    	alert("가입 실패");
		    }
		});
		
		
		
	}
	
	
</script>

</body>
</html>