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
    
    <title>My JSP 'update.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<TITLE>粤嵌西安论坛--回复帖子</TITLE>
<META http-equiv=Content-Type content="text/html; charset=utf-8">
<Link rel="stylesheet" type="text/css" href="style/style.css" />
<script type="text/javascript">
function check(){
	if(document.updateForm.title.value=="") {
		alert("标题不能为空");
		return false;
	}
	if(document.updateForm.content.value=="") {
		alert("内容不能为空");
		return false;
	}
	if(document.updateForm.content.value.length>1000) {
		alert("长度不能大于1000");
		return false;
	}
}
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
function f2(){
	var td=document.getElementById("hd").value;
	if(td==""){
		alert("请登陆");
		updateForm.action="login.jsp";
		updateForm.submit();
	}else{
		updateForm.submit();
	}
}
</script>
</HEAD>

<BODY onload="f1()">
<DIV>
	<IMG src="image/logo.png" style="width:200px;height:50px">
	<div align="right"><div id="date"></div></div>
</DIV>
<!--      用户信息、登录、注册        -->

<c:choose>
		<c:when test='${name==null}'>
			<DIV class="h">
				您尚未 <a href="login.html">登录</a> &nbsp;| &nbsp; <A href="reg.html">注册</A>
				|
				<input type="hidden" id="hd" value="">
			</DIV>
		</c:when>
		<c:otherwise>
			<DIV class="h">欢迎:${name}</DIV>
			<input type="hidden" id="hd" value="${name}">
		</c:otherwise>
</c:choose>

<!--      主体        -->
<DIV><BR/>
	<!--      导航        -->
	<DIV>
		&gt;&gt;<B><a href="index.jsp">论坛首页</a></B>&gt;&gt;
		<B><a href="BbsServlet?flag=lists&boardId=${boardId}">${boardName}</a></B>
	</DIV><BR/>
	<DIV>
		<FORM name="updateForm" onSubmit="return check();" action="BbsServlet?flag=updates" method="post">
			<INPUT type="hidden" name="boardId" value="8"/>
			<INPUT type="hidden" name="replyId" value="61"/>
			<DIV class="t">
				<TABLE cellSpacing="0" cellPadding="0" align="center">
				 
				    <TR>
					    <TD class="h" colSpan="3"><B>&#20462;&#25913;&#24086;&#23376;</B></TD>
				    </TR>
				
				    <TR class="tr3">
					    <TH width="20%"><B>标题</B></TH>
					    <TH><INPUT name="title" value="${replyC}" class="input" style="PADDING-LEFT: 2px; FONT: 14px Tahoma" tabIndex="1" size="60" readonly></TH>
				    </TR>
				 
				    <TR class="tr3">
					    <TH vAlign="top">
					      <DIV><B>内容</B></DIV>
					    </TH>
					    <TH colSpan="2">
					        <DIV>
						        <span><textarea id="texts" name="content" style="WIDTH: 500px;" rows="20" cols="90" tabIndex="2" ></textarea></span>
						    </DIV>
					      (不能大于:<FONT color="blue">1000</FONT>字)
					    </TH>
					</TR>
				</TABLE>
			</DIV>

			<DIV style="MARGIN: 15px 0px; TEXT-ALIGN: center">
				<INPUT class="btn" tabIndex="3" type="button" value="回帖" onclick="f2()"> 
				<INPUT class="btn" tabIndex="4" type="reset"  value="重 置">
			</DIV>
		</FORM>
	
	</DIV>
	<!--      声明        -->
	<BR/>
</DIV>
<CENTER class="gray">版权所有 2005-2011　西安粤嵌科技有限公司</CENTER>

</BODY>
</HTML>
