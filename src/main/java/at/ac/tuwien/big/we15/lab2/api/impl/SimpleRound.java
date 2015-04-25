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
	
	
	/**
	 * sets a new question for the human player
	 * @param q the new question
	 */
	public void setQuestion(Question q){
		this.p1Question = q;
	}
	
	/**
	 * sets a new question for the computer player
	 * @param q the new question to be set
	 */
	public void setCompQuestion(Question q){
		this.computerQuestion = q;
	}
	
	/**
	 * 
	 * @return the question of the computer player
	 */
	public Question getCompQuestion(){
		return computerQuestion;
	}
	
	/**
	 * 
	 * @return the question of the human player
	 */
	public Question getQuestion(){
		return p1Question;
	}
	
	/**
	 * sets the answer for the human player 
	 * @param antwort can be "richtig" or "falsch"
	 */
	public void setPlayerHasAnswerd(String antwort){
		this.playerHasAnswerd = antwort;
	}
	
	/**
	 * sets the answer for the computer player 
	 * @param antwort can be "richtig" or "falsch"
	 */
	public void setComputerHasAnswerd(String antwort){
		this.computerHasAnswerd = antwort;
	}
	
	/**
	 * 
	 * @return the human player answer
	 */
	@Override
	public String getPlayerHasAnswerd() {
		return this.playerHasAnswerd;
	}
	
	/**
	 * 
	 * @return the computer player answer
	 */
	@Override
	public String getComputerHasAnswerd() {
		return this.computerHasAnswerd;
	}
	
}
