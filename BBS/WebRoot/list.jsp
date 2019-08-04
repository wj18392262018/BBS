<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3c.org/TR/1999/REC-html401-19991224/loose.dtd">

<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'list.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<TITLE>粤嵌西安论坛--帖子列表</TITLE>
<META http-equiv=Content-Type content="text/html; charset=utf-8">
<Link rel="stylesheet" type="text/css" href="style/style.css" />
<script type="text/javascript">
	 function f1(){
	var date=new Date();
	var d=date.getHours();
	if((d>=7)&&(d<13)){
		var s1="早上好，";
	}else if((d>=13)&&(d<19)){
		var s1="下午好，";
	}else{
		var s1="晚上好，";
	}
	var s3=date.getYear()+1900+"年";
	var s4=date.getMonth()+1+"月";
	var s5=date.getDate()+"日"+"&nbsp;&nbsp;";
	if(date.getHours()>12){
		var s6=date.getHours()-12+':';
	}else{
		var s6=date.getHours()+':';
	}
	var s7=date.getMinutes()+":";
	var s8=date.getSeconds()+"&nbsp;&nbsp;";
	if(date.getHours()>12){
		var s9="PM &nbsp;&nbsp;";
	}else{
		var s9="AM &nbsp;&nbsp;";
	}
	var s=date.getDay();
	switch(s){
		case 0: 
			var s10="星期天";
			break;
		case 1: 
			var s10="星期一";
			break;
		case 2: 
			var s10="星期二";
			break;
		case 3: 
			var s10="星期三";
			break;
		case 4: 
			var s10="星期四";
			break;
		case 5: 
			var s10="星期五";
			break;
		case 6: 
			var s10="星期六";
			break;
	}
	document.getElementById('date').innerHTML=s1+s3+s4+s5+s6+s7+s8+s9+s10;
	window.setTimeout('f1()',1000);
  }
  function f3(obj){
  	alert("请登陆！");
  	obj.href="login.html";
  }
</script>
</HEAD>

<BODY onload="f1()">
<DIV>
	<IMG src="image/logo.png" style="width:200px;height:50px">
	<div align="right" ><div id="date"></div></div>
</DIV>
<!--      用户信息、登录、注册        -->

<c:choose>
		<c:when test='${name==null}'>
			<DIV class="h">
				您尚未 <a href="login.html">登录</a> &nbsp;| &nbsp; <A href="reg.html">注册</A>
				|
			</DIV>
		</c:when>
		<c:otherwise>
			<DIV class="h">欢迎:${name}</DIV>
		</c:otherwise>
</c:choose>


<!--      主体        -->
<DIV>
<!--      导航        -->
<br/>
<DIV>
	&gt;&gt;<B><a href="index.jsp">论坛首页</a></B>&gt;&gt;
	<B><a href="BbsServlet?flag=lists&boardId=${boardId}">${boardName}</a></B>
</DIV>
<br/>
<!--      新帖        -->
	<DIV>
		<A href="post.jsp"><IMG src="image/post.gif" name="td_post" border="0" id=td_post></A>
	</DIV>
<!--         翻 页         -->
	<%-- <DIV>
		<a href="BbsServlet?flag=lists&boardId=${boardId}">上一页</a>|
		<a href="BbsServlet?flag=lists&boardId=${boardId}">下一页</a>
	</DIV> --%>

	<DIV class="t">
		<TABLE cellSpacing="0" cellPadding="0" width="100%">		
			<TR>
				<TH class="h" style="WIDTH: 100%" colSpan="4"><SPAN>&nbsp;</SPAN></TH>
			</TR>
<!--       表 头           -->
			<TR class="tr2">
				<TD>&nbsp;</TD>
				<TD style="WIDTH: 80%" align="center">文章</TD>
				<TD style="WIDTH: 10%" align="center">作者</TD>
				<TD style="WIDTH: 10%" align="center">回复</TD>
			</TR>
<!--         主 题 列 表        -->
		<c:forEach items="${list}" var="t" varStatus="vs">
			<TR class="tr3">
				<TD><IMG src="image/topic.gif" border=0></TD>
				<TD style="FONT-SIZE: 15px">
					<c:choose>
						<c:when test='${name==null}'>
							
							<A onclick="f3(this)">${t.topicContent}</A>
						</c:when>
						<c:otherwise>
							<A href="BbsServlet?flag=details&conId=${t.topicId}">${t.topicContent}</A>
						</c:otherwise>
					</c:choose>
					
				</TD>
				<TD align="center">${t.lastReplyUser}</TD>
				<c:set var="fg" value="true" />
				<c:forEach items="${list2}" var="s">
					<c:choose>
						<c:when test="${s.boardName==t.topicContent}">
							<TD align="center">${s.id}</TD>
							<!-- <c:set var="exitId" value="0"></c:set> -->
							<c:set var="fg" value="false"/>
						</c:when>
					</c:choose>
				</c:forEach> 
				<c:if test="${fg}">
					<TD align="center">${0}</TD>
				</c:if>
			</TR>
		</c:forEach>

		</TABLE>
	</DIV>
<!--            翻 页          -->
	<DIV>
		<a href="BbsServlet?flag=lists&boardId=${boardId}">上一页</a>|
		<a href="BbsServlet?flag=lists&boardId=${boardId}">下一页</a>
	</DIV>
</DIV>
<!--             声 明          -->
<BR/>
<CENTER class="gray">版权所有 2005-2011　西安粤嵌技有限公司</CENTER>

</BODY>
</HTML>
