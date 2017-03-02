<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/assets/css/bootstrap.css" />
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/assets/css/bootstrap-switch.css" />
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/assets/css/font-awesome.css" />
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/assets/css/admin.css"></link>
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/assets/css/plus.css" />
	<script src="<%=request.getContextPath() %>/assets/js/jquery-2.1.1.min.js"></script>
	<script src="<%=request.getContextPath() %>/assets/js/bootstrap.min.js"></script>
	<script src="<%=request.getContextPath() %>/assets/js/bootstrap-switch.min.js"></script>
	<title>温室智慧管控系统</title>
</head>
<body>
	<div class="w11 center-block">
	<div class="container-fluid">
	  <div class="row">
		<div class="panel panel-success my-panel">
		  <!-- Default panel contents -->
		  <div class="panel-heading"><span class="glyphicon glyphicon-pushpin" style="font-size:10px"></span>&nbsp;&nbsp;作物管理</div>
		  <div class="panel-body">
		    <table class="table table-bordered">
				<tr>
					<th>编号</th>
					<th>作物名称</th>
					<th>作物编码</th>
					<th>作物品种</th>
					<th>定植日期</th>
					<!-- <th>作物栽培要求</th> -->
					<!-- <th>操作</th> -->
				</tr>

				<c:forEach items="${pager.list}" var="i">
					<tr>
						<td class="text-center">${i.crop_id }</td>
						<td class="text-center">${i.crop_name }</td>
						<td class="text-center">${i.crop_code }</td>
						<td class="text-center">${i.crop_type }</td>
						<td class="text-center">${i.crop_date }</td>
					<%-- 	<td class="text-center">${i.crop_period }</td> --%>
						<%-- <td class="text-center"><a href="javascript:;"
							onclick="del(${i.crop_id })">删除</a></td> --%>
					</tr>
				</c:forEach>
			</table>
		  </div><!-- end panel-body -->
		</div><!-- end panel -->
	  </div><!-- end row -->
	</div><!-- end contauner-fluid -->
		
		<div id="page"></div>
		<c:if test="${pager.list.size()==0}">
		<div style="position: absolute; right: 20px; width: 100px; ">
			<input type="button" class="btn bcm tcw" value="添加作物"
				onclick="location='<%=request.getContextPath()%>/ghmgr/ghadmin/crop/add?ghid=${ghid }'">
		</div>
		</c:if>
		<c:if test="${pager.list.size()!=0}">
		<div style="position: absolute; right: 20px; width: 100px; display:none">
			<input type="button" class="btn bcm tcw" value="添加作物"
				onclick="location='<%=request.getContextPath()%>/ghmgr/ghadmin/crop/add?ghid=${ghid }'">
		</div>
		</c:if>
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