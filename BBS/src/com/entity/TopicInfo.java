package com.entity;

import java.util.Date;

public class TopicInfo {
	private Integer topicId;
	private String topicCaption;
	private String topicContent;
	private Integer borderId;
	private Integer memberId;
	private Integer isGood;
	private Date publishTime;
	private Date modifyTime;
	private String lastReplyUser;
	private Date lastReplyDate;
	
	public TopicInfo() {
		super();
	}
	public TopicInfo(String topicCaption, String topicContent,
			String lastReplyUser) {
		super();
		this.topicCaption = topicCaption;
		this.topicContent = topicContent;
		this.lastReplyUser = lastReplyUser;
	}
	
	public TopicInfo(String topicCaption, String topicContent,
			Integer borderId, Integer memberId, String lastReplyUser) {
		super();
		this.topicCaption = topicCaption;
		this.topicContent = topicContent;
		this.borderId = borderId;
		this.memberId = memberId;
		this.lastReplyUser = lastReplyUser;
	}
	public Integer getTopicId() {
		return topicId;
	}
	public void setTopicId(Integer topicId) {
		this.topicId = topicId;
	}
	public String getTopicCaption() {
		return topicCaption;
	}
	public void setTopicCaption(String topicCaption) {
		this.topicCaption = topicCaption;
	}
	public String getTopicContent() {
		return topicContent;
	}
	public void setTopicContent(String topicContent) {
		this.topicContent = topicContent;
	}
	
	public Integer getBorderId() {
		return borderId;
	}
	public void setBorderId(Integer borderId) {
		this.borderId = borderId;
	}
	public Integer getMemberId() {
		return memberId;
	}
	public void setMemberId(Integer memberId) {
		this.memberId = memberId;
	}
	public Integer getIsGood() {
		return isGood;
	}
	public void setIsGood(Integer isGood) {
		this.isGood = isGood;
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
	public String getLastReplyUser() {
		return lastReplyUser;
	}
	public void setLastReplyUser(String lastReplyUser) {
		this.lastReplyUser = lastReplyUser;
	}
	public Date getLastReplyDate() {
		return lastReplyDate;
	}
	public void setLastReplyDate(Date lastReplyDate) {
		this.lastReplyDate = lastReplyDate;
	}
	
}
