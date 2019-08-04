<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3c.org/TR/1999/REC-html401-19991224/loose.dtd">

<html>
<head>
<TITLE>粤嵌西安论坛--看贴</TITLE>
<Link rel="stylesheet" type="text/css" href="style/style.css" />
<META http-equiv=Content-Type content="text/html; charset=UTF-8">
<script type="text/javascript">
	function f1() {
		var date = new Date();
		var d = date.getHours();
		if ((d >= 7) && (d < 13)) {
			var s1 = "早上好，";
		} else if ((d >= 13) && (d < 19)) {
			var s1 = "下午好，";
		} else {
			var s1 = "晚上好，";
		}
		var s3 = date.getYear()+1900 + "年";
		var s4 = date.getMonth() + 1 + "月";
		var s5 = date.getDate() + "日" + "&nbsp;&nbsp;";
		if (date.getHours() > 12) {
			var s6 = date.getHours() - 12 + ':';
		} else {
			var s6 = date.getHours() + ':';
		}
		var s7 = date.getMinutes() + ":";
		var s8 = date.getSeconds() + "&nbsp;&nbsp;";
		if (date.getHours() > 12) {
			var s9 = "PM &nbsp;&nbsp;";
		} else {
			var s9 = "AM &nbsp;&nbsp;";
		}
		var s = date.getDay();
		switch (s) {
		case 0:
			var s10 = "星期天";
			break;
		case 1:
			var s10 = "星期一";
			break;
		case 2:
			var s10 = "星期二";
			break;
		case 3:
			var s10 = "星期三";
			break;
		case 4:
			var s10 = "星期四";
			break;
		case 5:
			var s10 = "星期五";
			break;
		case 6:
			var s10 = "星期六";
			break;
		}
		document.getElementById('date').innerHTML = s1 + s3 + s4 + s5 + s6 + s7
				+ s8 + s9 + s10;
		window.setTimeout('f1()', 1000);
	}
</script>
</HEAD>

<BODY onload="f1()">
	<DIV>
		<IMG src="image/logo.png" style="width:200px;height:50px">
		<div align="right">
			<div id="date"></div>
		</div>
	</DIV>
	<!--      用户信息、登录、注册        -->

	<c:choose>
		<c:when test='${name==null}'>
			<DIV class="h">
				您尚未 <a href="login.html">登录</a> &nbsp;| &nbsp; <A href="reg.html">注册</A>
				| <input type="hidden" id="hd" value="">
			</DIV>
		</c:when>
		<c:otherwise>
			<DIV class="h">欢迎:${name}</DIV>
			<input type="hidden" id="hd" value="${name}">
		</c:otherwise>
	</c:choose>
	<!--      主体        -->
	<DIV>
		<br />
		<!--      导航        -->
		<DIV>
			&gt;&gt;<B><a href="index.jsp">论坛首页</a>
			<B>&gt;&gt;<a href="BbsServlet?flag=lists&boardId=${boardId}">${boardName}</a></B>
			</B>
		</DIV>
		<br />
		<!--      回复、新帖        -->
		<DIV>
			<A href="update.jsp"><IMG src="image/reply.gif" border="0"
				id=td_post>
			</A> <A href="post.jsp"><IMG src="image/post.gif" border="0"
				id=td_post>
			</A>
		</DIV>
		<!--         翻 页         -->
		<%-- <DIV>
			<a href="BbsServlet?flag=details&conId=${t.topicId}">上一页</a>| <a
				href="BbsServlet?flag=details&conId=${t.topicId}">下一页</a>
		</DIV> --%>
		<!--      本页主题的标题        -->

		<DIV>
			<TABLE cellSpacing="0" cellPadding="0" width="100%">
				<TR>
					<TH class="h">本页主题: ${boardName}</TH>
				</TR>
				<TR class="tr2">
					<TD>&nbsp;</TD>
				</TR>
			</TABLE>
		</DIV>

		<!--      主题        -->
		<c:forEach items="${list1}" var="t" varStatus="vs">
			<DIV class="t">
				<TABLE style="BORDER-TOP-WIDTH: 0px; TABLE-LAYOUT: fixed"
					cellSpacing="0" cellPadding="0" width="100%">
					<TR class="tr1">
						<TH style="WIDTH: 20%"><B>${list.memberName}</B><BR /> <img
							src="image/head/${list.memberIcon}" /><BR /> 注册:${list.regDate}<BR />
						</TH>
						<TH>
							<H4>${t.topicCaption}</H4>
							<DIV>${t.topicContent}</DIV>
							<DIV class="tipad gray">发表：[${t.publishTime}] &nbsp;
								最后修改:[${t.lastReplyDate}]</DIV></TH>
					</TR>
				</TABLE>
			</DIV>
		</c:forEach>
		<!--      回复        -->
		<c:forEach items="${list2}" var="t" varStatus="vs">
			
			<DIV class="t">
				<TABLE style="BORDER-TOP-WIDTH: 0px; TABLE-LAYOUT: fixed"
					cellSpacing="0" cellPadding="0" width="100%">
					<TR class="tr1">
						<TH style="WIDTH: 20%"><B>${t.memberName}</B><BR /> <img
							src="image/head/${t.memberIcon}" /><BR /> 注册:${t.regDate}<BR />
						</TH>
						<TH>
							<H4>${t.topicCaption}</H4>
							<DIV>${t.topicContent}</DIV>
							<DIV class="tipad gray">发表：[${t.publishTime}] &nbsp;
								最后修改:[${t.lastReplyDate}]
								<c:if test="${t.memberName==name}">
									<A href="BbsServlet?flag=removes&replyId=${t.replyId}">[删除]</A>
									<A href="BbsServlet?flag=gains&replyId=${t.replyId}">[修改]</A>
								</c:if>
						</DIV></TH>
					</TR>
				</TABLE>
			</DIV>
		</c:forEach>
	</DIV>

	<!--      声明        -->
	<BR>
	<CENTER class="gray">版权所有 2005-2011 西安粤嵌科技有限公司</CENTER>
</BODY>
</HTML>
