package at.ac.tuwien.big.we15.lab2.api;

public interface Player {

	/**
	 * Indicates wether other is equal to this Player.
	 * 
	 * @param other the other object to test for equality 
	 * @return true if other is equal to this player
	 */
	public boolean equals(Object other);
	
	/** 
	 * Retrives the a players name.
	 * 
	 * @return the players name
	 */
	public String getName();
	
	/**
	 * Sets a players name.
	 * 
	 * @param name the player name
	 */
	public void setName(String name);
}