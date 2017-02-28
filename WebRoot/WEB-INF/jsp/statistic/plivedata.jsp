<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
	<title>温室智慧管控系统</title>
	</head>
<body>

	<div class="container-fluid">
	 
	   <div class="col-md-10 my-article">
	   		<div class="panel panel-success my-panel">
			  <!-- Default panel contents -->
			  <div class="panel-heading"><span class="glyphicon glyphicon-pushpin" style="font-size:10px"></span>&nbsp;&nbsp;温室控制</div>
			  <div class="panel-body">
			    <p>温室概览</p>
			  </div>
		
			  <!-- Table -->
			  <table class="table table-bordered table-striped table-condensed">
			    <tr>
					<th>概况</th>
					<th>温度</th>
					<th>湿度</th>
					<th>光照强度</th>
					<th>CO2浓度</th>
					<th>栽培植物</th>
					<th>定植日期</th>
					<th>灌溉</th>
					<th>控制模式</th>
			    </tr>
			     <tr>
					<td><a href="<%=request.getContextPath() %>/plus/greenhouse.jsp" class="text-success"><span class="glyphicon glyphicon-link"></span>&nbsp;&nbsp;温室 NO.1</a></td>
					<td>${gh_1.typeAndElements[0].elements[0].current_value } ${gh.typeAndElements[0].elements[0].element_unit }</td>
					<td>${gh_1.typeAndElements[0].elements[1].current_value } ${gh.typeAndElements[0].elements[1].element_unit }</td>
					<td>${gh_1.typeAndElements[0].elements[5].current_value } ${gh.typeAndElements[0].elements[5].element_unit }</td>
					<td>${gh_1.typeAndElements[0].elements[4].current_value } ${gh.typeAndElements[0].elements[4].element_unit }</td>
					<td></td>
					<td></td>
					<td></td>
					<td>设定值控制</td>
			    </tr>
			    
			     <tr>
					<td><a href="<%=request.getContextPath() %>/plus/greenhouse.jsp" class="text-success"><span class="glyphicon glyphicon-link"></span>&nbsp;&nbsp;温室 NO.2</a></td>
					<td>${gh_2.typeAndElements[0].elements[0].current_value } ${gh.typeAndElements[0].elements[0].element_unit }</td>
					<td>${gh_2.typeAndElements[0].elements[1].current_value } ${gh.typeAndElements[0].elements[1].element_unit }</td>
					<td>${gh_2.typeAndElements[0].elements[5].current_value } ${gh.typeAndElements[0].elements[5].element_unit }</td>
					<td>${gh_2.typeAndElements[0].elements[4].current_value } ${gh.typeAndElements[0].elements[4].element_unit }</td>
					<td></td>
					<td></td>
					<td></td>
					<td>设定值控制</td>
			    </tr>
			    
			     <tr>
					<td><a href="<%=request.getContextPath() %>/plus/greenhouse.jsp" class="text-success"><span class="glyphicon glyphicon-link"></span>&nbsp;&nbsp;温室 NO.3</a></td>
					<td>${gh_3.typeAndElements[0].elements[0].current_value } ${gh.typeAndElements[0].elements[0].element_unit }</td>
					<td>${gh_3.typeAndElements[0].elements[1].current_value } ${gh.typeAndElements[0].elements[1].element_unit }</td>
					<td>${gh_3.typeAndElements[0].elements[5].current_value } ${gh.typeAndElements[0].elements[5].element_unit }</td>
					<td>${gh_3.typeAndElements[0].elements[4].current_value } ${gh.typeAndElements[0].elements[4].element_unit }</td>
					<td></td>
					<td></td>
					<td></td>
					<td>设定值控制</td>
			    </tr>
			    
			     <tr>
					<td><a href="<%=request.getContextPath() %>/plus/greenhouse.jsp" class="text-success"><span class="glyphicon glyphicon-link"></span>&nbsp;&nbsp;温室 NO.4</a></td>
					<td>${gh_4.typeAndElements[0].elements[0].current_value } ${gh.typeAndElements[0].elements[0].element_unit }</td>
					<td>${gh_4.typeAndElements[0].elements[1].current_value } ${gh.typeAndElements[0].elements[1].element_unit }</td>
					<td>${gh_4.typeAndElements[0].elements[5].current_value } ${gh.typeAndElements[0].elements[5].element_unit }</td>
					<td>${gh_4.typeAndElements[0].elements[4].current_value } ${gh.typeAndElements[0].elements[4].element_unit }</td>
					<td></td>
					<td></td>
					<td></td>
					<td>设定值控制</td>
			    </tr>
			    
			     <tr>
					<td><a href="<%=request.getContextPath() %>/plus/greenhouse.jsp" class="text-success"><span class="glyphicon glyphicon-link"></span>&nbsp;&nbsp;温室 NO.5</a></td>
					<td>${gh_5.typeAndElements[0].elements[0].current_value } ${gh.typeAndElements[0].elements[0].element_unit }</td>
					<td>${gh_5.typeAndElements[0].elements[1].current_value } ${gh.typeAndElements[0].elements[1].element_unit }</td>
					<td>${gh_5.typeAndElements[0].elements[5].current_value } ${gh.typeAndElements[0].elements[5].element_unit }</td>
					<td>${gh_5.typeAndElements[0].elements[4].current_value } ${gh.typeAndElements[0].elements[4].element_unit }</td>
					<td></td>
					<td></td>
					<td></td>
					<td>智能控制</td>
			    </tr>
			    
			     <tr>
					<td><a href="<%=request.getContextPath() %>/plus/greenhouse.jsp" class="text-success"><span class="glyphicon glyphicon-link"></span>&nbsp;&nbsp;温室 NO.6</a></td>
					<td>${gh_6.typeAndElements[0].elements[0].current_value } ${gh.typeAndElements[0].elements[0].element_unit }</td>
					<td>${gh_6.typeAndElements[0].elements[1].current_value } ${gh.typeAndElements[0].elements[1].element_unit }</td>
					<td>${gh_6.typeAndElements[0].elements[5].current_value } ${gh.typeAndElements[0].elements[5].element_unit }</td>
					<td>${gh_6.typeAndElements[0].elements[4].current_value } ${gh.typeAndElements[0].elements[4].element_unit }</td>
					<td></td>
					<td></td>
					<td></td>
					<td>智能控制</td>
			    </tr>
			  </table>
			</div>
			<!-- 温度和气象控制 -->
			<div class="row">
				<div class="col-md-6">
					<div class="panel panel-success my-panel my-panel-height-360">
					  <!-- Default panel contents -->
					  <div class="panel-heading"><span class="glyphicon glyphicon-pushpin" style="font-size:10px"></span>&nbsp;&nbsp;气象信息</div>
					  <div class="panel-body">
					    <p>气象概览</p>
					  </div>
					
					  <!-- Table -->
					  <table class="table table-bordered table-striped table-condensed">
					    <tr>
						<th>参数</th>
						<th>数值</th>
						<th>单位</th>
					    </tr>
					     <tr>
						<td>空气温度</td>
						<td>${mete.air_temperature}</td>
						<td>℃</td>
					    </tr>
					    <tr>
						<td>空气湿度</td>
						<td>${mete.air_humidity}</td>
						<td>%</td>
					    </tr>
					    <tr>
						<td>CO2浓度</td>
						<td>${mete.cd_thickness}</td>
						<td>Ppm</td>
					    </tr>
					    <tr>
						<td>光照度</td>
						<td>${mete.illuminance}</td>
						<td>Lux</td>
					    </tr>
					    <tr>
						<td>风速</td>
						<td>${mete.wind_speed}</td>
						<td>米/秒</td>
					    </tr>
					    <tr>
						<td>风向</td>
						<td>${mete.wind_direction}</td>
						<td>度</td>
					    </tr>
					    <tr>
						<td>雨量</td>
						<td>${mete.rainfall}</td>
						<td></td>
					    </tr>
					  </table>
					</div>
				</div>
				<div class="col-md-6">
				<div class="panel panel-success my-panel my-panel-height-360">
				  <!-- Default panel contents -->
				  <div class="panel-heading"><span class="glyphicon glyphicon-pushpin" style="font-size:10px"></span>&nbsp;&nbsp;灌溉控制</div>
				  <!-- Table -->
				  <table class="table table-bordered table-striped table-condensed">
				    <tr>
						<th>温室</th>
						<th>状态</th>
				    </tr>
				     <tr>
					 <td>温室NO.1</td>
					 <td>
					 <c:if test="${irr.gh_one_irrigation_status == 0 }">关</c:if>
					 <c:if test="${irr.gh_one_irrigation_status == 1 }">开</c:if>
					 </td>
				    </tr>
				    <tr>
					<td>温室NO.2</td>
					<td>
					 <c:if test="${irr.gh_two_irrigation_status == 0 }">关</c:if>
					 <c:if test="${irr.gh_two_irrigation_status == 1 }">开</c:if>
					</td>
				    </tr>
				    <tr>
					<td>温室NO.3</td>
					<td><c:if test="${irr.gh_three_irrigation_status == 0 }">关</c:if>
						<c:if test="${irr.gh_three_irrigation_status == 1 }">开</c:if></td>
				    </tr>
				    <tr>
					<td>温室NO.4</td>
					<td><c:if test="${irr.gh_four_irrigation_status == 0 }">关</c:if>
						<c:if test="${irr.gh_four_irrigation_status == 1 }">开</c:if></td>
				    </tr>
				    <tr>
					<td>温室NO.5</td>
					<td><c:if test="${irr.gh_five_irrigation_status == 0 }">关</c:if>
						<c:if test="${irr.gh_five_irrigation_status == 1 }">开</c:if></td>
				    </tr>
				    <tr>
					<td>温室NO.6</td>
					<td><c:if test="${irr.gh_six_irrigation_status == 0 }">关</c:if>
						<c:if test="${irr.gh_six_irrigation_status == 1 }">开</c:if></td>
				    </tr>
				  </table>
				</div>
				</div>
			</div>
	   </div><!-- end class="col-md-10" -->
	  </div><!-- end class="row" -->
	  
	 
	</div>
	<script type="text/javascript">
	$("[name='checkbox1']").bootstrapSwitch({
		 onColor:"success",  
	     offColor:"info",  
	      size:"mini", 
	      onSwitchChange:function(event,state){  
	            if(state==true){  
	                $(this).val("1");  
	            }else{  
	                $(this).val("0");  
	            }  
	        }  
	}
			);
	
	$("[name='checkbox2']").bootstrapSwitch({
		 onColor:"success",  
	     offColor:"info",  
	      size:"mini", 
	      onSwitchChange:function(event,state){  
	            if(state==true){  
	                $(this).val("1");  
	            }else{  
	                $(this).val("0");  
	            }  
	        }  
	}
			);
	
	$("[name='checkbox3']").bootstrapSwitch({
		 onColor:"success",  
	     offColor:"info",  
	      size:"mini", 
	      onSwitchChange:function(event,state){  
	            if(state==true){  
	                $(this).val("1");  
	            }else{  
	                $(this).val("0");  
	            }  
	        }  
	}
			);
	
	$("[name='checkbox4']").bootstrapSwitch({
		 onColor:"success",  
	     offColor:"info",  
	      size:"mini", 
	      onSwitchChange:function(event,state){  
	            if(state==true){  
	                $(this).val("1");  
	            }else{  
	                $(this).val("0");  
	            }  
	        }  
	}
			);
	
	$("[name='checkbox5']").bootstrapSwitch({
		 onColor:"success",  
	     offColor:"info",  
	      size:"mini", 
	      onSwitchChange:function(event,state){  
	            if(state==true){  
	                $(this).val("1");  
	            }else{  
	                $(this).val("0");  
	            }  
	        }  
	}
			);
	
	$("[name='checkbox6']").bootstrapSwitch({
		 onColor:"success",  
	     offColor:"info",  
	      size:"mini", 
	      onSwitchChange:function(event,state){  
	            if(state==true){  
	                $(this).val("1");  
	            }else{  
	                $(this).val("0");  
	            }  
	        }  
	}
			);
	
	$("[name='checkbox1']").bootstrapSwitch({
		 onColor:"success",  
	     offColor:"info",  
	      size:"mini", 
	      onSwitchChange:function(event,state){  
	            if(state==true){  
	                $(this).val("1");  
	            }else{  
	                $(this).val("0");  
	            }  
	        }  
	}
			);
	</script>
</body>
</html>