<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>鲜花购物商城 - 首页</title>
<link type="text/css" rel="stylesheet" href="css/style.css" />
<script type="text/javascript" src="scripts/function.js"></script>
<script type="text/javascript">
function selectname(){
	  var name = document.getElementById("selectname").value;
	  location.href='selectProductList?name='+name;
}
function searchHot(name){
	location.href='selectProductList?name='+name;
}
</script>
</head>
<body>
	<div id="header" class="wrap">
		<div id="logo">
			<img src="images/logo.gif" />
		</div>
		<div class="help">
			<c:if test="${name!=null}">
				<a href="selectdd?dd=${name.EU_USER_ID }">个人订单</a>
			</c:if>
			<c:if test="${name!=null}">当前用户${name.EU_USER_ID }</c:if>
			<a href="ShopSelect" class="shopping">购物车</a>
			<c:if test="${name==null}">
				<a href="login.jsp">登录</a>|<a href="register.jsp">注册</a>
			</c:if>
			<c:if test="${name!=null}">
				<a href="zx">退出</a>
			</c:if>
			<a href="SelallServlet">留言</a>
			<c:if test="${name.EU_STATUS==2}">
				<a href="manage/index.jsp">去后台</a>
			</c:if>
		</div>
		<div class="navbar">
			<ul class="clearfix">
				<c:choose>
					<c:when test="${empty selected_fid}">
						<li class="current"><a href="indexSelect">首页</a></li>
					</c:when>
					<c:otherwise>
						<li><a href="indexSelect">首页</a></li>
					</c:otherwise>
				</c:choose>
				<c:forEach var="f" items="${flist}">
					<c:choose>
						<c:when test="${selected_fid == f.EPC_ID}">
							<li class="current"><a
								href="selectProductList?fid=${f.EPC_ID }">${f.EPC_NAME }</a></li>
						</c:when>
						<c:otherwise>
							<li><a href="selectProductList?fid=${f.EPC_ID }">${f.EPC_NAME }</a></li>
						</c:otherwise>
					</c:choose>
				</c:forEach>
			</ul>
		</div>
	</div>
	<%@ include file="/include/search_bar.jsp"%>
	<div id="position" class="wrap">
		您现在的位置：<a href="index.jsp">商城</a> &gt; 购物车
	</div>
	<div class="wrap">
		<div id="shopping">
			<div class="shadow">
				<em class="corner lb"></em> <em class="corner rt"></em>
				<div class="box">
					<div class="msg">
						<p>恭喜：购买成功！</p>
						<p>正在进入首页...</p>
						<script type="text/javascript">
						setTimeout("location.href='indexSelect'", 3000);
					</script>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div id="footer">Copyright &copy; 2022【 毕业设计-鲜花购物商城 】 All Rights
		Reserved.</div>
</body>
</html>
