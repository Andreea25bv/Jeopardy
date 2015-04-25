package at.ac.tuwien.big.we15.lab2.api;

public interface Round {

	/**
	 * sets a new question for the human player
	 * @param q the new question
	 */
	public void setQuestion(Question q);
	
	/**
	 * 
	 * @return the question of the human player
	 */
	public Question getQuestion();
	
	/**
	 * sets the answer for the human player 
	 * @param antwort can be "richtig" or "falsch"
	 */
	public void setPlayerHasAnswerd(String antwort);
	
	/**
	 * sets the answer for the computer player 
	 * @param antwort can be "richtig" or "falsch"
	 */
	public void setComputerHasAnswerd(String antwort);
	
	/**
	 * 
	 * @return the human player answer
	 */
	public String getPlayerHasAnswerd();
	
	/**
	 * 
	 * @return the computer player answer
	 */
	public String getComputerHasAnswerd();
	
	/**
	 * sets a new question for the computer player
	 * @param q the new question to be set
	 */
	public void setCompQuestion(Question q);
	
	/**
	 * 
	 * @return the question of the computer player
	 */
	public Question getCompQuestion();

}
