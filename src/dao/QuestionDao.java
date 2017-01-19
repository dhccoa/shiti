package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import util.DBUtil;
import entity.Question;

public class QuestionDao {
	private String[] answer={"A","B","C","D"};
	public List<Question> findAllQuestions(){
		List<Question> questions=new ArrayList<Question>();
		Connection conn=null;
		try {
			conn=DBUtil.getConnection();
			String sql="select * from question";
			PreparedStatement ps=conn.prepareStatement(sql);
			ResultSet rs=ps.executeQuery();
			while(rs.next()){
				
				Question question=new Question();
				question.setId(rs.getInt("f_id"));
				question.setTitle(rs.getString("f_title"));
				String a=answer[rs.getInt("f_correct_index")-1];
				question.setAnswer(a);
				String answer1=rs.getString("f_answer_1");
				String answer2=rs.getString("f_answer_2");
				String answer3=rs.getString("f_answer_3");
				String answer4=rs.getString("f_answer_4");
				question.setOptionA(answer1);
				question.setOptionB(answer2);
				question.setOptionC(answer3);
				question.setOptionD(answer4);
				questions.add(question);
				
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			DBUtil.close(conn);
		}
		
		return questions;
	}
	//测试连接
	public static void main(String[] args){
		QuestionDao dao=new QuestionDao();
		List<Question> questions=dao.findAllQuestions();
		//System.out.println(questions.get(0).getOptions().get(0));
	}
	
}
