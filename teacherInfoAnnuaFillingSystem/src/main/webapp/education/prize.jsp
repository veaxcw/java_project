<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN">
<html>
	<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<base href="<%=basePath%>"/>
		<title>教师年度工作填报系统</title>
   		<link rel="stylesheet" type="text/css" href="Styles/bootstrap.min.css" />
    	<link rel="stylesheet" type="text/css" href="Styles/admin-all.css" />
    	<script type="text/javascript" src="Scripts/jquery-1.7.2.js"></script>
    	<script type="text/javascript" src="Scripts/jquery-ui-1.8.22.custom.min.js"></script>
    	<link rel="stylesheet" type="text/css" href="Styles/ui-lightness/jquery-ui-1.8.22.custom.css" />
<style>
.table th, .table td 
{ 
	text-align: center; 
}
			/* 正文：分页功能区 */
#pages a
{
    color: #000;
}
#pages a:hover
{
    background: #cddde4;
    border: #97b9c9 solid 1px;
    color: #067db5;
    padding: 5px 9px;
}
#pages a.current_page
{
    background: #FFF;
    border: #89bdd8 solid 1px;
    color: #067db5;
}
/* 正文：分页功能区 */
#pages
{
    width: 940px;
    text-align: center;
    height: 28px;
    line-height: 28px;
    margin-top: 5px;
}
#pages a, #pages a.current_page:hover
{
    padding: 5px 10px;
}

        </style>
	</head>
	<body>
    	<div class="alert alert-info">当前位置<b class="tip"></b>教学管理<b class="tip"></b>获奖管理</div>
    	<form method="post" action="prizeServlet/findByUsercode.do">
    	
    	<table class="table table-striped table-bordered table-condensed" align="center">
        	<tbody>
            	<tr class="tr_title" >
                	<th>获奖编号</th>
                	<th>获奖项目名称</th>
                	<th>获奖时间</th>
                	<th>获奖等级</th>
                	<th>颁发单位</th>
                	<th>上传时间</th>
                	<th>简介</th>
                	<th>操作 </th>
            	</tr>
            	<c:forEach items="${prizes}" var="p">
					<tr>
						<td>${p.pid}</td>
						<td>${p.pname}</td>
						<td>${p.pdate}</td>
						<td>${p.diploma}</td>
						<td>${p.pdepart}</td>
						<td>${p.uploaddate}</td>
						<td>${p.summary}</td>
						<td>&nbsp;
							<a class="btn btn-mini btn-danger" href="prizeServlet/findByPid.do?pid=${p.pid}">修改</a>
                			<a class="btn btn-mini btn-danger" href="prizeServlet/delete.do?pid=${p.pid}">删除</a>
                		</td>
					</tr>
				</c:forEach>
				
			</tbody>
		</table>
		<!-- 分页 -->                 
			<div id="pages">
				<c:choose>
					<c:when test="${page==1}">
						<a  onclick="return false;" style="cursor:pointer">上一页</a>
					</c:when>
					<c:otherwise>
						<a href="prizeServlet/findByUsercode.do?page=${page-1}" style="cursor:pointer">上一页</a>
					</c:otherwise>
				</c:choose>
				<c:forEach begin="1" end="${maxPage}" var="p">
					<c:choose>
						<c:when test="${page==p}">
							<a href="prizeServlet/findByUsercode.do?page=${p}" class="current_page">${p}</a>
						</c:when>
						<c:otherwise>
							<a href="prizeServlet/findByUsercode.do?page=${p}">${p}</a>
						</c:otherwise>
					</c:choose>
				</c:forEach>
				<c:choose>
					<c:when test="${page==maxPage}">
						<a  onclick="return false;" style="cursor:pointer">下一页</a>
					</c:when>
					<c:otherwise>
						<a href="prizeServlet/findByUsercode.do?page=${page+1 }" style="cursor:pointer">下一页</a>
					</c:otherwise>
				</c:choose>
				</div>
			</form>
 	 </body>
</html>