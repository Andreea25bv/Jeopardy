/**
 * <copyright>
 *
 * Copyright (c) 2014 http://www.big.tuwien.ac.at All rights reserved. This
 * program and the accompanying materials are made available under the terms of
 * the Eclipse Public License v1.0 which accompanies this distribution, and is
 * available at http://www.eclipse.org/legal/epl-v10.html
 *
 * </copyright>
 */
package at.ac.tuwien.big.we15.lab2.api;



public interface JeopardyFactory {
	
	
	/**
	 * 
	 * @return a new Category
	 */
	public Category createCategory();
	
	
	/**
	 * 
	 * @return a new Question
	 */
	public Question createQuestion();
	
	/**
	 * 
	 * @return a new Answer
	 */
	public Answer createAnswer();
	
	/**
	 * 
	 * @return a new Player
	 */
	public Player createPlayer();
	
	/**
	 * 
	 * @param p1 the human player
	 * @param p2 the computer player
	 * @return a new Game 
	 */
	public Game createGame(Player p1, Player p2);

	
	public QuestionDataProvider createQuestionDataProvider();

}
