package com.dao;

import java.util.List;

import com.entity.BoardInfo;
import com.entity.Num;
import com.yq.dao.BaseDao;

public class BoardDao extends BaseDao {
	public List<BoardInfo> selectName(){
		String sql="SELECT * FROM board";
		return super.query(sql,BoardInfo.class );
	}
	/*public List selectNum(String name){
		String sql="SELECT b.boardId,b.boardName,b.cateDate,b.forcumId,b.memberId FROM board b, forcum f, member m WHERE b.forcumId=f.forcumId AND b.memberId=m.memberId AND m.memberName="+name;
		return super.query(sql,BoardInfo.class );
	}*/
	public List selectNum(){
		String sql="SELECT  b.boardName,COUNT(b.boardId) id FROM board b, topic t WHERE b.boardId=t.borderId GROUP BY b.boardName";
		return super.query(sql,Num.class );
	}
	public List<BoardInfo> selectName(Integer id){
		String sql="SELECT * FROM board where boardId="+id;
		return super.query(sql,BoardInfo.class );
	}
}
