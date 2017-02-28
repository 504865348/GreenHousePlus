<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- 顶部页面 -->
<div class="navBar">
	<div class="navInner">
		<div class="container">
			<div class="row" style="position: relative">
				<div style="width: 300px; float: left;">
					<span class="topTitle"><span
						class="glyphicon glyphicon-cloud mr10"></span>温室智慧管控系统</span>
				</div>
				<c:if test="${me.user_type eq 1 }">
					<form action="">
						<div style="width: 100px; float: left;">
							<span
								style="display: inline-block; margin-top: 3px; color: #fff;">当前温室：</span>
						</div>
						<div style="width: 120px; float: left;">
							<select
								style="display: inline-block; background: #5C6A85; color: #fff;; padding: 2px 0px; border: 1px solid #999;">
								<c:forEach items="${ghs }" var="gh">
									<option name="gh" value="${gh.GH_id }"
										<c:if test="${sessionScope['ses.currgh'] eq gh.GH_id}">selected="selected"</c:if>>温室代号：${gh.GH_code }
									</option>
								</c:forEach>
							</select>
						</div>
						<div style="width: 300px; float: left;">
							<button type="submit"
								style="display: inline-block; background: #5C6A85; border: 1px solid #999; color: #fff; padding-bottom: 4px;">切换温室</button>
						</div>
					</form>
				</c:if>

				<div style="width: 100px; float: right;">
					<span class="topName"> <a
						href="<%=request.getContextPath()%>/user/detail?userId=${me.user_id}"
						target="_blank"><span class="icon-user"></span> <c:out
								value="${me.user_realname}"></c:out></a>
					</span>
				</div>
				<div style="width: 100px; float: right;">
					<span class="topLogin"><a
						href="<%=request.getContextPath()%>/login/logout"><span
							class="icon-off tcw"></span> 退出</a></span>
				</div>
				<div style="width: 100px; float: right;">
					<span class="sysnews"><span class="icon-envelope mr10"></span>消息</span>
				</div>
				<div class="clearfix"></div>
			</div>
			<!-- end class="row" -->
		</div>
		<!-- end class="container" -->
	</div>
</div>
<!-- end class="nav" -->