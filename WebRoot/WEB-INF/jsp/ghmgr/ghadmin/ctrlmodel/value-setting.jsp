<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet"
	href="<%=request.getContextPath() %>/assets/css/style.css"
	type="text/css"></link>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath() %>/assets/css/theme.css">
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath() %>/assets/css/font-awesome.css">
<link rel="stylesheet"
	href="<%=request.getContextPath() %>/assets/css/admin.css"
	type="text/css"></link>
<script
	src="<%=request.getContextPath() %>/assets/js/jquery-2.1.1.min.js"></script>
<script src="<%=request.getContextPath() %>/assets/js/bootstrap.min.js"></script>
<title>控制模式</title>
</head>
<body>
	<div style="width: 60%; margin: 20px auto;">
		<table class="table table-bordered table-condensed">
			<!-- <tr>
		<td class="text-center"><span style="line-height:40px;">切换控制模式:</span></td>
		<td>
			<select class="form-control" onchange="changeMode();" id="mode">
				<option value="1">设定值控制</option>
				<option value="2">手动控制</option>
				<option value="0">智能控制</option>
			</select>
		</td>
	</tr> -->
			<tr>
				<th>模式</th>
				<th>开始时间</th>
				<th>结束时间</th>
				<th>操作</th>
			</tr>
			<c:forEach items="${pager.list}" var="i">
				<tr>
					<td class="text-center">${i.mode }</td>
					<td class="text-center"><fmt:formatDate
							value="${i.start_time }" pattern="yyyy-MM-dd HH:mm"></fmt:formatDate></td>
					<td class="text-center"><fmt:formatDate value="${i.end_time }"
							pattern="yyyy-MM-dd HH:mm"></fmt:formatDate></td>
					<td class="text-center"><a href="#">添加</a></td>
				</tr>
			</c:forEach>
		</table>
		<div id="page"></div>
	</div>
	<script type="text/javascript">
function changeMode(){
	var pass,mode=$('#mode').val(); 
	if(pass = prompt('请输入密码：')){
		$.post('change_mode',{
			password:pass,
			modeType:mode
		},'json')
		.done(function(data){
			if(data){
				alert('模式更改成功！');
				top.window.location.reload();
			}
			else{
				alert('密码错误，修改失败')
			}
		});
	}
}
$(function(){
		laypage({
	    cont: 'page',
	    pages: '${pager.pageCount}', 
	    curr: '${pager.pageNumber}', 
	    jump: function(e, first){ 
	        if(!first){ 
	            location.href = '?ps=${pager.pageSize}&pn='+e.curr;
	        }
	    }
	});
})
</script>
</body>
</html>