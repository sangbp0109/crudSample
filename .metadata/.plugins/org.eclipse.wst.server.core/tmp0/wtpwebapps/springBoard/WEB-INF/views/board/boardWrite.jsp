<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@include file="/WEB-INF/views/common/common.jsp"%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>boardWrite</title>
</head>
<script type="text/javascript">

	

	$j(document).ready(function(){
		
		$j("#submit").on("click",function(){
			var $frm = $j('.boardWrite :input');
			var param = $frm.serialize();
			$j.ajax({
			    url : "/board/boardWriteAction.do",
			    dataType: "json",
			    type: "POST",
			    data : param,
			    success: function(data, textStatus, jqXHR)
			    {
					alert("�ۼ��Ϸ�");
					
					alert("�޼���:"+data.success);	
					
					location.href = "/board/boardList.do?pageNo=1";
			    },
			    error: function (jqXHR, textStatus, errorThrown)
			    {
			    	alert("����");
			    }
			});
		});
	});
	
	
	/*
	var s = document.getelEmentsById("boardType");
	var boardType = s.options[s.selectedIndex].value;
	
	// select ID�� �� �� �б�
	$("#boardType option:selected").val();
	
	// ���õ� �� index �ҷ�����
	var index = $("#boardType option").index($("#boardType option:selected"));
	*/
	
</script>
<body>
<form class="boardWrite" method="post">
	<table align="center">
		<tr>
			<td align="right">
			<input id="submit" type="button" value="�ۼ�">
			</td>
		</tr>
		<tr>
			<td>
				<table border ="1"> 
					<tr>
						<td width="120" align="center">
							Type
						</td>
						<td width="400">
							<form id="codeName" class="codeName" method="post" >
								<select id="codeNameList" name="codeId" varStatus="status">
									<c:forEach var="code" items="${codeName}">
										<option value="${code.codeId}">${code.codeName}</option>		
									</c:forEach>
								</select>
							</form>
						</td>
					</tr>
					<tr>
						<td width="120" align="center">
						Title
						</td>
						<td width="400">
						<input name="boardTitle" type="text" size="50" value="${board.boardTitle}"> 
						</td>
					</tr>
					<tr>
						<td height="300" align="center">
						Comment
						</td>
						<td valign="top">
						<textarea name="boardComment"  rows="20" cols="55">${board.boardComment}</textarea>
						</td>
					</tr>
					<tr>
						<td align="center">
						Writer
						</td>
					</tr>
				</table>
				
		<tr>
			<td align="right">
				<a href="/board/boardList.do">List</a>
			</td>
		</tr>
	</table>
</form>	
</body>

<script type="text/javascript">

	/*
	function submit(){
	  		//id�� ����Ʈ�� ��������
		//$("#boardType option:selected").text();
	    (!$("#boardType option:selected").text());
	}
	*/
	
	
</script>
</html>