package at.ac.tuwien.big.we15.lab2.api.impl;

import at.ac.tuwien.big.we15.lab2.api.Question;
import at.ac.tuwien.big.we15.lab2.api.Round;

public class SimpleRound implements Round{
	
	Question p1Question;

	public SimpleRound() {
		// TODO Auto-generated constructor stub
	}
	public void setQuestion(Question q){
		this.p1Question = q;
	}
	public Question getQuestion(){
		return p1Question;
	}
}
