package at.ac.tuwien.big.we15.lab2.api;

public interface Round {

	public void setQuestion(Question q);
	public Question getQuestion();
	public void setPlayerHasAnswerd(String antwort);
	public void setComputerHasAnswerd(String antwort);
	public String getPlayerHasAnswerd();
	public String getComputerHasAnswerd();
	public void setCompQuestion(Question q);
	public Question getCompQuestion();

}
