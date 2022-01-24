<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@include file="/WEB-INF/views/common/common.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>list</title>
</head>
<body>
<table align="center">
	<tr>
		<td>
			<c:if test="${userName == null}"><a href="/user/userLogin.do">Login</a></c:if>
			<c:if test="${userName != null}"><a href="/board/boardLogout.do">Logout</a></c:if>
			<a href="/user/userJoin.do">Join</a>
			<span style="float:right;">
			total : ${totalCnt}
			</span>
		</td>
	</tr>

	<tr>
		<td>
			<table id="boardTable" border = "1">
				
				<tr>
					<td width="80" align="center">
						Type
					</td>
					<td width="40" align="center">
						No
					</td>
					<td width="300" align="center">
						Title
					</td>
				</tr>
				<c:forEach items="${boardList}" var="list">
					<tr>
						<td align="center">
							${list.codeName}
						</td>
						<td>
							${list.boardNum}
						</td>
						<td>
							<a href = "/board/${list.boardType}/${list.boardNum}/boardView.do?pageNo=${pageVo.pageNo}">${list.boardTitle}</a>
						</td>
					</tr>	
				</c:forEach>
			</table>
		</td>
	</tr>
	<tr>
		<td align="right">
			<a href ="/board/boardWrite.do">�۾���</a>
		</td>
	</tr>
</table>
<table align="center">
	<tr>
		<td>
			<form id="selectType" class="selectType" method="get" action="/board/boardList.do">
				<input type="checkbox" name="allCheck" id="allCheck" value="allSelect">��ü
					<c:forEach var="code" items="${codeName}" varStatus="status">
						<input type="checkbox" class="typeCk" name="codeId" id="codeId" value="${code.codeId}">${code.codeName}</>
					</c:forEach>
				<button type="button" id="btnSearch">��ȸ</button>
			</form>
		</td>
	</tr>
</table>
<table align="center">
	<tr>
		<td>
			<c:if test="${pageVo.beginPage != 1}">
						<a href="/board/boardList.do?pageNo=${pageVo.beginPage - 1 }">
							&lt;
						</a>
			</c:if>
		<c:forEach var="i" begin="${pageVo.beginPage}" end="${pageVo.endPage }" step="1">
			<c:if test="${pageVo.pageNo == i }">
				<span>
					${i }
				</span>
			</c:if>
			<c:if test="${pageVo.pageNo != i }">
				<a href="/board/boardList.do?pageNo=${i }" >
					${i }
				</a>
			</c:if>		
		</c:forEach>
			<c:if test="${pageVo.totalPage > pageVo.endPage }">
					<a href="/board/boardList.do?pageNo=${pageVo.endPage + 1 }">
						&gt;
					</a>
			</c:if>
		</td>
	</tr>
</table>	

<script type="text/javascript">

	$j(document).ready(function(){
		
		$j("#btnSearch").click(function(){
			//	var $frm = $j('.selectType :input');
			//	var param = $frm.serialize();

			//	console.log(param);
				$j("#selectType").submit();
			});
		
		
		// ��ü ����
		$j("#allCheck").click(function(){
		        //Ŭ���Ǿ�����
	        if($j("#allCheck").prop("checked")){
	            //input�±��� name�� codeId�� �±׵��� ã�Ƽ� checked�ɼ��� true�� ����
	            $j("input[name=codeId]").prop("checked",true);
	            //Ŭ���� �ȵ�������
	        }else{
	            //input�±��� name�� codeId�� �±׵��� ã�Ƽ� checked�ɼ��� false�� ����
	            $j("input[name=codeId]").prop("checked",false);
	        }
	    })
    
	});
		
		// ���� ������ ��� ���õǸ� ��ü �����ϱ� ���
		$j(document).on('click','#codeId',function(){
		    if($j('input[name=codeId]:checked').length==4){
		        $j('#allCheck').prop('checked',true);
		    }else{
		       $j('#allCheck').prop('checked',false);
		    }
		    
	});
	
	
	/*
	$j(document).on('click','typeCk',function(){
	    if($j('input[class=typeCk]:checked').length==$j('.typeCk').length){
	        $j('#allCheck').prop('checked',true);
	    }else{
	       $j('#allCheck').prop('checked',false);
	    }
	    
	});
	*/
	
	/*
	function checkSelectAll(checkbox)  {
		  const allCheck 
		    = document.querySelector('input[name="allCheck"]');
		  
		  if(checkbox.checked === false)  {
		    selectall.checked = false;
		  }
		}

		function selectAll(selectAll)  {
		  const checkboxes 
		     = document.getElementsByName('codeId');
		  
		  checkboxes.forEach((checkbox) => {
		    checkbox.checked = selectAll.checked
		  })
		}
	
	});
	*/
		

</script>	
		
		
</body>
</html>