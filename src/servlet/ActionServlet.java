package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.QuestionDao;
import entity.Question;
import entity.User;

public class ActionServlet extends HttpServlet{
	
	public void service(HttpServletRequest request, HttpServletResponse response)
	throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out=response.getWriter();
		String uri=request.getRequestURI();
		HttpSession session=request.getSession();
		String action=uri.substring(uri.lastIndexOf("/"),uri.lastIndexOf("."));
		
		if(action.equals("/login")){
			String username=request.getParameter("username");
			String password=request.getParameter("password");
			User u=new User();
			u.setUsername(username);
			u.setPassword(password);
			
			session.setAttribute("user",u);//绑定user到session中
			if(username!=""){
				
				request.setAttribute("username", username);
				request.getRequestDispatcher("welcome.jsp").forward(request, response);
			}
		}else if(action.equals("/list")){
			
			//System.out.println("试题列表");
			QuestionDao dao=new QuestionDao();
			List<Question> questions =dao.findAllQuestions();
			
			request.setAttribute("questions", questions);
			
			request.getRequestDispatcher("list.jsp").forward(request, response);
			
		}else if(action.equals("/dianZan")){
			String index=request.getParameter("index");
			User user=(User) session.getAttribute("user");
			System.out.println("当前用户是:"+user.getUsername()+" 题号是:"+index);
			out.print("ok");
		}
	}
}
