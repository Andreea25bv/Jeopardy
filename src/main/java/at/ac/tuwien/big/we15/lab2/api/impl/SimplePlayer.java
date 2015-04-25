package at.ac.tuwien.big.we15.lab2.api.impl;

import at.ac.tuwien.big.we15.lab2.api.Avatar;
import at.ac.tuwien.big.we15.lab2.api.Player;

public class SimplePlayer implements Player {

	private int money;
	private Avatar avatar;
	
	public SimplePlayer() {
		super();
		this.avatar = Avatar.getRandomAvatar();
		this.money = 0;
	}
	
	@Override
	public void setMoney(int money){
		this.money = money;
	}
	
	@Override
	public int getMoney(){
		return this.money;
	}
	
	@Override
	public boolean equals(Object other) {
		return other != null
				&& other.getClass() == this.getClass()
				&& ((SimplePlayer) other).getName().equals(getName());
	}

	@Override
	public String getName() {
		return avatar.getName();
	}
	
	@Override
	public void setAvatar(Avatar avatar){
		this.avatar = avatar;
	}
	
	@Override
	public Avatar getAvatar(){
		return this.avatar;
	}
}
