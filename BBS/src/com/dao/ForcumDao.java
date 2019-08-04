package com.dao;

import java.util.List;

import com.entity.ForcumInfo;
import com.yq.dao.BaseDao;

public class ForcumDao extends BaseDao {
	public List selectName(){
		String sql="select * from forcum";
		return super.query(sql, ForcumInfo.class);
	}
}
