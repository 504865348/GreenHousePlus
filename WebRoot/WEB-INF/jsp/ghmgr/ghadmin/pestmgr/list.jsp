<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
<title>温室 - 农药管理 - 查看</title>
</head>
<body>
	<div class="w11 center-block">
		<h3 class="h3">查看农药</h3>
		<table class="table table-bordered table-hover">
			<tr>
				<th>编号</th>
				<th>农药名称</th>
				<th>备注</th>
				<th>操作</th>
			</tr>

			<c:forEach items="${pager.list}" var="i">
				<tr>
					<td class="text-center">${i.pest_id }</td>
					<td class="text-center">${i.pest_name }</td>
					<td class="text-center">${i.remark }</td>
					<td class="text-center"><a href="javascript:;"
						onclick="del(${i.pest_id })">删除</a></td>
				</tr>
			</c:forEach>
		</table>
		<div id="page"></div>
		<div style="position: absolute; right: 20px; width: 100px;">
			<input type="button" class="btn bcm tcw" value="添加农药"
				onclick="location='<%=request.getContextPath()%>/ghmgr/ghadmin/pestmgr/add'">
		</div>
		<script type="text/javascript"
			src="<%=request.getContextPath()%>/assets/js/jquery.min.js"></script>
		<script type="text/javascript"
			src="<%=request.getContextPath()%>/assets/laypage/laypage.js"></script>
		<script>
function del(id){
	if(confirm('确定删除？')){
		$.get('delete',{id:id},function(data){
			if(data){
				alert('删除成功');
				location.reload();
			}
			else{
				alert('删除失败');
			}
		},'json');
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
	</div>
</body>
</html>