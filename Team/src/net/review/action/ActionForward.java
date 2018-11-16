package net.review.action;

public class ActionForward {
	// 이동방식 저장 변수
	private boolean isRedirect;
	// 이동경로 저장 변수
	private String path;
	
	public boolean isRedirect() {
		return isRedirect;
	}
	public void setRedirect(boolean isRedirect) {
		this.isRedirect = isRedirect;
	}
	public String getPath() {
		return path;
	}
	public void setPath(String path) {
		this.path = path;
	}
	
}
