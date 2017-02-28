<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//Dth HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dth">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="refresh" content="5" />
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
<title>实时数据</title>
</head>
<body>
	<div class="w11 center-block">
		<div>
			<iframe allowtransparency="true" frameborder="0" width="100%"
				height="98" scrolling="no"
				src="http://tianqi.2345.com/plugin/widget/index.htm?s=2&z=3&t=1&v=0&d=3&bd=0&k=000000&f=000000&q=1&e=1&a=1&c=54511&w=565&h=98&align=center"></iframe>
		</div>
		<!-- 
 
	<h3 class="h3">温室基本信息</h3>
	<table class="table table-bordered table-condensed">
	<tr>
		<td>序号</td>
		<td>温室代号</td>
		<td>温室类型</td>
		<td>栽培作物</td>
		<td>操作</td>
		<%-- <c:forEach items="${i.setupCon }" var="dev">
			<th>${dev.element.element_nam }</th>
		</c:forEach> --%>
	</tr>
	<tr>	
		<td>${gh.GH_id }</td>
		<td>${gh.GH_code }</td>
		<td>	
			<c:if test="${gh.GH_type==1 }">文洛型温室</c:if>
			<c:if test="${gh.GH_type==2 }">连栋温室</c:if>
			<c:if test="${gh.GH_type==3 }">单栋温室</c:if>
			<c:if test="${gh.GH_type==4 }">日光</c:if>
			<c:if test="${gh.GH_type==0 }">其他</c:if>
		</td>
		<td>${gh.crop.crop.crop_name }</td>
		<%-- <c:forEach items="${i.setupCon }" var="dev">
			<td>${dev.element.datas.list[0].monitor_num }&nbsp;${dev.element.element_unit }</td>
		</c:forEach> --%>
		<c:if test="${me.user_type!='0'}">
		<td><a href="<%=request.getContextPath()%>/ghmgr/ghadmin/gh/detail">查看详情</a></td>
		</c:if>
		<c:if test="${me.user_type=='0'}">
			<td>没有操作权限</td>
		</c:if>
	</tr>
	</table>
 -->

		<div class="detail">
			<!-- 实时数据详情区域 -->
			<h3 class="h3">实时环境数据</h3>
			<div id="types">
				<div class="row">
					<c:forEach items="${gh.typeAndElements }" var="t">
						<div class="col-md-4">
							<div class="panel panel-default" style="height: 400px;">
								<div class="panel-heading text-center">${t.element_type.type }</div>
								<div class="panel-body">
									<c:forEach items="${t.elements }" var="e">
										<p>${e.element_nam }:${e.current_value }${e.element_unit }</p>
									</c:forEach>
								</div>
							</div>
						</div>
					</c:forEach>

					<div class="col-md-4">
						<div class="panel panel-default" style="height: 400px;">
							<div class="panel-heading text-center">
								<h3 class="h3">机构状态</h3>
							</div>
							<div class="panel-body">
								<table class="table table-bordered table-condensed">
									<tr>
										<th>机构名称</th>
										<th class="text-center">状态</th>
										<c:forEach items="${setupCons }" var="setupConId">
											<th>${setupConId.name }</th>
										</c:forEach>
									</tr>
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
						</div>
						<!-- end class="panel" -->
					</div>
				</div>
			</div>
			<!-- end class="types" -->

			<div>
				数值:<span id="data"></span>
			</div>

			<!-- 设备状态 -->


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