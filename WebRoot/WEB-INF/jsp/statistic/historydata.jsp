<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
	<title>历史数据</title>
</head>
<body>
	<div class="w11 center-block">
		<!-- 历史数据查询 -->
		<h3 class="h3" style="width:100%;background-color:#fff;padding:10px 5px;margin-bottom:-10px;">历史数据</h3>
		<form action="" method="post" id="queryform">
			<div class="container-fluid">
				<div class="row">
					<div class="panel panel-success my-panel">
						  <!-- Default panel contents -->
						  <div class="panel-heading"><span class="glyphicon glyphicon-pushpin" style="font-size:10px"></span>&nbsp;&nbsp;选择检测元素，查看历史数据</div>
						  <div class="panel-body">
						    <table class="table table-bordered table-condensed">
								<tr>
									<td>选择类型 <select name="elementType" style="width:100px"
										onchange="$('#queryform').submit();">
											<option value=""></option>
											<c:forEach items="${types }" var="i">
												<option
													<c:if test="${elementType eq  i.id}">selected="selected"</c:if>
													value="${i.id }">${i.type }</option>
											</c:forEach>
									</select>
									</td>
									<td>选择元素： <select name="elementId" style="width:100px"
										onchange="$('#queryform').submit();">
											<option value=""></option>
											<c:forEach items="${eles }" var="i">
												<option
													<c:if test="${elementId eq  i.element_id}">selected="selected"</c:if>
													value="${i.element_id }">${i.element_nam }</option>
											</c:forEach>
									</select>
									</td>
									<td>开始时间： <input type="text" name="startTime"
										onclick="laydate()" class="laydate-icon" value="${startTime }" />
									</td>
									<td>结束时间： <input type="text" name="endTime"
										onclick="laydate()" class="laydate-icon" value="${endTime }" />
									</td>
									<td>
										<button class="btn bcm tcw" style="background:#121A2C;padding:2px 5px;color:#fff;font-size:8px;">开始查找</button>
									</td>
								</tr>
							</table>
							
							<!-- 筛选结果 -->
							<table class="table table-bordered table-condensed">
								<caption></caption>
								<tr>
									<td class="text-center">序号</td>
									<td class="text-center">检测时间</td>
									<c:forEach items="${eles }" var="ele">
										<td class="text-center">${ele.element_nam }</td>
									</c:forEach>
								</tr>
								<c:forEach items="${mons.list }" var="i">
									<c:set var="mon" value="${i.map }"></c:set>
									<tr>
										<td class="text-center">${mon.id }</td>
										<td class="text-center"><fmt:formatDate
												value="${mon.control_time }" pattern="yyyy-MM-dd HH:mm:ss" /></td>
										<c:forEach items="${eles }" var="ele">
											<c:set var="prop" value="${'eleid'}_${ele.element_id }"></c:set>
											<td>${mon[prop] }</td>
					
										</c:forEach>
									</tr>
								</c:forEach>
							</table>
							
								<!-- js 数据显示 -->
								<hr style="background:#121A2C;color:#121A2C;height:1px;"/>
								<div id="page"></div>
								<div id="charts" style="width: 100%; margin-left: 5%;"></div>
						  </div><!-- end panel-body -->
					</div><!-- end panel -->
				</div><!-- end row -->
			</div><!-- end container-fluid -->
		</form>
		<!-- 
<select>
	<option>列表模式</option>
	<option>图表模式</option>
</select>
<button>导出Excel</button> -->
		<script type="text/javascript"
			src="<%=request.getContextPath()%>/assets/js/jquery.min.js"></script>
		<script type="text/javascript"
			src="<%=request.getContextPath()%>/assets/laypage/laypage.js"></script>
		<script type="text/javascript"
			src="<%=request.getContextPath()%>/assets/laydate/laydate.js"></script>
		<script type="text/javascript"
			src="<%=request.getContextPath()%>/assets/highcharts/js/highcharts.js"></script>
		<script type="text/javascript">
function formatDate(time){
	return time.getFullYear()+'-'+(time.getMonth()+1)+'-'+time.getDate()+' '+time.getHours()+':'+time.getMinutes();
}

function renderHighCharts(id,categories,data,title){
/* 	var categories=[],data=[];
	for(var i in rawdata){
		categories.push(formatDate(new Date(rawdata[i]['monitor_time'])));
		data.push(rawdata[i]['monitor_num']);
	} */
	$('#'+id).highcharts({
        chart: {
            type: 'column',
            margin: [ 50, 50, 100, 80]
        },
        title: {
            text: title
        },
        xAxis: {
            categories: categories,
            labels: {
                rotation: -45,
                align: 'right',
                style: {
                    fontSize: '13px',
                    fontFamily: 'Verdana, sans-serif'
                }
            }
        },
        yAxis: {
            min: 0,
            title: {
                text: '检测数据'
            }
        },
        legend: {
            enabled: false
        },
        tooltip: {
            pointFormat: '检测数据：<b>{point.y:.1f}</b>',
        },
        series: [{
            name: 'Population',
            data: data,
            dataLabels: {
                enabled: true,
                rotation: -90,
                color: '#FFFFFF',
                align: 'right',
                x: 4,
                y: 10,
                style: {
                    fontSize: '13px',
                    fontFamily: '黑体',
                    textShadow: '0 0 3px black'
                }
            }
        }]
    });
}
function processRawdata(rawdata){
	var eleName = 'eleid_${elementId}';
	var categories=[],data=[];
	for (var i in rawdata){
		var d = rawdata[i];
		categories.push(formatDate(new Date(d['map']['control_time'])));
		var num = d['map'][eleName];
		data.push((num instanceof Number)?num:parseFloat(d['map'][eleName]));
	}
	
	return [categories,data];
}
$(function(){
		laypage({
	    cont: 'page',
	    pages: '${data.datas.pageCount}', 
	    curr: '${data.datas.pageNumber}', 
	    jump: function(e, first){ 
	        if(!first){ 
	            location.href = '?ps=${data.datas.pageSize}&pn='+e.curr;
	        }
	    }
	});
	
	var rawdata = ${jsonData};
	var processed = processRawdata(rawdata);
	console.log(processed)
	renderHighCharts('charts',processed[0],processed[1],'检测数据柱状图');
})
</script>
	</div>
</body>
</html>