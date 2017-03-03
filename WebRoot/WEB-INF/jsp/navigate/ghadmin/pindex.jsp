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
	  <div class="row">
	   	<jsp:include page="/WEB-INF/jsp/include/pheader.jsp"></jsp:include>
	  </div>
	  
	  <div class="row">
		   <div class="col-md-2">
			   	<jsp:include page="/WEB-INF/jsp/include/pNavSide.jsp"></jsp:include>
		   </div>
		   <div class="col-md-10 my-article">
		   		<iframe name="main" class="mainIframe" scrolling="no" style="height:1200px"
 
				onload="iw=this.contentWindow;$(this).height(iw.$(iw.document).height())"
				src="<%=request.getContextPath()%>/stat/livedata"></iframe>
		   </div><!-- end class="col-md-10" -->
	  </div><!-- end class="row" -->
	  
	  <div class="row">
	  	<div class="col-md-12 my-footer">
	  		<div>
	  			<jsp:include page="/WEB-INF/jsp/include/pfooter.jsp"></jsp:include>
	  		</div>
	  	</div>
	  </div><!-- end class="row" -->
	</div>
</body>
</html>