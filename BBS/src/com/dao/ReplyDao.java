package com.dao;

import java.util.ArrayList;
import java.util.List;

import com.entity.Count;
import com.entity.Num;
import com.entity.ReplyInfo;
import com.entity.TopicInfo;
import com.yq.dao.BaseDao;

public class ReplyDao extends BaseDao {
	public List count(Integer boardId){
		String sql="SELECT  t.topicContent boardName,COUNT(r.replyId) id FROM board b, topic t,reply r WHERE t.topicId=r.topicId AND r.borderId=b.boardId  AND r.borderId="+boardId+" GROUP BY r.topicId";
		return super.query(sql,Num.class );
	}
	public List selectRep(Integer i){
		String sql="SELECT  t.topicContent boardName,COUNT(r.replyId) id FROM board b, topic t,reply r WHERE t.topicId=r.topicId AND r.borderId=b.boardId AND t.topicId="+i+"  GROUP BY r.topicContent";
		return super.query(sql,Num.class );
	}
	public List selectId(Integer id){
		String sql="SELECT * FROM reply WHERE topicId="+id;
		return super.query(sql, TopicInfo.class);
	}
	public List selectId(String topicContent,Integer id){
		String sql="SELECT * FROM reply WHERE topicContent='"+topicContent+"' and topicId="+id;
		return super.query(sql, TopicInfo.class);
	}
	public List selectDetails(Integer id){
		String sql="SELECT  m.memberId,m.memberName,m.memberIcon,m. isAdmin,m.isPass,m.isPower,t.topicId,t.topicContent topicCaption,t.publishTime,t.lastReplyDate,r.replyId,r.topicContent,m.regDate  FROM member m, topic t,reply r WHERE t.topicId=r.topicId AND r.memberId=m.memberId  AND t.topicId="+id+"  GROUP BY r.topicContent";
		return super.query(sql, Count.class);
	}
	public Integer add(ReplyInfo r) {
		// TODO Auto-generated method stub
		String sql="insert into reply values(0,?,?,?,?,now(),now())";
		List list=new ArrayList();
		list.add(r.getBoardId());
		list.add(r.getTopicId());
		list.add(r.getMemberId());
		list.add(r.getTopicContent());
		super.setParams(list);
		return super.update(sql);
	}
	//É¾³ý
	public Integer removeRep(Integer replyId){
		String sql="delete from reply where replyId="+replyId;
		return super.update(sql);
	}
	//ÐÞ¸Ä»ØÌû
	public Integer updateRep(Integer replyId,String topicContent){
		String sql="update reply set topicContent='"+topicContent+"' where replyId="+replyId;
		return super.update(sql);
	}
}
