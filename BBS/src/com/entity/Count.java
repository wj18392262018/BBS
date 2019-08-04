package com.entity;

import java.util.Date;

public class Count {
	private Integer memberId;
	private String memberName;
	private String memberIcon;
	private Integer isAdmin;
	private Integer isPass;
	private Integer isPower;
	private Integer topicId;
	private String topicCaption;
	private Date publishTime;
	private Date lastReplyDate;
	private Integer replyId;
	private String topicContent;
	private Date regDate;
	
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	public Integer getMemberId() {
		return memberId;
	}
	public void setMemberId(Integer memberId) {
		this.memberId = memberId;
	}
	public String getMemberName() {
		return memberName;
	}
	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}
	public String getMemberIcon() {
		return memberIcon;
	}
	public void setMemberIcon(String memberIcon) {
		this.memberIcon = memberIcon;
	}
	public Integer getIsAdmin() {
		return isAdmin;
	}
	public void setIsAdmin(Integer isAdmin) {
		this.isAdmin = isAdmin;
	}
	public Integer getIsPass() {
		return isPass;
	}
	public void setIsPass(Integer isPass) {
		this.isPass = isPass;
	}
	public Integer getIsPower() {
		return isPower;
	}
	public void setIsPower(Integer isPower) {
		this.isPower = isPower;
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
	
	public Date getPublishTime() {
		return publishTime;
	}
	public void setPublishTime(Date publishTime) {
		this.publishTime = publishTime;
	}
	public Date getLastReplyDate() {
		return lastReplyDate;
	}
	public void setLastReplyDate(Date lastReplyDate) {
		this.lastReplyDate = lastReplyDate;
	}
	public Integer getReplyId() {
		return replyId;
	}
	public void setReplyId(Integer replyId) {
		this.replyId = replyId;
	}
	public String getTopicContent() {
		return topicContent;
	}
	public void setTopicContent(String topicContent) {
		this.topicContent = topicContent;
	}
	
}