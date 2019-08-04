package com.entity;

import java.util.Date;

public class BoardInfo {
	private Integer boardId;
	private String boardName;
	private Date cateDate;
	private Integer forcumId;
	private Integer memberId;
	public Integer getBoardId() {
		return boardId;
	}
	public void setBoardId(Integer boardId) {
		this.boardId = boardId;
	}
	public String getBoardName() {
		return boardName;
	}
	public void setBoardName(String boardName) {
		this.boardName = boardName;
	}
	public Date getCateDate() {
		return cateDate;
	}
	public void setCateDate(Date cateDate) {
		this.cateDate = cateDate;
	}
	public Integer getForcumId() {
		return forcumId;
	}
	public void setForcumId(Integer forcumId) {
		this.forcumId = forcumId;
	}
	public Integer getMemberId() {
		return memberId;
	}
	public void setMemberId(Integer memberId) {
		this.memberId = memberId;
	}
	
}
