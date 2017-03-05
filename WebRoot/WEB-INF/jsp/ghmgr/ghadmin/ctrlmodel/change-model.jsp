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
    <h3 class="h3" style="width:100%;background-color:#fff;padding:10px 5px;margin-bottom:-10px;">
	<!-- 袁健炜 2017-02-28  night modify start-->	
	                           请点击选择控制模式：<span style="font-size:18px;color:red;">替换文字--当前控制模式</span>
	<!-- 袁健炜 2017-02-28  night modify end-->
	</h3>
	
    <div class="container-fluid">
	  <div class="row">
		<div class="panel panel-success my-panel">
		  <!-- Default panel contents -->
		  <div class="panel-heading"><span class="glyphicon glyphicon-pushpin" style="font-size:10px"></span>&nbsp;&nbsp;温室控制</div>
		  <div class="panel-body">
				<div style="width: 60%; margin: 20px auto;">
						
					<table class="table">
					 	  
						<!-- 袁健炜 2017-02-28  night modify start-->	
						<tr>
						    <td class="text-center">
						    	<span style="line-height: 40px;">
							    <!-- <a onclick="changeMode_setting()" class="btn bg-success text-muted">设定值控制</a> -->
							    <!-- Button trigger modal -->
									<button type="button" class="btn bg-success bg-sm" data-toggle="modal" data-target="#settingModal">
										  设定值控制
									</button>
							    </span>
						    </td>
						    <td class="text-center"><span style="line-height: 40px;">
						    <!-- <a onclick="changeMode_manual()" class="btn bg-success text-muted">手动控制</a> -->
							    <button type="button" class="btn bg-success bg-sm" data-toggle="modal" data-target="#handModal">
										  手动控制
								</button>
						    </span>
						    </td>
						    <td class="text-center"><span style="line-height: 40px;"><a href="<%=request.getContextPath()%>/stat/livedata" class="btn bg-success text-muted">智能控制</a></span></td>
						</tr>
						<!-- 袁健炜 2017-02-28  night modify end-->	
					</table>					
				</div>		    
		  </div><!--end panel-body-->
		</div><!--end panel-->
		
		<div class="panel panel-success my-panel" style="display:none;" id="table_device" >
		  <!-- Default panel contents -->
		  <div class="panel-heading"><span class="glyphicon glyphicon-pushpin" style="font-size:10px"></span>&nbsp;&nbsp;手动控制</div>
		  <div class="panel-body">
		     <!-- Table -->	
			<table class="table table-bordered table-condensed">
			    <tr>
			       <th>设备</th>
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
			    <td colspan="3"><input type="button" value="更改控制" class="btn bg-success text-muted" style="width:200px;"
					onclick="chageModeDevice()"></td>
			 </tr>
			</table>
		  </div><!--end panel-body-->
		</div><!--end panel-->
		
		<div class="panel panel-success my-panel" style="display:none;" id="table_setting">
		  <!-- Default panel contents -->
		  <div class="panel-heading"><span class="glyphicon glyphicon-pushpin" style="font-size:10px"></span>&nbsp;&nbsp;设定值测控</div>
		  <div class="panel-body">
		     <!-- Table -->
			  <table class="table table-bordered table-striped table-condensed">
			    <tr>
			    	<th>时间区间</th>
					<th>开始时间</th>
					<th>结束时间</th>
					<th>温度</th>
					<th>湿度</th>
					<th>光照度</th>
					<th>CO2浓度</th>
			    </tr>
			     <tr>
			     	<td>时段1</td>
					<td>
					 <select name="one_startTime" id="one_startTime"  style="width:120px">
					     <c:forEach var="i" begin="0" end="23" varStatus="status"
					     >
					        <c:if test="${status.index<10}">
					           <c:if test="${ghSetting[0].period_one_start == status.index}"><option selected>0${status.index}</option></c:if> 
					           <c:if test="${ghSetting[0].period_one_start != status.index}"><option >0${status.index}</option></c:if> 
					        </c:if>
					         <c:if test="${status.index >= 10}">
					          <c:if test="${ghSetting[0].period_one_start == status.index}"><option selected>${status.index}</option></c:if> 
					           <c:if test="${ghSetting[0].period_one_start != status.index}"><option >${status.index}</option></c:if> 
					        </c:if>
					     </c:forEach>
					    </select>
					</td>
					<td>
					  <select name="one_endTime" id="one_endTime"  style="width:120px" onchange="fill_two_startTime()">
					     <c:forEach var="i" begin="0" end="23" varStatus="status"
					     >
					        <c:if test="${status.index<10}">
					           <c:if test="${ghSetting[0].period_one_end == status.index}"><option selected>0${status.index}</option></c:if> 
					           <c:if test="${ghSetting[0].period_one_end != status.index}"><option >0${status.index}</option></c:if> 
					        </c:if>
					         <c:if test="${status.index >= 10}">
					          <c:if test="${ghSetting[0].period_one_end == status.index}"><option selected>${status.index}</option></c:if> 
					           <c:if test="${ghSetting[0].period_one_end != status.index}"><option >${status.index}</option></c:if> 
					        </c:if>
					       
					     
					     </c:forEach>
					     </select> 
					</td>
					<td>
						<input  id="one_period_wd" value="${ghSetting[0].period_one_wd }"/>
					</td>
					<td>
						<input id="one_period_sd" value="${ghSetting[0].period_one_sd }"/>
					</td>
					<td>
						<input id="one_period_gzd" value="${ghSetting[0].period_one_gzd }"/>
					</td>
					<td>
						<input id="one_period_nd" value="${ghSetting[0].period_one_nd }"/>
					</td>
			    </tr>
			    <tr>
			     	<td>时段2</td>
					<td>
					  <select name="two_startTime" id="two_startTime"  style="width:120px;" disabled="disabled">
					     <c:forEach var="i" begin="0" end="23" varStatus="status"
					     >
						<c:if test="${status.index<10}">
						   <c:if test="${ghSetting[0].period_two_start == status.index}"><option selected>0${status.index}</option></c:if> 
						   <c:if test="${ghSetting[0].period_two_start != status.index}"><option >0${status.index}</option></c:if> 
						</c:if>
						 <c:if test="${status.index >= 10}">
						  <c:if test="${ghSetting[0].period_two_start == status.index}"><option selected>${status.index}</option></c:if> 
						   <c:if test="${ghSetting[0].period_two_start != status.index}"><option >${status.index}</option></c:if> 
						</c:if>
					       
					     
					     </c:forEach>
					     </select> 
					</td>
					<td>
					  <select name="two_endTime" id="two_endTime"  style="width:120px"  onchange="fill_three_startTime()">
					     <c:forEach var="i" begin="0" end="23" varStatus="status"
					     >
						<c:if test="${status.index<10}">
						   <c:if test="${ghSetting[0].period_two_end == status.index}"><option selected>0${status.index}</option></c:if> 
						   <c:if test="${ghSetting[0].period_two_end != status.index}"><option >0${status.index}</option></c:if> 
						</c:if>
						 <c:if test="${status.index >= 10}">
						  <c:if test="${ghSetting[0].period_two_end == status.index}"><option selected>${status.index}</option></c:if> 
						   <c:if test="${ghSetting[0].period_two_end != status.index}"><option >${status.index}</option></c:if> 
						</c:if>
					       
					     
					     </c:forEach>
					     </select> 
					</td>
					<td>
						<input id="two_period_wd" value="${ghSetting[0].period_two_wd }"/>
					</td>
					<td>
						<input id="two_period_sd" value="${ghSetting[0].period_two_sd }"/>
					</td>
					<td>
						<input id="two_period_gzd" value="${ghSetting[0].period_two_gzd }"/>
					</td>
					<td>
						<input id="two_period_nd" value="${ghSetting[0].period_two_nd }"/>
					</td>
			    </tr>
			    <tr>
			     	<td>时段3</td>
					<td>
					 <select name="three_startTime" id="three_startTime"  style="width:120px"  disabled="disabled">
				     <c:forEach var="i" begin="0" end="23" varStatus="status"
				     >
					<c:if test="${status.index<10}">
					   <c:if test="${ghSetting[0].period_three_start == status.index}"><option selected>0${status.index}</option></c:if> 
					   <c:if test="${ghSetting[0].period_three_start != status.index}"><option >0${status.index}</option></c:if> 
					</c:if>
					 <c:if test="${status.index >= 10}">
					  <c:if test="${ghSetting[0].period_three_start == status.index}"><option selected>${status.index}</option></c:if> 
					   <c:if test="${ghSetting[0].period_three_start != status.index}"><option >${status.index}</option></c:if> 
					</c:if>
				       
				     
				     </c:forEach>
				     </select> 
					</td>
					<td>
					  <select name="three_endTime" id="three_endTime"  style="width:120px"  onchange="fill_four_startTime()">
					     <c:forEach var="i" begin="0" end="23" varStatus="status"
					     >
						<c:if test="${status.index<10}">
						   <c:if test="${ghSetting[0].period_three_end == status.index}"><option selected>0${status.index}</option></c:if> 
						   <c:if test="${ghSetting[0].period_three_end != status.index}"><option >0${status.index}</option></c:if> 
						</c:if>
						 <c:if test="${status.index >= 10}">
						  <c:if test="${ghSetting[0].period_three_end == status.index}"><option selected>${status.index}</option></c:if> 
						   <c:if test="${ghSetting[0].period_three_end != status.index}"><option >${status.index}</option></c:if> 
						</c:if>
					       
					     
					     </c:forEach>
					     </select> 
					</td>
					<td>
						<input  id="three_period_wd" value="${ghSetting[0].period_three_wd }"/>
					</td>
					<td>
						<input id="three_period_sd" value="${ghSetting[0].period_three_sd }"/>
					</td>
					<td>
						<input id="three_period_gzd" value="${ghSetting[0].period_three_gzd }"/>
					</td>
					<td>
						<input id="three_period_nd" value="${ghSetting[0].period_three_nd }"/>
					</td>
			    </tr>
			    <tr>
			     	<td>时段4</td>
					<td>
					 <select name="four_startTime" id="four_startTime"  style="width:120px"  disabled="disabled">
					     <c:forEach var="i" begin="0" end="23" varStatus="status"
					     >
						<c:if test="${status.index<10}">
						   <c:if test="${ghSetting[0].period_four_end == status.index}"><option selected>0${status.index}</option></c:if> 
						   <c:if test="${ghSetting[0].period_four_end != status.index}"><option >0${status.index}</option></c:if> 
						</c:if>
						 <c:if test="${status.index >= 10}">
						  <c:if test="${ghSetting[0].period_four_end == status.index}"><option selected>${status.index}</option></c:if> 
						   <c:if test="${ghSetting[0].period_four_end != status.index}"><option >${status.index}</option></c:if> 
						</c:if>
					     </c:forEach>
					     </select> 
					</td>
					<td>
					  <select name="four_endTime" id="four_endTime"  style="width:120px">
					     <c:forEach var="i" begin="0" end="23" varStatus="status"
					     >
						<c:if test="${status.index<10}">
						   <c:if test="${ghSetting[0].period_four_end == status.index}"><option selected>0${status.index}</option></c:if> 
						   <c:if test="${ghSetting[0].period_four_end != status.index}"><option >0${status.index}</option></c:if> 
						</c:if>
						 <c:if test="${status.index >= 10}">
						  <c:if test="${ghSetting[0].period_four_end == status.index}"><option selected>${status.index}</option></c:if> 
						   <c:if test="${ghSetting[0].period_four_end != status.index}"><option >${status.index}</option></c:if> 
						</c:if>
					       
					     
					     </c:forEach>
					     </select> 
					</td>
					<td>
						<input  id="four_period_wd" value="${ghSetting[0].period_four_wd }"/>
					</td>
					<td>
						<input id="four_period_sd" value="${ghSetting[0].period_four_sd }"/>
					</td>
					<td>
						<input id="four_period_gzd" value="${ghSetting[0].period_four_gzd }"/>
					</td>
					<td>
						<input id="four_period_nd" value="${ghSetting[0].period_four_nd }"/>
					</td>
			    </tr>
			    <tr>
			    	<td colspan="7"><input type="button" value="更改设置" class="btn bg-success" style="width:100px;"
					onclick="chageModesetting()"></td>
			    </tr>
			  </table>
		  </div><!--end panel-body-->
		</div><!--end panel-->
	  </div><!--end row-->
	</div><!-- container-fluid-->
 
 <!-- 模态框组件，用户输入密码  申仕杰-->
 <!-- 设定值控制模式 -->
 <!-- Modal -->
<div class="modal fade" id="settingModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h3 class="modal-title" id="myModalLabel">请输入<span class="text-danger">设定值控制</span>密码</h3>
      </div>
      <div class="modal-body">
        <div class="input-group" style="width:100%">
        	<form action="">
        	 	<input type="password" class="form-control" placeholder="设定值控制密码" aria-describedby="sizing-addon2">
        	</form>
		</div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
        <button type="button" class="btn bg-sussess">提交</button>
      </div>
    </div>
  </div>
</div>
 
  <!-- 手动控制模式 -->
 <!-- Modal -->
<div class="modal fade" id="handModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h3 class="modal-title" id="myModalLabel">请输入<span class="text-danger">手动控制</span>密码</h3>
      </div>
      <div class="modal-body">
        <div class="input-group" style="width:100%">
        	<form action="">
        	 	<input type="password" class="form-control" placeholder="手动控制密码" aria-describedby="sizing-addon2">
        	</form>
		</div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
        <button type="button" class="btn bg-sussess">提交</button>
      </div>
    </div>
  </div>
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
				document.getElementById("table_device").style.display='none';
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
      var one_startTime = $("#one_startTime option:selected").val(); 
      var one_endTime = $("#one_endTime option:selected").val(); 
      var one_period_wd = $("#one_period_wd ").val();
      var one_period_sd = $("#one_period_sd ").val();
      var one_period_gzd = $("#one_period_gzd ").val();
      var one_period_nd = $("#one_period_nd ").val();
      update_value += one_startTime+";"+one_endTime+";"+one_period_wd+";"+one_period_sd+";"+one_period_gzd+";"+one_period_nd+"&&&";
      
      var two_startTime = $("#two_startTime option:selected").val(); 
      var two_endTime = $("#two_endTime option:selected").val(); 
      var two_period_wd = $("#two_period_wd ").val();
      var two_period_sd = $("#two_period_sd ").val();
      var two_period_gzd = $("#two_period_gzd ").val();
      var two_period_nd = $("#two_period_nd ").val();
      update_value += two_startTime+";"+two_endTime+";"+two_period_wd+";"+two_period_sd+";"+two_period_gzd+";"+two_period_nd+"&&&";
     
      var three_startTime = $("#three_startTime option:selected").val(); 
      var three_endTime = $("#three_endTime option:selected").val(); 
      var three_period_wd = $("#three_period_wd ").val();
      var three_period_sd = $("#three_period_sd ").val();
      var three_period_gzd = $("#three_period_gzd ").val();
      var three_period_nd = $("#three_period_nd ").val();
      update_value += three_startTime+";"+three_endTime+";"+three_period_wd+";"+three_period_sd+";"+three_period_gzd+";"+three_period_nd+"&&&";
    
      var four_startTime = $("#four_startTime option:selected").val(); 
      var four_endTime = $("#four_endTime option:selected").val();
      var four_period_wd = $("#four_period_wd ").val();
      var four_period_sd = $("#four_period_sd ").val();
      var four_period_gzd = $("#four_period_gzd ").val();
      var four_period_nd = $("#four_period_nd ").val();
      update_value += four_startTime+";"+four_endTime+";"+four_period_wd+";"+four_period_sd+";"+four_period_gzd+";"+four_period_nd;
     
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
 function fill_two_startTime(){
	   var one_endTime=document.getElementById("one_endTime").value;
       document.getElementById("two_startTime").value=one_endTime;
        }
function fill_three_startTime(){
	   var two_endTime=document.getElementById("two_endTime").value;
     document.getElementById("three_startTime").value=two_endTime;
      }
function fill_four_startTime(){
	   var three_endTime=document.getElementById("three_endTime").value;
   document.getElementById("four_startTime").value=three_endTime;
    }
 
	 
</script>

</body>
</html>