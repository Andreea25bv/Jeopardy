package at.ac.tuwien.big.we15.lab2.api.impl;

import at.ac.tuwien.big.we15.lab2.api.Player;

public class SimplePlayer implements Player {

	private String name;
	
	public SimplePlayer() {
		super();
	}
	
	@Override
	public boolean equals(Object other) {
		return other != null
				&& other.getClass() == this.getClass()
				&& ((SimplePlayer) other).name.equals(name);
	}

	@Override
	public String getName() {
		return name;
	}

	@Override
	public void setName(String name) {
		this.name = name;
	}
}
