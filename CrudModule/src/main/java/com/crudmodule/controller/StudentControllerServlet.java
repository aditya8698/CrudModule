package com.crudmodule.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.crudmodule.dao.StudentDao;
import com.crudmodule.model.Student;

/**
 * Servlet implementation class StudentControllerServlet
 */
@WebServlet("/StudentControllerServlet")
public class StudentControllerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	StudentDao dao;
       
    @Override
	public void init() throws ServletException {
		dao = new StudentDao();
	}


	public StudentControllerServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			
			String s = request.getParameter("command");
			if(s == null) {
				s = "LIST";
			}
			
			switch (s) {
			case "LIST": {
				listStudent(request,response);
			}
			case "ADD": {
				addStudent(request,response);
			}
			case "LOAD":{
				loadStudent(request,response);
			}
			case "UPDATE":{
				updateStudent(request,response);
			}
			case "DELETE":{
				deleteStudent(request,response);
			}
			default:
				listStudent(request,response);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}


	private void deleteStudent(HttpServletRequest request, HttpServletResponse response) throws Exception{
		String aid = request.getParameter("id");
		
		dao.deleteStudent(aid);
		
		listStudent(request, response);
	}


	private void updateStudent(HttpServletRequest request, HttpServletResponse response) throws Exception{
		int id = Integer.parseInt(request.getParameter("id"));
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String city = request.getParameter("city");
		
		Student stud = new Student(id, name, email, city);
		dao.updateStudent(stud);
		
		listStudent(request, response);
	}


	private void loadStudent(HttpServletRequest request, HttpServletResponse response) throws Exception{
		String aid = request.getParameter("id");
		Student stud = dao.getStudentId(aid);
		request.setAttribute("student_inf", stud);
		RequestDispatcher rd = request.getRequestDispatcher("/update-form.jsp");
		rd.forward(request, response);
	}


	private void addStudent(HttpServletRequest request, HttpServletResponse response) throws Exception{
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String city = request.getParameter("city");
		
		Student theStudent = new Student(name, email, city);
		
		dao.addStudent(theStudent);
		
		listStudent(request,response);
	}


	private void listStudent(HttpServletRequest request, HttpServletResponse response) throws Exception{
		List<Student> students = dao.getStudent();
		request.setAttribute("STUDENT_LIST", students);
		RequestDispatcher rd = request.getRequestDispatcher("list-student.jsp");
		rd.forward(request, response);
	}

	
	
}
