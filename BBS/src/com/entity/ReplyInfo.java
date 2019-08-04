package com.entity;

import java.util.Date;

public class ReplyInfo {
	private Integer replyId;
	private Integer boardId;
	private Integer topicId;
	private Integer memberId;
	private String topicContent;
	private Date publishTime;
	private Date modifyTime;
	
	public ReplyInfo() {
		super();
	}
	public ReplyInfo(Integer boardId, Integer topicId, Integer memberId,
			String topicContent) {
		super();
		this.boardId = boardId;
		this.topicId = topicId;
		this.memberId = memberId;
		this.topicContent = topicContent;
	}
	public Integer getReplyId() {
		return replyId;
	}
	public void setReplyId(Integer replyId) {
		this.replyId = replyId;
	}
	public Integer getBoardId() {
		return boardId;
	}
	public void setBoardId(Integer boardId) {
		this.boardId = boardId;
	}
	public Integer getTopicId() {
		return topicId;
	}
	public void setTopicId(Integer topicId) {
		this.topicId = topicId;
	}
	public Integer getMemberId() {
		return memberId;
	}
	public void setMemberId(Integer memberId) {
		this.memberId = memberId;
	}
	public String getTopicContent() {
		return topicContent;
	}
	public void setTopicContent(String topicContent) {
		this.topicContent = topicContent;
	}
	public Date getPublishTime() {
		return publishTime;
	}
	public void setPublishTime(Date publishTime) {
		this.publishTime = publishTime;
	}
	public Date getModifyTime() {
		return modifyTime;
	}
	public void setModifyTime(Date modifyTime) {
		this.modifyTime = modifyTime;
	}
	
}
