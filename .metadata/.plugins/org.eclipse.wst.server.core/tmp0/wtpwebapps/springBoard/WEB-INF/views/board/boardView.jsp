<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@include file="/WEB-INF/views/common/common.jsp"%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script src="/resources/js/jquery-1.10.2.js"></script>
<title>boardView</title>
</head>

<script type="text/javascript">


$j(document).ready(function(){
	
		$j("#deleteBtn").on("click",function(){
			var $frm = $j('.boardDelete :input');
			var param = $frm.serialize();
			console.log(param);
			$j.ajax({
			    url : "/board/${boardType}/${boardNum}/boardDelete.do",
			    dataType: "json",
			    type: "POST",
			    data : param,
			    success: function(data, textStatus, jqXHR, result)
			    {
			    	if (data.success == "Y"){
						alert("삭제 완료");
						location.href = "/board/boardList.do?pageNo=1";
			    	} else {
			    		alert ("이미 삭제된 게시글입니다.")
			    	}
					alert ("메세지:"+ data.success);	
					
					//location.href = "/board/boardList.do?pageNo=1";
			    },
			    error: function (jqXHR, textStatus, errorThrown)
			    {
			    	alert("실패");
			    }

			});
		});
	});

		function fn_boardUpdate(f) {
			f.action = 'boardUpdate.do';
			f.submit();
		}

		/*
		function fn_boardDelete(f) {
			if (confirm('삭제할까요?')) {
				f.action = 'boardDelete.do';
				f.submit();
			}
		}
		*/
		
</script>
<body>


	
		
		
	
	
<form class="boardDelete" method="post">
	<input type="hidden" name="boardNum" value="${board.boardNum}" />
	<input type="hidden" name="boardType" value="${board.boardType}" />
<table align="center">
	<tr>
		<td align="right">
			<input id=deleteBtn type="button" value="삭제하기">
		</td>
	</tr>
	<tr>
		<td>
			<table border ="1">
				<tr>
					<td width="120" align="center">
					Title
					</td>
					<td width="400">
					${board.boardTitle}
					</td>
				</tr>
				<tr>
					<td height="300" align="center">
					Comment
					</td>
					<td>
					${board.boardComment}
					</td>
				</tr>
				<tr>
					<td align="center">
					Writer
					</td>
					<td>
					${user.userName}
					</td>
				</tr>
				<tr>
					<td>
						<input type="button" value="수정하기" onclick="fn_boardUpdate(this.form)" />
					</td>
				</tr>
			</table>
		</td>
	</tr>
	<tr>
		<td align="right">
			<a href="/board/boardList.do">List</a>
		</td>
	</tr>
	
</table>
</form>
</body>
</html>