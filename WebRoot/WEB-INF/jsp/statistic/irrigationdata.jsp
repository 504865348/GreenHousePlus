<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//Dth HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dth">
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
<title>施肥灌溉系统</title>
</head>
<body>
	<div class="w11 center-block">
		 
		<div class="detail">
			  <!-- Table 1-->
					  <table class="table table-bordered table-striped table-condensed">
					    <tr>
						<th>温室</th>
						<th>灌溉阀状态</th>
						<th>操作</th>
					    </tr>
					     <tr>
						<td>温室 NO.1</td>
						<td>
						<c:if test="${irr.gh_one_irrigation_status == 0 }">关</c:if>
					    <c:if test="${irr.gh_one_irrigation_status == 1 }">开</c:if></td>
						<td>
						<c:if test="${irr.gh_one_irrigation_status == 0 }"><input type="checkbox"   name='打开' />打开</c:if>
				        <c:if test="${irr.gh_one_irrigation_status == 1 }"><input type="checkbox"   name='关闭' />关闭</c:if>
						</td>
					    </tr>
					    <tr>
						<td>温室 NO.2</td>
						<td>
						<c:if test="${irr.gh_two_irrigation_status == 0 }">关</c:if>
					    <c:if test="${irr.gh_two_irrigation_status == 1 }">开</c:if></td>
						<td>
						<c:if test="${irr.gh_two_irrigation_status == 0 }"><input type="checkbox"   name='打开' />打开</c:if>
				        <c:if test="${irr.gh_two_irrigation_status == 1 }"><input type="checkbox"   name='关闭' />关闭</c:if>
						</td>
					    </tr>
					    <tr>
						<td>温室 NO.3</td>
						<td>
						<c:if test="${irr.gh_three_irrigation_status == 0 }">关</c:if>
					    <c:if test="${irr.gh_three_irrigation_status == 1 }">开</c:if></td>
						<td>
						<c:if test="${irr.gh_three_irrigation_status == 0 }"><input type="checkbox"   name='打开' />打开</c:if>
				        <c:if test="${irr.gh_three_irrigation_status == 1 }"><input type="checkbox"   name='关闭' />关闭</c:if>
						</td>
					    </tr>
					    <tr>
						<td>温室 NO.4</td>
						<td>
						<c:if test="${irr.gh_four_irrigation_status == 0 }">关</c:if>
					    <c:if test="${irr.gh_four_irrigation_status == 1 }">开</c:if></td>
						<td>
						<c:if test="${irr.gh_four_irrigation_status == 0 }"><input type="checkbox"   name='打开' />打开</c:if>
				        <c:if test="${irr.gh_four_irrigation_status == 1 }"><input type="checkbox"   name='关闭' />关闭</c:if>
						</td>
					    <tr>
						<td>温室 NO.5</td>
						<td>
						<c:if test="${irr.gh_five_irrigation_status == 0 }">关</c:if>
					    <c:if test="${irr.gh_five_irrigation_status == 1 }">开</c:if></td>
						<td>
						<c:if test="${irr.gh_five_irrigation_status == 0 }"><input type="checkbox"   name='打开' />打开</c:if>
				        <c:if test="${irr.gh_five_irrigation_status == 1 }"><input type="checkbox"   name='关闭' />关闭</c:if>
						</td>
					    </tr>
					    <tr>
						<td>温室 NO.6</td>
						<td>
						<c:if test="${irr.gh_six_irrigation_status == 0 }">关</c:if>
					    <c:if test="${irr.gh_six_irrigation_status == 1 }">开</c:if></td>	
					    <td>
						<c:if test="${irr.gh_six_irrigation_status == 0 }"><input type="checkbox"   name='打开' />打开</c:if>
				        <c:if test="${irr.gh_six_irrigation_status == 1 }"><input type="checkbox"   name='关闭' />关闭</c:if>
						</td>		
					    </tr>
					     <tr>
			<td class="text-center"></td>
			<td></td>
		    <td><input type="button" value="更改设备" class="btn bcm tcw"
				onclick=""></td>
		 </tr>
					  </table>
			  <!-- Table 2-->
					  <table class="table table-bordered table-striped table-condensed">
					    <tr>
						<th>参数</th>
						<th>数值</th>
						<th>单位</th>
					    </tr>
					     <tr>
						<td>EC</td>
						<td>${irr.EC}</td>
						<td>mS/cm</td>
					    </tr>
					     <tr>
						<td>PH</td>
						<td>${irr.PH}</td>
						<td></td>
					    </tr>
					     <tr>
						<td>流量</td>
						<td>${irr.flow}</td>
						<td>L/min</td>
					    </tr>
					     <tr>
						<td>灌溉量</td>
						<td>${irr.irrigation_amount}</td>
						<td>升</td>
					    </tr>
					    
					   
					  </table>
			</div>
	</div>

		<div id="page"></div>
		<script type="text/javascript"
			src="<%=request.getContextPath()%>/assets/js/jquery.min.js"></script>
		<script type="text/javascript"
			src="<%=request.getContextPath()%>/assets/laypage/laypage.js"></script>
		<script>

function changeMode(){
	
	var pass; 
	if(pass = prompt('请输入密码：')){
		$.post('validate_pass',{
			password:pass
		},'json')
		.done(function(data){
			if(data.equals("true")){
				alert('密码正确');
			}
			else{
				alert('密码错误，修改失败');
			}
		});
	}
	
	
}


</script>
	</div>

</body>
</html>