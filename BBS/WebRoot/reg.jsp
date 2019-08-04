<%@ page language="java" import="java.util.*,com.jspsmart.upload.*,com.dao.*,com.entity.*" pageEncoding="gbk"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'reg.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
    <%
	request.setCharacterEncoding("gbk");
	try{
		//1，创建SmartUpload对象
		SmartUpload su=new SmartUpload();
		//2，初始化对象
		su.initialize(pageContext);
		//限制大小
		su.setMaxFileSize(1024*1024*4);
		//限制类型
		su.setAllowedFilesList("gif,jpg,png");
		//3，上传文件
		su.upload();
		//4，保存文件
		if(su.save("/image/head")>0){
			String name=su.getRequest().getParameter("uName");
			String pwd=su.getRequest().getParameter("uPass");
			String sex=su.getRequest().getParameter("gender");
			String icon=su.getRequest().getParameter("head");
			String fileName=su.getFiles().getFile(0).getFilePathName();
			MemberInfo m= new MemberInfo(name,pwd,fileName,sex);
			MemberDao mdao=new MemberDao();
			if(mdao.register(m)>0){
				request.setAttribute("name", name);
				response.sendRedirect("index.jsp");
			}else{
				request.getRequestDispatcher("reg.html").forward(request, response);
			}
		}
		
	}catch(Exception e){
		e.printStackTrace();
	}
%>
  </body>
</html>
