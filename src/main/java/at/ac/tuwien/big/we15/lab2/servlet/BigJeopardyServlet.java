package at.ac.tuwien.big.we15.lab2.servlet;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import at.ac.tuwien.big.we15.lab2.api.Answer;
import at.ac.tuwien.big.we15.lab2.api.Category;
import at.ac.tuwien.big.we15.lab2.api.Game;
import at.ac.tuwien.big.we15.lab2.api.Player;
import at.ac.tuwien.big.we15.lab2.api.JeopardyFactory;
import at.ac.tuwien.big.we15.lab2.api.Question;
import at.ac.tuwien.big.we15.lab2.api.QuestionDataProvider;
import at.ac.tuwien.big.we15.lab2.api.Round;
import at.ac.tuwien.big.we15.lab2.api.impl.JSONQuestionDataProvider;
import at.ac.tuwien.big.we15.lab2.api.impl.ServletJeopardyFactory;
import at.ac.tuwien.big.we15.lab2.api.impl.SimpleGame;
import at.ac.tuwien.big.we15.lab2.api.impl.SimplePlayer;
import at.ac.tuwien.big.we15.lab2.api.impl.SimpleQuestion;
import at.ac.tuwien.big.we15.lab2.api.impl.SimpleRound;

public class BigJeopardyServlet extends HttpServlet {
	

	private JeopardyFactory jeopardyFactory;
	
	private Player computerPlayer; 
	
	private List<Category> categories;

	@Override
	public void init() throws ServletException {
		super.init();
		
		this.jeopardyFactory = new ServletJeopardyFactory(this.getServletContext());
		this.computerPlayer = null;
		this.categories = jeopardyFactory.createQuestionDataProvider().getCategoryData();
	}


	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws IOException, ServletException {
		
		String action = request.getParameter("whattodo");  

		HttpSession session = request.getSession(true);
				
				
		if(action.equals("answerd")){
			
			Game current_game = (SimpleGame) session.getAttribute("game");
			List<Answer> chosen = new ArrayList<Answer>();
			
			//request.getParameter("answers") i am not sure what returns
			//String list = request.getParameter("answers");
			
			//is answers not answer...but there are problems when i use answers
			while(request.getParameter("answer") != null ){
				int value = Integer.parseInt(request.getParameter("answer"));
				chosen.add(current_game.getRound().getQuestion().getAllAnswers().get(value-1));
			}
			
			
			if(current_game.getRound().getQuestion().check(chosen)){
				current_game.setP1Money(current_game.getP1Money()+(current_game.getRound().getQuestion().getValue()*10));
				current_game.getRound().setPlayerHasAnswerd("richtig");
			}
			else{
				current_game.setP1Money(current_game.getP1Money()-(current_game.getRound().getQuestion().getValue()*10));
				current_game.getRound().setPlayerHasAnswerd("falsch");
			}
			
			
			Question computer_question = this.choseQuestionRandom(); //the chosen question can not be disabled TODO
			current_game.getRound().setCompQuestion(computer_question);
			if(current_game.computerHasAnswered()){
				current_game.setP2Money(current_game.getP2Money()+(computer_question.getValue()*10));
				current_game.getRound().setComputerHasAnswerd("richtig");
			}
			else{
				current_game.setP2Money(current_game.getP2Money()-(computer_question.getValue()*10));
				current_game.getRound().setComputerHasAnswerd("falsch");
			}
			
			//disable question and computer_question in jeopardy.jsp TODO
			
			if(current_game.getRoundNr() == 10){
				//winner page
				RequestDispatcher rd = request.getRequestDispatcher("winner.jsp"); 
				rd.forward(request, response);
			}
			else{
				//jeopardy page
				RequestDispatcher rd = request.getRequestDispatcher("jeopardy.jsp"); 
				rd.forward(request, response);
			}
			
		}
		
	}
	
	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws IOException, ServletException {
		
		// get the input symbol
		String action = request.getParameter("whattodo");  

		HttpSession session = request.getSession(true);
				
				
		if (action == null) {
			//login page
			RequestDispatcher rd = request.getRequestDispatcher("login.jsp"); 
			rd.forward(request, response);
		}
		else if(action.equals("login")){
			
			Player player = jeopardyFactory.createPlayer();
			Game game = jeopardyFactory.createGame(player,computerPlayer);
			
			session.setAttribute("game", game);
			session.setAttribute("player", player);
			
			//jeopardy page
			RequestDispatcher rd = request.getRequestDispatcher("jeopardy.jsp"); 
			rd.forward(request, response);
		}
		else if(action.equals("waelen")){
			
			Game current = (SimpleGame) session.getAttribute("game");
			
			String question_property = request.getParameter("question_selection");  //returns the input value from the jsp file
			int value = Integer.parseInt(""+question_property.charAt(0))*10;  
			String category_name = question_property.substring(2);

			Question question = new SimpleQuestion();
			for(Category c : categories){
				if(c.getName().equals(category_name)){
					question = c.getQuestionRandom(value);
				}
			}
			Round round = new SimpleRound(question);
			current.addRound(round);

			//question page
			RequestDispatcher rd = request.getRequestDispatcher("question.jsp");
			rd.forward(request, response);
			
		}
		else if(action.equals("nextgame")){
			
			Player player = (SimplePlayer) session.getAttribute("player");
			Game game = jeopardyFactory.createGame(player,computerPlayer);
			
			session.setAttribute("game", game);
			
			//jeopardy page
			RequestDispatcher rd = request.getRequestDispatcher("jeopardy.jsp"); 
			rd.forward(request, response);
		}
		
	}
	
	private Question choseQuestionRandom(){
		int category_random = new Random().nextInt(5);  // 0,1,2,3 or 4
		int value_random=0;
		if(category_random == 1 || category_random == 4){
			value_random = new Random().nextInt(4)+1;  // 1,2,3 or 4
		}
		else{
			value_random = new Random().nextInt(5)+1;  // 1,2,3,4 or 5
		}
		
		return categories.get(category_random).getQuestionRandom(value_random*10);
		
	}
	
	
}
