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

<title>控制模式</title>
</head>
<body>
    <input type="hidden" id="gh_id" value='${gh.GH_id}' />
	<div style="width: 60%; margin: 20px auto;">

		<h3 class="text-center">
	<!-- 袁健炜 2017-02-28  night modify start-->	
	                           请点击选择控制模式
	<!-- 袁健炜 2017-02-28  night modify end-->
			
		<%-- 	<c:if test="${gh.control_mode eq 1}">设定值控制</c:if>
			<c:if test="${gh.control_mode eq 2}">手动控制</c:if>
			<c:if test="${gh.control_mode eq 0}">智能控制</c:if> --%>
		</h3>
		<table class="table table-bordered table-condensed">
		 	  
			<!-- 袁健炜 2017-02-28  night modify start-->	
			<tr>
			    <td class="text-center"><span style="line-height: 40px;"><a onclick="changeMode_setting()">设定值控制</a></span></td>
			    <td class="text-center"><span style="line-height: 40px;"><a onclick="changeMode_manual()">手动控制</a></span></td>
			    <td class="text-center"><span style="line-height: 40px;"><a onclick="changeMode()">智能控制</a></span></td>
			</tr>
			<!-- 袁健炜 2017-02-28  night modify end-->	
		</table>
		
		<table style="display:none;" class="table table-bordered table-condensed" id="table_device">
		    <tr>
		       <th>CO2发生器</th>
		       <th>状态</th>
		       <th>操作</th>
		    </tr>
		    <c:forEach items="${setupCons }" var="setupConId">
				<tr>
				<td>${setupConId.name }</td>
				 <td>
				     <c:if test="${setupConId.control == 0 }">关</c:if>
				     <c:if test="${setupConId.control == 1 }">开</c:if>
			    </td>
			    <td>
			        <c:if test="${setupConId.control == 0 }"><input type="checkbox" name="status" value="1" />打开</c:if>
				    <c:if test="${setupConId.control == 1 }"><input type="checkbox" name="status" value="0"/>关闭</c:if>
			    </td>
			</tr>
		  </c:forEach>
		  <tr>
			<td class="text-center"></td>
			<td></td>
		    <td><input type="button" value="更改设备" class="btn bcm tcw"
				onclick="chageModeDevice()"></td>
		 </tr>
		</table>
		
		<table style="display:none;" class="table table-bordered table-condensed" id="table_setting">
		     <c:forEach items="${ghSetting }" var="ghSettingId">
			     <tr>
		     <td style="width:50%">时段1开始时间 </td>
		     <td> <input type="text" name="one_startTime"
						onclick="laydate()" class="laydate-icon"  value="${ghSettingId.period_one_start}"/></td>
		  </tr>
		   <tr>
		     <td>时段1结束时间 </td>
		     <td> <input type="text" name="one_endTime" id="one_endTime"
					onkeyup="fill_two_startTime()"	onclick="laydate()" class="laydate-icon" value="${ghSettingId.period_one_end}" /></td>
		  </tr>
		   <tr>
		     <td>时段2开始时间 </td>
		     <td><input type="text" name="two_startTime" readOnly
				id="two_startTime"  class="laydate-icon"  value="${ghSettingId.period_two_start}"  /></td>
		  </tr>
		   <tr>
		     <td>时段2结束时间 </td>
		     <td><input type="text" name="two_endTime"  
					 	onclick="laydate()" class="laydate-icon"  value="${ghSettingId.period_two_end}"  /></td>
		  </tr>
		    <tr>
		     <td>时段3开始时间 </td>
		     <td><input type="text" name="three_startTime"
						  class="laydate-icon"  value="${ghSettingId.period_three_start}"  /></td>
		  </tr>
		   <tr>
		     <td>时段3结束时间 </td>
		     <td><input type="text" name="three_endTime"
						onclick="laydate()" class="laydate-icon"  value="${ghSettingId.period_three_end}"  /></td>
		  </tr>
		    <tr>
		     <td>时段4开始时间 </td>
		     <td><input type="text" name="four_startTime"
						  class="laydate-icon"  value="${ghSettingId.period_four_end}"  /></td>
		  </tr>
		   <tr>
		     <td>时段4结束时间 </td>
		     <td><input type="text" name="four_endTime"
						onclick="laydate()" class="laydate-icon"  value="${ghSettingId.period_four_end}"  /></td>
		  </tr>
		  
		   <tr>
		     <td>时段1 温度 </td>
		     <td> ${ghSettingId.period_one_wd }</td>
		  </tr>
		  <tr>
		     <td>时段1 湿度 </td>
		     <td>${ghSettingId.period_one_sd }</td>
		  </tr>
		  <tr>
		     <td>时段1 光照度</td>
		     <td>${ghSettingId.period_one_gzd }</td>
		  </tr>
		  <tr>
		     <td>时段1 CO2浓度</td>
		     <td>${ghSettingId.period_one_nd }</td>
		  </tr>
		  
		  <tr>
		     <td>时段2 温度 </td>
		     <td>${ghSettingId.period_two_wd }</td>
		  </tr>
		  <tr>
		     <td>时段2 湿度 </td>
		     <td>${ghSettingId.period_two_sd }</td>
		  </tr>
		  <tr>
		     <td>时段2 光照度</td>
		     <td>${ghSettingId.period_two_gzd }</td>
		  </tr>
		  <tr>
		     <td>时段2 CO2浓度</td>
		     <td>${ghSettingId.period_two_nd }</td>
		  </tr>
		   
		   
		    <tr>
		     <td>时段3 温度 </td>
		     <td>${ghSettingId.period_three_wd }</td>
		  </tr>
		  <tr>
		     <td>时段3 湿度 </td>
		     <td>${ghSettingId.period_three_sd }</td>
		  </tr>
		  <tr>
		     <td>时段3光照度</td>
		     <td>${ghSettingId.period_three_gzd }</td>
		  </tr>
		  <tr>
		     <td>时段3 CO2浓度</td>
		     <td>${ghSettingId.period_three_nd }</td>
		  </tr>
		    
		     <tr>
		     <td>时段4 温度 </td>
		     <td>${ghSettingId.period_four_wd }</td>
		  </tr>
		  <tr>
		     <td>时段4 湿度 </td>
		     <td>${ghSettingId.period_four_sd }</td>
		  </tr>
		  <tr>
		     <td>时段4 光照度</td>
		     <td>${ghSettingId.period_four_gzd }</td>
		  </tr>
		  <tr>
		     <td>时段4 CO2浓度</td>
		     <td>${ghSettingId.period_four_nd }</td>
		  </tr>
		     </c:forEach>
		 
		   <tr>
			<td class="text-center"></td>
		    <td><input type="button" value="更改设置" class="btn bcm tcw"
				onclick="chageModeDevice_seeting()"></td>
		 </tr>  
		</table>
	</div>
	<script type="text/javascript"
			src="<%=request.getContextPath()%>/assets/laydate/laydate.js"></script>
	<script type="text/javascript">
 
var current_model = '${gh.control_mode}';
function changeMode_manual(){
	var pass; 
	if(pass = prompt('请输入密码：')){
		$.post('change_mode',{
			password:pass
		},'json')
		.done(function(data){
			if(data){
				document.getElementById("table_setting").style.display='none';
				document.getElementById("table_device").style.display='';
			}
			else{
				alert('密码错误，修改失败');
			}
		});
	}
	 
	
}
/* 袁健炜 2017-2-28 night add start*/
function chageModeDevice(){
	var gh_id = $("#gh_id").val();
	var table =document.getElementById("table_device");
	var rows = table.rows.length;
 
	var status = document.getElementsByName("status"); 
	//alert(status.length);
	all_status = "";
	var device_name = "";
	for (var i = 0; i < status.length; i++) {
		device_name +=  table.rows[i+1].cells[0].innerHTML  +";"; //设备名字
        if (status[i].checked) {
       	 all_status += status[i].value +";";   // 设备对应状态
           
        }else{
       	 all_status += "*;";
        }
     }
	//alert(all_status);
	//alert(device_name);
	 
  	$.post('change_mode_device',{
  		gh_id:gh_id,
  		all_status:all_status,
  		device_name:device_name
	},'json')
	.done(function(data){
		if(data){
			alert('更改成功！');
			window.location.reload(); 
		}
		 
	}); 
	 
	
}
/* 袁健炜 2017-2-28 night add end*/

/* 袁健炜 2017-3-1 day add start*/
 function changeMode_setting(){
	var pass; 
	if(pass = prompt('请输入密码：')){
		$.post('change_mode',{
			password:pass
		},'json')
		.done(function(data){
			if(data){
				document.getElementById("table_device").style.display='none';
				document.getElementById("table_setting").style.display='';
				
			}
			else{
				alert('密码错误，修改失败');
			}
		});
	}
	 
	
}
/* 袁健炜 2017-3-1 day add end*/
 
  function fill_two_startTime(){
	alert($("input[name='one_endTime']").val());
            var one_endTime=document.getElementById("one_endTime").value;
            document.getElementById("two_startTime").value=one_endTime;
        }
  function chageModeDevice_seeting(){
	  var one_endTime=document.getElementById("one_endTime").value;
      document.getElementById("two_startTime").value=one_endTime;
  }
/*  $("input[name='one_endTime']").onBlur(function(){
	 $("input[name='two_startTime']").val($("input[name='one_endTime']").val())  ;
 });
 $("input[name='two_endTime']").onBlur(function(){
		// alert($("input[name='one_endTime']").val());
		 $("input[name='three_startTime']").val($("input[name='two_endTime']").val())  ;
	 });
 $("input[name='three_endTime']").onBlur(function(){
		// alert($("input[name='one_endTime']").val());
		 $("input[name='four_startTime']").val($("input[name='three_endTime']").val())  ;
	 }); */
</script>
</body>
</html>