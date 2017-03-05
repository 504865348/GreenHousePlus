<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="sidebar-nav">
<%-- 	<a href="<%=request.getContextPath() %>/plus/plus.jsp" class="my-nav-header" style="border-bottom:1px solid #ccc;"><span class="glyphicon glyphicon-home"></span>&nbsp;&nbsp;总览</a>
	
	<a href="#gh-menu1" class="my-nav-header" data-toggle="collapse"><span class="icon-th iconSpan"></span>&nbsp;&nbsp;温室&nbsp;&nbsp;NO.1</a>
	<ul id="gh-menu1" class="nav nav-list collapse  in">
		<li><a href="<%=request.getContextPath() %>/plus/realtime.jsp" target="_self"><span class="glyphicon glyphicon-stats"></span>&nbsp;&nbsp;实时信息&nbsp;&nbsp;&nbsp;&nbsp;</a></li>
		<li><a href="<%=request.getContextPath() %>/plus/history.jsp" target="_self"><span class="glyphicon glyphicon-time"></span>&nbsp;&nbsp;历史数据&nbsp;&nbsp;&nbsp;&nbsp;</a></li>
		<li><a href="<%=request.getContextPath() %>/plus/setting.jsp" target="_self"><span class="glyphicon glyphicon-cog"></span>&nbsp;&nbsp;参数设定&nbsp;&nbsp;&nbsp;&nbsp;</a></li>
	</ul>
	 --%>
	<a href="<%=request.getContextPath()%>/stat/livedata" class="my-nav-header" style="border-bottom:1px solid #ccc;" target="main"><span class="glyphicon glyphicon-home"></span>&nbsp;&nbsp;主页</a>
<%-- 	<a href="<%=request.getContextPath()%>/stat/irrigation" class="my-nav-header" style="border-bottom:1px solid #ccc;" target="main" ><span class="glyphicon glyphicon-tint"></span>&nbsp;&nbsp;灌溉系统</a> --%>
						<!-- 袁健炜 2017-3-1 day modify  ghid -->
			<c:if test="${not empty list}">
				<c:forEach items="${list}" var="greenhouse">
				<!-- 27为灌溉系统的温室id -->
				<c:if test="${greenhouse.GH_id != 27 }">
				<a href="#${greenhouse.GH_code}" class="my-nav-header" data-toggle="collapse"><span class="icon-th iconSpan"></span>&nbsp;&nbsp;温室&nbsp;&nbsp;${greenhouse.GH_code}</a>
					<ul id="${greenhouse.GH_code}" class="nav nav-list collapse in">
						<li><a href="<%=request.getContextPath()%>/stat/singlelivedata?ghId=${greenhouse.GH_id}" target="main"><span class="glyphicon glyphicon-stats"></span>&nbsp;&nbsp;实时数据&nbsp;&nbsp;&nbsp;&nbsp;</a></li>
						<li><a href="<%=request.getContextPath()%>/stat/historydata?ghId=${greenhouse.GH_id}" target="main"><span class="glyphicon glyphicon-time"></span>&nbsp;&nbsp;历史数据&nbsp;&nbsp;&nbsp;&nbsp;</a></li>
						<!-- 袁健炜 2017-02-28  night modify start-->
						
						<a href="#inner${greenhouse.GH_code}"  class="my-nav-header bgn"  data-toggle="collapse" style="background:none;"><span class="glyphicon glyphicon-cog text-success"></span>&nbsp;&nbsp;参数设定&nbsp;&nbsp;</a>
						<ul id="inner${greenhouse.GH_code}" class="nav nav-list collapse">
							<li><a href="<%=request.getContextPath()%>/ghmgr/editgh?ghId=${greenhouse.GH_id}" target="main"><span class="glyphicon glyphicon-th-large"></span>&nbsp;&nbsp;温室结构&nbsp;&nbsp;&nbsp;&nbsp;</a>
						    </li>
							 
							<li><a href="<%=request.getContextPath()%>/ghmgr/ghadmin/crop/list?ghid=${greenhouse.GH_id}" target="main"><span class="glyphicon glyphicon-leaf"></span>&nbsp;&nbsp;作物管理&nbsp;&nbsp;&nbsp;&nbsp;</a>
						    </li>
						    
							<li><a href="<%=request.getContextPath()%>/ghmgr/ghadmin/ctrl/change-model?ghId=${greenhouse.GH_id}" target="main"><span class="glyphicon glyphicon-plus"></span>&nbsp;&nbsp;控制模式&nbsp;&nbsp;&nbsp;&nbsp;</a>
						    </li>
						</ul>
						
					    
					</ul>
				</c:if>
 <c:if test="${greenhouse.GH_id == 27 }">
<a href="#${greenhouse.GH_code}" class="my-nav-header" data-toggle="collapse"><span class="glyphicon glyphicon-tint"></span>&nbsp;&nbsp;灌溉系统&nbsp;&nbsp;</a>
					<ul id="${greenhouse.GH_code}" class="nav nav-list collapse in">
						<li><a href="<%=request.getContextPath()%>/stat/singlelivedata?ghId=${greenhouse.GH_id}" target="main"><span class="glyphicon glyphicon-stats"></span>&nbsp;&nbsp;实时数据&nbsp;&nbsp;&nbsp;&nbsp;</a></li>
						<li><a href="<%=request.getContextPath()%>/stat/historydata?ghId=${greenhouse.GH_id}" target="main"><span class="glyphicon glyphicon-time"></span>&nbsp;&nbsp;历史数据&nbsp;&nbsp;&nbsp;&nbsp;</a></li>
						<!-- 袁健炜 2017-02-28  night modify start-->
						
					</ul>
</c:if>
				</c:forEach>
			</c:if>
					
</div> <!-- end class="sidebar-nav" -->