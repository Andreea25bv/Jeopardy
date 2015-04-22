package at.ac.tuwien.big.we15.lab2.api;

public interface Game {
	
	public int getP1Money();
	public void setP1Money(int money);
	public int getP2Money();
	public void setP2Money(int money);
	public int getRoundNr();
	public void addRound(Round r);
	public Round getRound();

}
