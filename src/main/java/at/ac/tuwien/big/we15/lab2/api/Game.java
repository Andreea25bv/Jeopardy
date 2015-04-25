package at.ac.tuwien.big.we15.lab2.api;

public interface Game {
	
	public int getRoundNr();
	public void addRound(Round r);
	public Round getRound();
	public boolean computerHasAnswered();
	public Player getPlayer1();
	public Player getPlayer2();
	public boolean checkQuestionAvailability(Question q);
	public boolean checkQuestionAvailability(int nr, String category);

}
