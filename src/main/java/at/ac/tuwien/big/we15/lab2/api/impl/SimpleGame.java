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
	
	
	public SimpleGame(Player p1, Player p2 ) {
		this.player1 = p1;
		this.player2 = p2;
		this.rounds = new ArrayList<Round>();
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
	
	public int getRoundNr(){
		return rounds.size();
	}
	public void addRound(Round r){
		this.rounds.add(r);
	}
	public Round getRound(){
		return rounds.get(rounds.size()-1);
	}
	
	/**
	 * checks the availability of a Particular Question in all Rounds.
	 * @param the Question you want to check if available
	 * @return false, (if the Question is available in a Round) if the question was already chosen .
	 * 			true, (if the Question is not in any Round)if the question was not chosen(is available).
	 */
	public boolean checkQuestionAvailability(Question q){
		boolean available = true;
		Question playerQ = null;
		Question computerQ = null;
		
		for(int i=0; i <= rounds.size()-2; i++){
			playerQ = rounds.get(i).getQuestion();
			computerQ = rounds.get(i).getCompQuestion();
				
			if((playerQ.getValue() == q.getValue()) && (playerQ.getCategory().getName().equals(q.getCategory().getName()))){
				available = false;
			}
			if((computerQ.getValue() == q.getValue()) && (computerQ.getCategory().getName().equals(q.getCategory().getName()))){
				available = false;
			}
		}
		if(available == true){
			playerQ = rounds.get(rounds.size()-1).getQuestion();
					
			if((playerQ.getValue() == q.getValue()) && (playerQ.getCategory().getName().equals(q.getCategory().getName()))){
				available = false;
			}
		}
			
		return available;
	}
	
	
	/**
	 * checks the availability of a Particular Question in all Rounds.
	 * @param nr: int, the question number defined in the jsp document per category
	 * 		  nr element of [1,2,3,4,5]
	 * @param category: String, the Category of the Question
	 * @return true, if the Question is available in a Round.
	 * 			false, if the Question is not in any Round.
	 */
	public boolean checkQuestionAvailability(int nr, String category){
		boolean available = false;
		Question playerQ = null;
		Question computerQ = null;
		
		for(Round round:rounds){
			playerQ = round.getQuestion();
			computerQ = round.getCompQuestion();
				
			if(playerQ.getCategory().getName().equals(category)){
				if((playerQ.getValue()/10) == nr){
					available = true;
				}
			}
			if(computerQ.getCategory().getName().equals(category)){
				if((computerQ.getValue()/10) == nr){
					available = true;
				}
			}
			
		}
		return available;
	}
	
}
