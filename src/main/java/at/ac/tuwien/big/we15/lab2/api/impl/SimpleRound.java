package at.ac.tuwien.big.we15.lab2.api.impl;

import at.ac.tuwien.big.we15.lab2.api.Question;
import at.ac.tuwien.big.we15.lab2.api.Round;

public class SimpleRound implements Round{
	
	private Question p1Question;
	private Question computerQuestion;
	private String playerHasAnswerd;  //richtig or falsch
	private String computerHasAnswerd; //richtig or falsch

	public SimpleRound(Question q) {
		this.p1Question = q;
		this.computerQuestion = null;
		this.playerHasAnswerd = null;  
		this.computerHasAnswerd = null;
	}
	public void setQuestion(Question q){
		this.p1Question = q;
	}
	public void setCompQuestion(Question q){
		this.computerQuestion = q;
	}
	public Question getCompQuestion(){
		return computerQuestion;
	}
	public Question getQuestion(){
		return p1Question;
	}
	public void setPlayerHasAnswerd(String antwort){
		this.playerHasAnswerd = antwort;
	}
	public void setComputerHasAnswerd(String antwort){
		this.computerHasAnswerd = antwort;
	}
	@Override
	public String getPlayerHasAnswerd() {
		return this.playerHasAnswerd;
	}
	@Override
	public String getComputerHasAnswerd() {
		return this.computerHasAnswerd;
	}
	
}
