<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3c.org/TR/1999/REC-html401-19991224/loose.dtd">
<html>
<head>
<base href="<%=basePath%>">

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<TITLE>欢迎访问粤嵌西安论坛</TITLE>
<META http-equiv=Content-Type content="text/html; charset=utf-8">
<Link rel="stylesheet" type="text/css" href="style/style.css" />
<script type="text/javascript">
/* 时间 */
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
	</DIV>
	<!--      用户信息、登录、注册        -->
	<%-- <%
	String name="";
	try{
		name=(String)request.getAttribute("name");
		if(name.equals("")){
	%> --%>
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
	<DIV class="t">
		<TABLE cellSpacing="0" cellPadding="0" width="100%">
			<TR class="tr2" align="center">
				<TD colSpan="2">主题</TD>
				<TD style="WIDTH: 10%;">数量</TD>
				<TD style="WIDTH: 30%">最后发表</TD>
			</TR>
			<c:forEach items="${list}" var="f" varStatus="vs">
				<!--       主版块       -->
				<TR class="tr3">
					<TD colspan="4">${f.forcumName}</TD>
				</TR>
				<!--       子版块       -->

				<c:forEach items="${list1}" var="b" varStatus="j">
					<c:if test="${f.forcumId==b.forcumId}">
						<TR class="tr3">
							<TD width="5%">&nbsp;</TD>
							<TH align="left"><IMG src="image/board.gif"> <A
								href="BbsServlet?flag=lists&boardId=${b.boardId}">${b.boardName} </A></TH>
							<c:forEach items="${list3}" var="n">
								<c:if test="${n.boardName==b.boardName}">
									<TD align="center">${n.id}</TD>
								</c:if>
							</c:forEach>
							<TH>
							<SPAN>
							<c:forEach items="${list2}" var="t" varStatus="s">
								<c:if test="${b.boardId==t.borderId}">
									<%-- <A href="BbsServlet?flag=details">${t.topicCaption}</A> --%>
									<c:choose>
										<c:when test='${name==null}'>
											
											<A onclick="f3(this)">${t.topicCaption}</A>
										</c:when>
										<c:otherwise>
											<A href="BbsServlet?flag=details&conId=${t.topicId}">${t.topicCaption}</A>
										</c:otherwise>
									</c:choose>
								</c:if>
							</c:forEach>  </SPAN> <BR />
								<SPAN>accp</SPAN> <SPAN class="gray">[${b.cateDate}]</SPAN></TH>
						</TR>
					</c:if>
				</c:forEach>
			</c:forEach>
		</TABLE>
	</DIV>

	<BR />
	<CENTER class="gray">版权所有 2005-2011 西安粤嵌科技有限公司</CENTER>
</BODY>
</HTML>
