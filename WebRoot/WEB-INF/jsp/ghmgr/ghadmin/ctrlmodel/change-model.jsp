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
<title>控制模式</title>
</head>
<body>
    <input type="hidden" id="gh_id" value='${gh.GH_id}' />
 
<%-- 	<div style="width: 60%; margin: 20px auto;">

<!-- 		<h3 class="text-center">
	袁健炜 2017-02-28  night modify start	
	                           请点击选择控制模式
	袁健炜 2017-02-28  night modify end
	 
		</h3> -->
		<table class="table table-bordered table-condensed">
		 	  
			<!-- 袁健炜 2017-02-28  night modify start-->	
			<tr>
			    <td class="text-center"><span style="line-height: 40px;"><a onclick="changeMode_setting()">设定值控制</a></span></td>
			    <td class="text-center"><span style="line-height: 40px;"><a onclick="changeMode_manual()">手动控制</a></span></td>
			    <td class="text-center"><span style="line-height: 40px;"><a onclick="changeMode_intellgence()">智能控制</a></span></td>
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
		      
			     <tr>
		     <td style="width:50%">时段1开始时间 </td>
		     <td> <input type="text" name="one_startTime" id="one_startTime"
						onclick="laydate()" class="laydate-icon"  value="${ghSetting[0].period_one_start}"/></td>
		  </tr>
		   <tr>
		     <td>时段1结束时间 </td>
		     <td> <input type="text" name="one_endTime" id="one_endTime"
					onkeyup="fill_two_startTime()"	onclick="laydate()" class="laydate-icon" value="${ghSetting[0].period_one_end}" /></td>
		  </tr>
		   <tr>
		     <td>时段2开始时间 </td>
		     <td><input type="text" name="two_startTime" readOnly
				id="two_startTime"  class="laydate-icon"  value="${ghSetting[0].period_two_start}"  /></td>
		  </tr>
		   <tr>
		     <td>时段2结束时间 </td>
		     <td><input type="text" name="two_endTime"  
				id="two_endTime"	 	onclick="laydate()" class="laydate-icon"  value="${ghSetting[0].period_two_end}"  /></td>
		  </tr>
		    <tr>
		     <td>时段3开始时间 </td>
		     <td><input type="text" name="three_startTime"
					id="three_startTime"	  class="laydate-icon"  value="${ghSetting[0].period_three_start}"  /></td>
		  </tr>
		   <tr>
		     <td>时段3结束时间 </td>
		     <td><input type="text" name="three_endTime"
				id="three_endTime"		onclick="laydate()" class="laydate-icon"  value="${ghSetting[0].period_three_end}"  /></td>
		  </tr>
		    <tr>
		     <td>时段4开始时间 </td>
		     <td><input type="text" name="four_startTime"
					id="four_startTime"	  class="laydate-icon"  value="${ghSetting[0].period_four_end}"  /></td>
		  </tr>
		   <tr>
		     <td>时段4结束时间 </td>
		     <td><input type="text" name="four_endTime"
					id="four_endTime"	onclick="laydate()" class="laydate-icon"  value="${ghSetting[0].period_four_end}"  /></td>
		  </tr>
		  
		   <tr>
		     <td>时段1 温度 </td>
		     <td><input  id="one_period_wd" value="${ghSetting[0].period_one_wd }"/></td>
		  </tr>
		  <tr>
		     <td>时段1 湿度 </td>
		     <td><input id="one_period_sd" value="${ghSetting[0].period_one_sd }"/></td>
		  </tr>
		  <tr>
		     <td>时段1 光照度</td>
		     <td><input id="one_period_gzd" value="${ghSetting[0].period_one_gzd }"/></td>
		  </tr>
		  <tr>
		     <td>时段1 CO2浓度</td>
		     <td><input id="one_period_nd" value="${ghSetting[0].period_one_nd }"/></td>
		  </tr>
		  
		  <tr>
		     <td>时段2 温度 </td>
		     <td><input id="two_period_wd" value="${ghSetting[0].period_two_wd }"/></td>
		  </tr>
		  <tr>
		     <td>时段2 湿度 </td>
		     <td><input id="two_period_sd" value="${ghSetting[0].period_two_sd }"/></td>
		  </tr>
		  <tr>
		     <td>时段2 光照度</td>
		     <td><input id="two_period_gzd" value="${ghSetting[0].period_two_gzd }"/></td>
		  </tr>
		  <tr>
		     <td>时段2 CO2浓度</td>
		     <td><input id="two_period_nd" value="${ghSetting[0].period_two_nd }"/></td>
		  </tr>
		   
		   
		    <tr>
		     <td>时段3 温度 </td>
		     <td><input id="three_period_wd" value="${ghSetting[0].period_three_wd }"/></td>
		  </tr>
		  <tr>
		     <td>时段3 湿度 </td>
		     <td><input  id="three_period_sd"  value="${ghSetting[0].period_three_sd }"/></td>
		  </tr>
		  <tr>
		     <td>时段3光照度</td>
		     <td><input  id="three_period_gzd" value="${ghSetting[0].period_three_gzd }"/></td>
		  </tr>
		  <tr>
		     <td>时段3 CO2浓度</td>
		     <td><input  id="three_period_nd" value="${ghSetting[0].period_three_nd }"/></td>
		  </tr>
		    
		     <tr>
		     <td>时段4 温度 </td>
		     <td><input  id="four_period_wd" value="${ghSetting[0].period_four_wd }"/></td>
		  </tr>
		  <tr>
		     <td>时段4 湿度 </td>
		     <td><input id="four_period_sd" value="${ghSetting[0].period_four_sd }"/></td>
		  </tr>
		  <tr>
		     <td>时段4 光照度</td>
		     <td><input id="four_period_gzd" value="${ghSetting[0].period_four_gzd }"/></td>
		  </tr>
		  <tr>
		     <td>时段4 CO2浓度</td>
		     <td><input id="four_period_nd" value="${ghSetting[0].period_four_nd }"/></td>
		  </tr>
		      
		 
		   <tr>
			<td class="text-center"></td>
		    <td><input type="button" value="更改设置" class="btn bcm tcw"
				onclick="chageModesetting()"></td>
		 </tr>  
		</table>
	</div> --%>
 
    <h3 class="h3" style="width:100%;background-color:#fff;padding:10px 5px;margin-bottom:-10px;">
	<!-- 袁健炜 2017-02-28  night modify start-->	
	                           请点击选择控制模式
	<!-- 袁健炜 2017-02-28  night modify end-->
	</h3>
    <div class="container-fluid">
	  <div class="row">
		<div class="panel panel-success my-panel">
		  <!-- Default panel contents -->
		  <div class="panel-heading"><span class="glyphicon glyphicon-pushpin" style="font-size:10px"></span>&nbsp;&nbsp;温室控制</div>
		  <div class="panel-body">
				<div style="width: 60%; margin: 20px auto;">
						
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
		  </div><!--end panel-body-->
		</div><!--end panel-->
	  </div><!--end row-->
	</div><!-- container-fluid-->
>>>>>>> 43fb71d9a41adcff7621a05544528c589ab81e7a
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

function changeMode_intellgence(){
	var pass; 
	var ghid = $("#gh_id").val();
	if(pass = prompt('请输入密码：')){
		$.post('change_mode_intellgece',{
			ghid:ghid,
			password:pass
		},'json')
		.done(function(data){
			if(data){
				document.getElementById("table_setting").style.display='none';
				document.getElementById("table_device").style.display='none';z
			}
			else{
				alert('密码错误');
				
			}
		});
	}
	 
	
}
/* 袁健炜 2017-2-28 night add start  */
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

function chageModesetting(){
	  var gh_id = $("#gh_id").val();
      var update_value = "";
      var one_startTime = $("#one_startTime").val();
      var one_endTime = $("#one_endTime").val();
      var one_period_wd = $("#one_period_wd ").val();
      var one_period_sd = $("#one_period_sd ").val();
      var one_period_gzd = $("#one_period_gzd ").val();
      var one_period_nd = $("#one_period_nd ").val();
      update_value += one_startTime+";"+one_endTime+";"+one_period_wd+";"+one_period_sd+";"+one_period_gzd+";"+one_period_nd+"&&&";
    //  alert(update_value);
     
     var two_startTime = $("#two_startTime").val();
      var two_endTime = $("#two_endTime").val();
      var two_period_wd = $("#two_period_wd ").val();
      var two_period_sd = $("#two_period_sd ").val();
      var two_period_gzd = $("#two_period_gzd ").val();
      var two_period_nd = $("#two_period_nd ").val();
      update_value += two_startTime+";"+two_endTime+";"+two_period_wd+";"+two_period_sd+";"+two_period_gzd+";"+two_period_nd+"&&&";
      //alert(two_startTime+";"+two_endTime+";"+two_period_wd+";"+two_period_sd+";"+two_period_gzd+";"+two_period_nd);
      var three_startTime = $("#three_startTime").val();
      var three_endTime = $("#three_endTime").val();
      var three_period_wd = $("#three_period_wd ").val();
      var three_period_sd = $("#three_period_sd ").val();
      var three_period_gzd = $("#three_period_gzd ").val();
      var three_period_nd = $("#three_period_nd ").val();
      update_value += three_startTime+";"+three_endTime+";"+three_period_wd+";"+three_period_sd+";"+three_period_gzd+";"+three_period_nd+"&&&";
      //alert(three_startTime+";"+three_endTime+";"+three_period_wd+";"+three_period_sd+";"+three_period_gzd+";"+three_period_nd);
     
      var four_startTime = $("#four_startTime").val();
      var four_endTime = $("#four_endTime").val();
      var four_period_wd = $("#four_period_wd ").val();
      var four_period_sd = $("#four_period_sd ").val();
      var four_period_gzd = $("#four_period_gzd ").val();
      var four_period_nd = $("#four_period_nd ").val();
      update_value += four_startTime+";"+four_endTime+";"+four_period_wd+";"+four_period_sd+";"+four_period_gzd+";"+four_period_nd;
  	 // alert(four_startTime+";"+four_endTime+";"+four_period_wd+";"+four_period_sd+";"+four_period_gzd+";"+four_period_nd);
     
  	  $.post('change_mode_setting',{
  		gh_id:gh_id,
  		update_value:update_value
	},'json')
	.done(function(data){
		if(data){
			alert('更改成功！');
			window.location.reload(); 
		}
		 
	}); 
  
 }
/* 袁健炜 2017-3-1 day add end*/
 
  
/*  
   function fill_two_startTime(){
	alert($("input[name='one_endTime']").val());
            var one_endTime=document.getElementById("one_endTime").value;
            document.getElementById("two_startTime").value=one_endTime;
        }
 $("input[name='one_endTime']").onBlur(function(){
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