package com.entity;

public class Num {
	private String boardName;
	private double id;
	
	public Num() {
		super();
	}
	public Num(String boardName, double id) {
		super();
		this.boardName = boardName;
		this.id = id;
	}
	public String getBoardName() {
		return boardName;
	}
	public void setBoardName(String boardName) {
		this.boardName = boardName;
	}
	public double getId() {
		return id;
	}
	public void setId(double id) {
		this.id = id;
	}
	
}
