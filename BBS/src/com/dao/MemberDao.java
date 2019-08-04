package com.dao;

import java.util.ArrayList;
import java.util.List;

import com.entity.MemberInfo;
import com.yq.dao.BaseDao;

public class MemberDao extends BaseDao {
	public List selectMessage(String name,String pwd){
		String sql="select * from member where memberName=? and memberPwd=?";
		List list =new ArrayList();
		list.add(name);
		list.add(pwd);
		super.setParams(list);
		return super.query(sql, MemberInfo.class);
	}
	public Integer register(MemberInfo m){
		String sql="insert into member values(0,?,?,?,?,0,0,0,now())";
		List list =new ArrayList();
		list.add(m.getMemberName());
		list.add(m.getMemberPwd());
		list.add(m.getMemberIcon());
		list.add(m.getMemberGender());
		super.setParams(list);
		return super.update(sql);
	}
	public List selectMessage(String name){
		String sql="select * from member where memberName=?";
		List list =new ArrayList();
		list.add(name);
		super.setParams(list);
		return super.query(sql, MemberInfo.class);
	}
}
