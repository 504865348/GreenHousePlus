<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//Dth HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dth">
<html>
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
<title>施肥灌溉系统</title>
</head>
<body>
<!-- 袁健炜 -->
 <input type="hidden" id="base_id" value='${irr.base_id}' />
<div class="panel panel-success my-panel">
	  <!-- Default panel contents -->
	  <div class="panel-heading"><span class="glyphicon glyphicon-pushpin" style="font-size:10px"></span>&nbsp;&nbsp;温室阀控制</div>
	  <div class="panel-body">
	    <p>温室阀信息</p>
	  </div>
 <table class="table table-bordered table-striped table-condensed" id="table_irr">
		    <tr>
			<th>温室</th>
			<th>灌溉阀状态</th>
			<th>操作</th>
		    </tr>
		     <tr>
			<td>温室001</td>
			<td>
			<c:if test="${irr.gh_one_irrigation_status == 0 }">关</c:if>
		    <c:if test="${irr.gh_one_irrigation_status == 1 }">开</c:if></td>
			<td>
			<c:if test="${irr.gh_one_irrigation_status == 0 }"><input type="checkbox"   name='status' />打开</c:if>
	        <c:if test="${irr.gh_one_irrigation_status == 1 }"><input type="checkbox"   name='status' />关闭</c:if>
			</td>
		    </tr>
		    <tr>
			<td>温室002</td>
			<td>
			<c:if test="${irr.gh_two_irrigation_status == 0 }">关</c:if>
		    <c:if test="${irr.gh_two_irrigation_status == 1 }">开</c:if></td>
			<td>
			<c:if test="${irr.gh_two_irrigation_status == 0 }"><input type="checkbox"   name='status' />打开</c:if>
	        <c:if test="${irr.gh_two_irrigation_status == 1 }"><input type="checkbox"   name='status' />关闭</c:if>
			</td>
		    </tr>
		    <tr>
			<td>温室 003</td>
			<td>
			<c:if test="${irr.gh_three_irrigation_status == 0 }">关</c:if>
		    <c:if test="${irr.gh_three_irrigation_status == 1 }">开</c:if></td>
			<td>
			<c:if test="${irr.gh_three_irrigation_status == 0 }"><input type="checkbox"   name='status' />打开</c:if>
	        <c:if test="${irr.gh_three_irrigation_status == 1 }"><input type="checkbox"   name='status' />关闭</c:if>
			</td>
		    </tr>
		    <tr>
			<td>温室004</td>
			<td>
			<c:if test="${irr.gh_four_irrigation_status == 0 }">关</c:if>
		    <c:if test="${irr.gh_four_irrigation_status == 1 }">开</c:if></td>
			<td>
			<c:if test="${irr.gh_four_irrigation_status == 0 }"><input type="checkbox"   name='status' />打开</c:if>
	        <c:if test="${irr.gh_four_irrigation_status == 1 }"><input type="checkbox"   name='status' />关闭</c:if>
			</td>
		    <tr>
			<td>温室 005</td>
			<td>
			<c:if test="${irr.gh_five_irrigation_status == 0 }">关</c:if>
		    <c:if test="${irr.gh_five_irrigation_status == 1 }">开</c:if></td>
			<td>
			<c:if test="${irr.gh_five_irrigation_status == 0 }"><input type="checkbox"   name='status' />打开</c:if>
	        <c:if test="${irr.gh_five_irrigation_status == 1 }"><input type="checkbox"   name='status' />关闭</c:if>
			</td>
		    </tr>
		    <tr>
			<td>温室 006</td>
			<td>
			<c:if test="${irr.gh_six_irrigation_status == 0 }">关</c:if>
		    <c:if test="${irr.gh_six_irrigation_status == 1 }">开</c:if></td>	
		    <td>
			<c:if test="${irr.gh_six_irrigation_status == 0 }"><input type="checkbox"   name='status' />打开</c:if>
	        <c:if test="${irr.gh_six_irrigation_status == 1 }"><input type="checkbox"   name='status' />关闭</c:if>
			</td>		
		    </tr>
		     <tr>
		<td class="text-center"></td>
		<td></td>
	    <td><input type="button" value="更改设备" class="btn bcm tcw"
			onclick="changeMode()"></td>
	 </tr>
		 
	 </table>
</div>
<div class="panel panel-success my-panel">
	  <!-- Default panel contents -->
	  <div class="panel-heading"><span class="glyphicon glyphicon-pushpin" style="font-size:10px"></span>&nbsp;&nbsp;灌溉控制</div>
	  <div class="panel-body">
	    <p>灌溉信息</p>
	  </div>

<!-- Table 2-->
  <table class="table table-bordered table-striped table-condensed">
    <tr>
	<th>参数</th>
	<th>数值</th>
	<th>单位</th>
    </tr>
     <tr>
	<td>EC</td>
	<td>${irr.EC}</td>
	<td>mS/cm</td>
    </tr>
     <tr>
	<td>PH</td>
	<td>${irr.PH}</td>
	<td></td>
    </tr>
     <tr>
	<td>流量</td>
	<td>${irr.flow}</td>
	<td>L/min</td>
    </tr>
     <tr>
	<td>灌溉量</td>
	<td>${irr.irrigation_amount}</td>
	<td>升</td>
    </tr>
    
   
  </table>
</div>		 

		<div id="page"></div>
		
 <script type="text/javascript"
			src="<%=request.getContextPath()%>/assets/js/jquery.min.js"></script>
<script type="text/javascript"
			src="<%=request.getContextPath()%>/assets/laypage/laypage.js"></script>
<script  type="text/javascript">

function changeMode(){
	
	var pass; 
	var base_id = $("#base_id").val();
	 
	var table =document.getElementById("table_irr");
	var rows = table.rows.length;
    
	var status = document.getElementsByName("status"); 
	//alert(status.length);
	all_status = "";
	var device_name = "";
	for (var i = 0; i < status.length; i++) {
		device_name +=  table.rows[i+1].cells[0].innerHTML  +";"; //设备名字
		 
        if (status[i].checked) {
         if(table.rows[i+1].cells[1].innerHTML.trim()=="开")	{
        	 all_status += "0;";   // 设备对应状态
         }else{
        	 all_status += "1;";   // 设备对应状态
         }
         }else{
       	 all_status += "*;";
        }
     }
 
	if(pass = prompt('请输入密码：')){
		$.post('validate_pass',{
			base_id:base_id,
			password:pass,
			all_status:all_status
		},'json')
		.done(function(data){
			if(data){
				alert('更改成功！');
				window.location.reload(); 
			}
			else{
				alert('密码错误，修改失败');
			}
		});
	}
	
	
 }
 </script>

 </body>
</html>