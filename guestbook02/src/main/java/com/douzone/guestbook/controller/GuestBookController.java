package com.douzone.guestbook.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.douzone.guestbook.dao.GuestBookDao;
import com.douzone.guestbook.vo.GuestBookVo;

public class GuestBookController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public GuestBookController() {
		// TODO Auto-generated constructor stub
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// post 방식으로 전달받는 파라미터 값의 엔코딩 처리
		request.setCharacterEncoding("utf-8");
		String action = request.getParameter("a");
		// String noaction = request.getParameter("no");

		if ("delete".equals(action)) {
			System.out.println("delete!!");
			String password = request.getParameter("password");
			Integer no = Integer.parseInt(request.getParameter("no"));

			new GuestBookDao().Delete(no, password);
			response.sendRedirect(request.getContextPath() + "/gb");

		} else if (("deleteform").equals(action)) {

			// noaction = request.getParameter("no");
			// noaction = request.getAttribute(noaction);

			// 3. view로 포워딩
			System.out.println("deleteform!!");
			RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/deleteform.jsp");
			rd.forward(request, response);

		} else if ("add".equals(action)) {
			System.out.println("add!!");
			SimpleDateFormat format1 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			Date time = new Date();
			String name = request.getParameter("name");
			String password = request.getParameter("password");
			String message = request.getParameter("message");
			String regdate = format1.format(time);

			GuestBookVo vo = new GuestBookVo();
			vo.setName(name);
			vo.setPassword(password);
			vo.setMessage(message);
			vo.setRegDate(regdate);
			new GuestBookDao().insert(vo);

			// 2 redirect 응답
			response.sendRedirect(request.getContextPath() + "/gb");

		} else {
			/* default request(action) */
			// 1. 요청처리
			List<GuestBookVo> list = new GuestBookDao().findAll();
			// 2. request범위에 데이터(객체) 저장
			request.setAttribute("list", list);
			// 3. view로 포워딩
			RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/index.jsp");
			rd.forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}