package com.crudmodule.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;

import com.crudmodule.model.Student;

public class StudentDao {

	private String jdbcUrl = "jdbc:mysql://localhost:3306/db1";
	private String jdbcUname = "root";
	private String jdbcPass = "Aditya@20";
	
	public Connection getConnection() {
		Connection con = null;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection(jdbcUrl, jdbcUname, jdbcPass);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return con;
	}
	
	public List<Student> getStudent(){
		List<Student> students = new ArrayList<Student>();
		try {
			Connection con = getConnection();
			String LIST_SQL = "select * from student";
			PreparedStatement st = con.prepareStatement(LIST_SQL);
			ResultSet rs = st.executeQuery();
			while(rs.next()) {
				int id = rs.getInt("id");
				String name = rs.getString("name");
				String email = rs.getString("email");
				String city = rs.getString("city");
				
				Student tempStudent = new Student(id, name, email, city);
				
				students.add(tempStudent);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return students;
	}

	public void addStudent(Student theStudent) throws Exception{
		Connection con = getConnection();
		String ADD_SQL = "insert into student (name,email,city)values (?,?,?)";
		PreparedStatement st = con.prepareStatement(ADD_SQL);
		st.setString(1, theStudent.getName());
		st.setString(2, theStudent.getEmail());
		st.setString(3, theStudent.getCity());
		st.executeUpdate();
	}

	public Student getStudentId(String aid) throws Exception{
		Student theStud = null;
		int ids = Integer.parseInt(aid);
		Connection con = getConnection();
		String GET_SQL = "select * from student where id=?";
		PreparedStatement st = con.prepareStatement(GET_SQL);
		st.setInt(1, ids);
		ResultSet rs = st.executeQuery();
		while(rs.next()) {
			String name = rs.getString("name");
			String email = rs.getString("email");
			String city = rs.getString("city");
			theStud = new Student(name, email, city);
		}
		return theStud;
	}

	public void updateStudent(Student stud) throws Exception{
		Connection con = getConnection();
		String UPDATE_SQL = "update student set name=?,email=?,city=? where id=?";
		PreparedStatement st = con.prepareStatement(UPDATE_SQL);
		st.setString(1, stud.getName());
		st.setString(2, stud.getEmail());
		st.setString(3, stud.getCity());
		st.setInt(4, stud.getId());
		st.executeUpdate();
	}

	public void deleteStudent(String aid) throws Exception{
		int sid = Integer.parseInt(aid);
		Connection con = getConnection();
		String DELETE_SQL = "delete from student where id=?";
		PreparedStatement st = con.prepareStatement(DELETE_SQL);
		st.setInt(1, sid);
		st.executeUpdate();
	}
	
}
