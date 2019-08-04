package com.dao;

import java.util.ArrayList;
import java.util.List;

import com.entity.TopicInfo;
import com.yq.dao.BaseDao;

public class TopicDao extends BaseDao {
	public List selectName(){
		String sql="select * from topic";
		return super.query(sql, TopicInfo.class);
	}
	public Integer add(TopicInfo t){
		String sql="insert into topic values(0,?,?,?,?,0,now(),now(),?,now())";
		List list=new ArrayList();
		list.add(t.getTopicCaption());
		list.add(t.getTopicContent());
		list.add(t.getBorderId());
		list.add(t.getMemberId());
		list.add(t.getLastReplyUser());
		super.setParams(list);
		return super.update(sql);
	}
	public List selectName(Integer id){
		String sql="select * from topic where memberId="+id;
		return super.query(sql, TopicInfo.class);
	}
	public List selectId(Integer id){
		String sql="SELECT * FROM topic WHERE borderId="+id;
		return super.query(sql, TopicInfo.class);
	}
	public List selectIds(Integer id){
		String sql="SELECT * FROM topic WHERE topicId="+id;
		return super.query(sql, TopicInfo.class);
	}
}
