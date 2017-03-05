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
 <input type="hidden" id="gh_id" value='${ghid }' />
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
					<th>修改</th>
					<!-- <th>作物栽培要求</th> -->
					<!-- <th>操作</th> -->
				</tr>

				<c:forEach items="${pager.list}" var="i">
					<tr>
						<td class="text-center" id="crop_id">${i.crop_id }</td>
						<td class="text-center"><input type="text" id="name" readOnly value="${i.crop_name }"></td>
						<td class="text-center" id="code">${i.crop_code }</td>
						<td class="text-center"><input type="text" id="type"readOnly value="${i.crop_type }"></td>
						<td class="text-center"><input type="text" id="date"readOnly value="${i.crop_date }"></td>
						<td>
						 <button type="button" id="modify_one" class="btn bg-success btn-xs btn-block text-muted" data-toggle="modal" data-target="#modify"> 修改 </button>
						 <button type="button" id="modify_two"  style="display:none" class="btn bg-success btn-xs btn-block text-muted" data-toggle="modal" onClick="modify_crop_info()"> 确定 </button>
					    </td>
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
		
 <!-- Modal -->
<div class="modal fade" id="modify" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h3 class="modal-title" id="myModalLabel">请输入<span class="text-danger">作物管理</span>密码</h3>
      </div>
      <div class="modal-body">
        <div class="input-group" style="width:100%">
        	<form action="">
        	 	<input type="password" id="pwd" class="form-control" placeholder="设定值控制密码" aria-describedby="sizing-addon2">
        	</form>
		</div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
        <button type="button" onclick="modify_crop()" class="btn bg-sussess">提交</button>
      </div>
    </div>
  </div>
</div>		
		<script type="text/javascript"
			src="<%=request.getContextPath()%>/assets/js/jquery.min.js"></script>
		<script type="text/javascript"
			src="<%=request.getContextPath()%>/assets/laypage/laypage.js"></script>
		<script>
		function modify_crop(){
			document.getElementById("modify").style.display='none';
			var pass = document.getElementById("pwd").value;
			var ghid = $("#gh_id").val();
			$.post('modifyCrop',{
				ghid:ghid,
				password:pass
			},'json')
			.done(function(data){
				if(data){
					document.getElementById("modify_one").style.display='none';
					document.getElementById("modify_two").style.display='';
					document.getElementById("name").removeAttribute("readOnly");
					document.getElementById("type").removeAttribute("readOnly");
					document.getElementById("date").removeAttribute("readOnly");
					/* document.getElementById("table_device").style.display='none'; */
				}
				else{
					alert('密码错误');
					
				}
			});
			
		}
		
		function modify_crop_info(){
			var crop_id =document.getElementById("crop_id").innerHTML;
			var name = document.getElementById("name").value;
			var code = document.getElementById("code").innerHTML;
			var type = document.getElementById("type").value;
			var date = document.getElementById("date").value;
			var ghid = $("#gh_id").val();
			$.post('modify_crop_info',{
				crop_id:crop_id,
				name:name,
				code:code,
				type:type,
				date:date,
				ghid:ghid
			},'json')
			.done(function(data){
				if(data){
					alert('修改成功');
					window.location.reload(); 
				}
				else{
					alert('修改失败');
					
				}
			}); 
			
		}
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