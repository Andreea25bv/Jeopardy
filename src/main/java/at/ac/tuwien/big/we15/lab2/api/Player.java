package at.ac.tuwien.big.we15.lab2.api;

public interface Player {

	/**
	 * Indicates whether other is equal to this Player.
	 * 
	 * @param other the other object to test for equality 
	 * @return true if other is equal to this player
	 */
	public boolean equals(Object other);
	
	/** 
	 * 
	 * @return the players name
	 */
	public String getName();
	

	/**
	 * Sets a the money for the player
	 * 
	 * @param money
	 */
	public void setMoney(int money);
	
	/**
	 * 
	 * @return a players money
	 */
	public int getMoney();

	/**
	 * Sets the avatar for the player
	 * @param avatar
	 */
	public void setAvatar(Avatar avatar);
	
	/**
	 * Gets the avatar
	 * @return avatar
	 */
	public Avatar getAvatar();
	
	
	
}