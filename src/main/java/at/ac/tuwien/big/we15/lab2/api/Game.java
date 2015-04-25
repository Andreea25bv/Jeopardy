package at.ac.tuwien.big.we15.lab2.api;

public interface Game {
	
	/**
	 * 
	 * @return the number of played rounds; 
	 */
	public int getRoundNr();
	
	/**
	 * add a new round 
	 * @param r is the new Round to insert;
	 */
	public void addRound(Round r);
	
	/**
	 * 
	 * @return the last played round
	 */
	public Round getRound();
	
	/**
	 * 
	 * @return true, when the computer will answer correct to a question
	 * 			false, otherwise
	 */
	public boolean computerHasAnswered();
	
	/**
	 * 
	 * @return the human player
	 */
	public Player getPlayer1();
	
	/**
	 * 
	 * @return the computer Player
	 */
	public Player getPlayer2();
	
	/**
	 * 
	 * @param q the chosen question to check for availability 
	 * @return true, if the question was not chosen till now(is available).
	 * 			false, if the question was already chosen .
	 */
	public boolean checkQuestionAvailability(Question q);
	
	/**
	 * checks the availability of a Particular Question in all Rounds.
	 * @param nr: int, the question number defined in the jsp document per category
	 * 		  nr element of [1,2,3,4,5]
	 * @param category: String, the Category of the Question
	 * @return true, if the Question is available in a Round.
	 * 			false, if the Question is not in any Round.
	 */
	public boolean checkQuestionAvailability(int nr, String category);

}
