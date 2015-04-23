package at.ac.tuwien.big.we15.lab2.api.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import at.ac.tuwien.big.we15.lab2.api.Game;
import at.ac.tuwien.big.we15.lab2.api.Player;
import at.ac.tuwien.big.we15.lab2.api.Question;
import at.ac.tuwien.big.we15.lab2.api.Round;

public class SimpleGame implements Game{
	
	private Player player1;
	private Player player2;
	private List<Round> rounds;
	private int p1Money;
	private int p2Money;
	
	
	public SimpleGame(Player p1, Player p2 ) {
		this.player1 = p1;
		this.player2 = p2;
		this.rounds = new ArrayList<Round>();
		this.p1Money = 0;
		this.p2Money = 0;
	}
	
	
	public boolean computerHasAnswered(){
		return new Random().nextBoolean();
		
	}
	public Player getPlayer1(){
		return player1;
	}
	public Player getPlayer2(){
		return player2;
	}
	
	public int getP1Money(){
		return p1Money;
	}
	public void setP1Money(int money){
		this.p1Money = money;
	}
	public int getP2Money(){
		return p2Money;
	}
	public void setP2Money(int money){
		this.p2Money = money;
	}
	public int getRoundNr(){
		return rounds.size();
	}
	public void addRound(Round r){
		this.rounds.add(r);
	}
	public Round getRound(){
		return rounds.get(rounds.size()-1);
	}
	

}
