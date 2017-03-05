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
<title>实时数据</title>
</head>
<body>
	<div class="w11 center-block">

		<div class="detail">
			<!-- 实时数据详情区域 -->
			<h3 class="h3" style="width:100%;background-color:#fff;padding:10px 5px;margin-bottom:-10px;">实时环境数据</h3>
			<div id="types">
				<div><!-- 取消row -->
					<c:forEach items="${gh.typeAndElements }" var="t">
						<div class="col-md-4">
							<div class="panel panel-success my-panel" style="height: 400px;">
								  <!-- Default panel contents -->
								  <div class="panel-heading"><span class="glyphicon glyphicon-pushpin" style="font-size:10px"></span>&nbsp;&nbsp;<span>${t.element_type.type }</span></div>
								  <div class="panel-body">
								  	<table class="table table-bordered table-condensed">
									  	<c:forEach items="${t.elements }" var="e">
											<tr><td>${e.element_nam }:</td><td>${e.current_value } ${e.element_unit }</td> </tr> 
										</c:forEach>
								  	</table>
								  </div>
							</div>
						</div><!-- end class="col-md-4" -->
					</c:forEach>
				
					<div class="col-md-4">
						<div class="panel panel-success my-panel" style="height: 400px;">
							  <!-- Default panel contents -->
							  <div class="panel-heading"><span class="glyphicon glyphicon-pushpin" style="font-size:10px"></span>&nbsp;&nbsp;温室控制设备</div>
							  <div class="panel-body">
								   <table class="table table-bordered table-condensed">
										<tr>
											<th>设备</th>
											<th class="text-center">状态</th>
											
										</tr>
										<c:forEach items="${setupCons }" var="setupConId">
												<tr>
												<td>${setupConId.name }</td>
												 <td>
												     <c:if test="${setupConId.control == 0 }">关</c:if>
												     <c:if test="${setupConId.control == 1 }">开</c:if>
												</td>
												</tr>
											</c:forEach>
											<c:forEach items="${cons }" var="i">
											<c:set var="con" value="${i.map }"></c:set>
											<tr>
												<td class="text-center">${con.id }</td>
												<td class="text-center"><fmt:formatDate
														value="${con.control_time }" pattern="yyyy-MM-dd HH:mm:ss" />
												</td>
												<c:forEach items="${setupCons }" var="setupConId">
													<c:set var="prop"
														value="${'eqipid'}_${setupConId.equip_id }"></c:set>
													<td><c:if test="${con[prop] == 0 }">关</c:if> <c:if
															test="${con[prop] == 1 }">开</c:if></td>
												</c:forEach>
												</tr>
											</c:forEach>
									</table>
							  </div>
						</div><!-- end panel -->
					</div>
								
					<div class="col-md-4">
						<div class="panel panel-success my-panel" style="height: 400px;">
							  <!-- Default panel contents -->
							  <div class="panel-heading"><span class="glyphicon glyphicon-pushpin" style="font-size:10px"></span>&nbsp;&nbsp;作物信息</div>
							  <div class="panel-body">
								<table class="table table-bordered table-condensed">
									<tr>
									<th>作物名称</th>
									<th class="text-center">定植日期</th>
																	
									</tr>
									<c:forEach items="${pager.list}" var="i">
									   <tr>
										<td class="text-center">${i.crop_name }</td>
										<td class="text-center">${i.crop_date }</td>
									  </tr>
									</c:forEach>
									<c:if test="${isGHmore==1}">
									<tr>
									<td>冠幅(面积)</td>
									<td>株高</td>
									<td>株高生长速率</td>
									<td>果实（直径）</td>
									<td>果实生长速率</td>
									<td>茎粗</td>
									<td>冠气温差</td>
									<td>氮</td>
									<td>磷</td>
									<td>钾</td>
									</tr>
									<tr>
									<td>${crop.crop_area}</td>
									<td>${crop.crop_height}</td>
									<td>${crop.crop_height_rate}</td>
									<td>${crop.crop_diameter}</td>
									<td>${crop.crop_fruit_rate}</td>
									<td>${crop.crop_stem_weight}</td>
									<td>${crop.crop_range_temperature}</td>
									<td>${crop.crop_nitrogen}</td>
									<td>${crop.crop_phosphorus}</td>
									<td>${crop.crop_kalium}</td>
									</tr>
									</c:if>
								</table>				   
							  </div><!-- end panel-body -->
							</div><!-- end panel -->
						</div><!-- end col-md-4 -->
					</div><!-- end row -->
			</div><!-- end class="types" -->
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
function switchStatus(devId){
	
}
function loadElements(){
	var type=$('select[name=elementType]').val();
	$.get('livedataAjax',{
		elementType:type
	},'json')
	.done(function(data){
		/* $('select[name=elementId]>option:gt(0)').remove();
		for(var i in data){
			$('select[name=elementId]').append(
				$('<option>').val(data[i]['element_id'])
				.html(data[i]['element_nam'])
			);
		} */
		for(var i in data){
			var $li = $('<li>');
			$li.append(data[i]['element_nam']+"-");
			loadData()
			$('#eles').append($li);
		}	
	});
}
function loadData(type,eleid,dom){
	//var type=$('select[name=elementType]').val();
	//var eleid=$('select[name=elementId]').val();
	$.get('livedataAjax',{
		elementType:type,
		elementId:eleid
	},'json')
	.done(function(data){
		var d = (data.list[0].map['eleid_'+eleid]);
		//$('#data').html(d);
		dom.append(d);
	});
}
</script>
	</div>

</body>
</html>