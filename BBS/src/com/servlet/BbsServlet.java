package com.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.BoardDao;
import com.dao.MemberDao;
import com.dao.ReplyDao;
import com.dao.TopicDao;
import com.entity.BoardInfo;
import com.entity.Count;
import com.entity.MemberInfo;
import com.entity.Num;
import com.entity.ReplyInfo;
import com.entity.TopicInfo;
public class BbsServlet extends DispatchServlet {

	/**
	 * The doPost method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to post.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	//登陆
	public void Login(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=utf-8");
		String name=request.getParameter("uName");
		String pwd=request.getParameter("uPass");
		MemberDao ld=new MemberDao();
		List<MemberInfo> list=ld.selectMessage(name, pwd);
		if(list.size()>0){
			HttpSession session=request.getSession();
			session.setAttribute("name", list.get(0).getMemberName());
			session.setAttribute("memberId",list.get(0).getMemberId());
			response.sendRedirect("index.jsp");
			//request.getRequestDispatcher("index.jsp").forward(request, response);
		}else{
			request.getRequestDispatcher("login.html").forward(request, response);
		}
		
	}
	//注册
	public void reg(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		String name=request.getParameter("uName");
		String pwd=request.getParameter("uPass");
		String sex=request.getParameter("gender");
		String icon=request.getParameter("head");
		String fileName=request.getParameter("fileName");
		if(!fileName.equals("")){
			icon=fileName;
		}
		MemberInfo m=new MemberInfo(name, pwd,icon, sex);
		MemberDao ld=new MemberDao();
		Integer i=ld.register(m);
		if(i>0){
			HttpSession session=request.getSession();
			session.setAttribute("name", name);
			response.sendRedirect("index.jsp");
			//request.getRequestDispatcher("index.html").forward(request, response);
		}else{
			request.getRequestDispatcher("reg.html").forward(request, response);
		}
	}
	//添加帖子
	public void posts(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session=request.getSession();
		String name=(String)session.getAttribute("name");
		String topicCaption=request.getParameter("title");
		String topicContent=request.getParameter("content");
		Integer memberId=(Integer)session.getAttribute("memberId");
		Integer boardId=(Integer)session.getAttribute("boardId");
		TopicInfo t=new TopicInfo(topicContent,topicCaption,boardId,memberId,name);
		TopicDao tdao=new TopicDao();
		Integer i=tdao.add(t);
		if(i>0){
			response.sendRedirect("BbsServlet?flag=lists&boardId="+boardId);
		}else{
			request.getRequestDispatcher("post.jsp").forward(request, response);
		}
	}
	//显示帖子
	public void lists(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		TopicDao tdao=new TopicDao();
		HttpSession session=request.getSession();
		Integer boardId=Integer.parseInt(request.getParameter("boardId"));
		session.setAttribute("boardId", boardId);
		BoardDao bdao=new BoardDao();
		//获取Id
		List<BoardInfo> list1=bdao.selectName(boardId);
		session.setAttribute("boardName",list1.get(0).getBoardName());
		List<TopicInfo> list=tdao.selectId(boardId);
		request.setAttribute("list", list);
		ReplyDao rdao=new ReplyDao();
		List<Num> list2=rdao.count(boardId);
		request.setAttribute("list2", list2);
		request.getRequestDispatcher("list.jsp").forward(request, response);
	}
	//显示回帖
	public void details(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		//response.setContentType("text/html;charset=UTF-8");
		HttpSession session=request.getSession();
		Integer conId=Integer.parseInt(request.getParameter("conId"));
		session.setAttribute("conId", conId);
		String con=request.getParameter("con");
		String name="";
		try {
			name=(String)session.getAttribute("name");
			
		} catch (Exception e) {
			// TODO: handle exception
			name="";
		}
		try {
			if(name.equals("")){
				response.sendRedirect("index.jsp");
			}else{
				MemberDao ld=new MemberDao();
				List<MemberInfo> list=ld.selectMessage(name);
				TopicDao tdao=new TopicDao();
				//版主
				List<TopicInfo> list1=tdao.selectIds(conId);
				request.setAttribute("list", list.get(0));
				request.setAttribute("list1", list1);
				session.setAttribute("replyC", list1.get(0).getTopicContent());
				//发表
				ReplyDao rdao=new ReplyDao();
				List<Count> list2=rdao.selectDetails(conId);
				request.setAttribute("list2", list2);
				request.getRequestDispatcher("detail.jsp").forward(request, response);
			}
		} catch (Exception e) {
			// TODO: handle exception
			response.sendRedirect("index.jsp");
		}
		
	}
	//回帖
	public void updates(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		HttpSession session=request.getSession();
		Integer boardId=(Integer)session.getAttribute("boardId");
		Integer topicId=(Integer)session.getAttribute("conId");
		Integer memberId=(Integer)session.getAttribute("memberId");
		String topicContent=request.getParameter("content");
		ReplyInfo r=new ReplyInfo(boardId,topicId,memberId,topicContent);
		ReplyDao rdao=new ReplyDao();
		Integer i=rdao.add(r);
		if(i>0){
			response.sendRedirect("BbsServlet?flag=details&conId="+topicId);
		}else{
			request.getRequestDispatcher("update.jsp").forward(request, response);
		}
	}
	//删除回帖
	public void removes(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		HttpSession session=request.getSession();
		Integer topicId=(Integer)session.getAttribute("conId");
		Integer replyId=Integer.parseInt(request.getParameter("replyId"));
		ReplyDao rdao=new ReplyDao();
		Integer i=rdao.removeRep(replyId);
		if(i>0){
			response.sendRedirect("BbsServlet?flag=details&conId="+topicId);
		}else{
			response.sendRedirect("BbsServlet?flag=details&conId="+topicId);
		}
	}
	//修改回帖
	public void amends(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		HttpSession session=request.getSession();
		Integer topicId=(Integer)session.getAttribute("conId");
		Integer replyId=(Integer)session.getAttribute("replyIdss");
		String topicContent=request.getParameter("content");
		ReplyDao rdao=new ReplyDao();
		Integer i=rdao.updateRep(replyId, topicContent);
		if(i>0){
			response.sendRedirect("BbsServlet?flag=details&conId="+topicId);
		}else{
			response.sendRedirect("BbsServlet?flag=details&conId="+topicId);
		}
	}
	public void gains(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		HttpSession session=request.getSession();
		Integer replyId=Integer.parseInt(request.getParameter("replyId"));
		session.setAttribute("replyIdss", replyId);
		response.sendRedirect("amend.jsp");
	}
}
