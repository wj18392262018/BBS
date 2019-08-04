package com.filter;

import java.io.IOException;
import java.util.List;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServlet;

import com.dao.BoardDao;
import com.dao.ForcumDao;
import com.dao.TopicDao;
import com.entity.BoardInfo;
import com.entity.ForcumInfo;
import com.entity.Num;
import com.entity.TopicInfo;

public class IndexFilter extends HttpServlet implements Filter {
	@Override
	public void doFilter(ServletRequest arg0, ServletResponse arg1,
			FilterChain arg2) throws IOException, ServletException {
		ForcumDao fdao=new ForcumDao();
		List<ForcumInfo> list=fdao.selectName();
		//传递大板块
		arg0.setAttribute("list",list );
		BoardDao bdao=new BoardDao();
		List<BoardInfo> list1=bdao.selectName();
		//传递小板块
		arg0.setAttribute("list1",list1 );
		TopicDao tdao=new TopicDao();
		List<TopicInfo> list2=tdao.selectName();
		arg0.setAttribute("list2", list2);
		List<Num> list3=bdao.selectNum();
		//显示小版块下的帖子的数量
		arg0.setAttribute("list3", list3);
		arg2.doFilter(arg0, arg1);
}

	@Override
	public void init(FilterConfig arg0) throws ServletException {
		// TODO Auto-generated method stub
		
	}

}
