<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
<title>手动切换控制模型</title>
</head>
<body>
	<div style="width: 60%; margin: 20px auto;">
		<!-- <div class="w8 row mb20 center-block">
			<div class="col-xs-3"><span style="line-height:40px;">切换控制模式</span></div>
			<div class="col-xs-9"><select class="form-control" onchange="changeMode();" id="mode">
					<option value="2">手动控制</option>
					<option value="1">设定值控制</option>
					<option value="0">智能控制</option>
				</select>
			</div>
	</div> -->
		<h3 class="h3">手动切换控制模型</h3>
		<%-- 	<table class="table table-bordered table-condensed">
		<tr>
			<th>机构名称</th>
			<th>状态</th>
			<th>操作</th>
		</tr>
		<c:forEach items="${pager.list}" var="i">
		<tr>
			<td>${i.name }</td>
			<td>
			<c:if test="${i.status.Con_stage == 0 }">
				关
			</c:if>
			<c:if test="${i.status.Con_stage == 1 }">
				开
			</c:if>
			</td>
			<td>
			<c:if test="${i.status.Con_stage == 0 }">
				关
			</c:if>
			<c:if test="${i.status.Con_stage == 1 }">
				开
			</c:if>
			</td>
		</tr>
		</c:forEach>
	</table> --%>
		<table class="table table-bordered table-condensed">
			<tr>
				<th>机构名称</th>
				<th>状态</th>
				<c:forEach items="${setupCons }" var="setupConId">
					<th>${setupConId.name }</th>
				</c:forEach>
			</tr>
			<c:forEach items="${cons }" var="i">
				<c:set var="con" value="${i.map }"></c:set>
				<tr>
					<td class="text-center">${con.id }</td>
					<td class="text-center"><fmt:formatDate
							value="${con.control_time }" pattern="yyyy-MM-dd HH:mm:ss" /></td>
					<c:forEach items="${setupCons }" var="setupConId">
						<c:set var="prop" value="${'eqipid'}_${setupConId.equip_id }"></c:set>
						<td><c:if test="${con[prop] == 0 }">关<button>打开</button>
							</c:if> <c:if test="${con[prop] == 1 }">开<button>关闭</button>
							</c:if></td>
					</c:forEach>
				</tr>
			</c:forEach>
		</table>
	</div>
	<div id="page"></div>
	<script type="text/javascript"
		src="<%=request.getContextPath()%>/assets/js/jquery.min.js"></script>
	<script type="text/javascript"
		src="<%=request.getContextPath()%>/assets/laypage/laypage.js"></script>
	<script>
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
</script>
</body>
</html>