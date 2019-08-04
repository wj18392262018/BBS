package com.entity;

import java.util.Date;

public class MemberInfo {
	private Integer memberId;
	private String memberName;
	private String memberPwd;
	private String memberIcon;
	private String memberGender;
	private Integer isAdmin;
	private Integer isPass;
	private Integer isPower;
	private Date regDate;
	
	public MemberInfo() {
		super();
	}
	public MemberInfo(String memberName, String memberPwd, String memberIcon,
			String memberGender) {
		super();
		this.memberName = memberName;
		this.memberPwd = memberPwd;
		this.memberIcon = memberIcon;
		this.memberGender = memberGender;
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
	public String getMemberPwd() {
		return memberPwd;
	}
	public void setMemberPwd(String memberPwd) {
		this.memberPwd = memberPwd;
	}
	public String getMemberIcon() {
		return memberIcon;
	}
	public void setMemberIcon(String memberIcon) {
		this.memberIcon = memberIcon;
	}
	public String getMemberGender() {
		return memberGender;
	}
	public void setMemberGender(String memberGender) {
		this.memberGender = memberGender;
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
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	
}
