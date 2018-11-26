package net.member.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface Action {
	//추상메서드 정의하기
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception;
}
