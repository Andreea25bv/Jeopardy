<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="at.ac.tuwien.big.we15.lab2.api.Game" %>
<%@page import="at.ac.tuwien.big.we15.lab2.api.Question" %>
<jsp:useBean id="game" scope="session" type="at.ac.tuwien.big.we15.lab2.api.Game" />

<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="de" lang="de">
    <head>
        <meta charset="utf-8"/>
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Business Informatics Group Jeopardy! - Fragenauswahl</title>
        <link rel="stylesheet" type="text/css" href="style/base.css" />
        <link rel="stylesheet" type="text/css" href="style/screen.css" />
        <script src="js/jquery.js" type="text/javascript"></script>
        <script src="js/framework.js" type="text/javascript"></script>
   </head>
   <body id="selection-page">
      <a class="accessibility" href="#question-selection">Zur Fragenauswahl springen</a>
      <!-- Header -->
      <header role="banner" aria-labelledby="bannerheading">
         <h1 id="bannerheading">
            <span class="accessibility">Business Informatics Group </span><span class="gametitle">Jeopardy!</span>
         </h1>
      </header>
      
      <!-- Navigation -->
		<nav role="navigation" aria-labelledby="navheading">
			<h2 id="navheading" class="accessibility">Navigation</h2>
			<ul>
				<li><a class="orangelink navigationlink" id="logoutlink" title="Klicke hier um dich abzumelden" href="#" accesskey="l">Abmelden</a></li>
			</ul>
		</nav>
      
      <!-- Content -->
      <div role="main"> 
         <!-- info -->
         <section id="gameinfo" aria-labelledby="gameinfoinfoheading">
            <h2 id="gameinfoinfoheading" class="accessibility">Spielinformationen</h2>
            <section id="firstplayer" class="playerinfo leader" aria-labelledby="firstplayerheading">
               <h3 id="firstplayerheading" class="accessibility">Führender Spieler</h3>
               <img class="avatar" src="img/avatar/black-widow_head.png" alt="Spieler-Avatar Black Widow" />
               <table>
                  <tr>
                     <th class="accessibility">Spielername</th>
                     <td class="playername">Black Widow (Du)</td>
                  </tr>
                  <tr>
                     <th class="accessibility">Spielerpunkte</th>
                     <td class="playerpoints"><%= game.getP1Money() %></td>
                  </tr>
               </table>
            </section>
            <section id="secondplayer" class="playerinfo" aria-labelledby="secondplayerheading">
               <h3 id="secondplayerheading" class="accessibility">Zweiter Spieler</h3>
               <img class="avatar" src="img/avatar/deadpool_head.png" alt="Spieler-Avatar Deadpool" />
               <table>
                  <tr>
                     <th class="accessibility">Spielername</th>
                     <td class="playername">Deadpool</td>
                  </tr>
                  <tr>
                     <th class="accessibility">Spielerpunkte</th>
                     <td class="playerpoints"><%= game.getP1Money() %></td>
                  </tr>
               </table>
            </section>
            <p id="round">Fragen: <%=game.getRoundNr() %>> / 10</p>
         </section>

         <!-- Question -->
         <section id="question-selection" aria-labelledby="questionheading">
            <h2 id="questionheading" class="black accessibility">Jeopardy</h2>
            <p class="user-info positive-change">Du hast richtig geantwortet: +1000 €</p>
            <p class="user-info negative-change">Deadpool hat falsch geantwortet: -500 €</p>
            <p class="user-info">Deadpool hat TUWIEN für € 1000 gewählt.</p>
            <form id="questionform" action="index" method="post">
               <fieldset>
               <legend class="accessibility">Fragenauswahl</legend>
               <section class="questioncategory" aria-labelledby="tvheading">
                  <h3 id="tvheading" class="tile category-title"><span class="accessibility">Kategorie: </span>Web Engineering</h3>
                  <ol class="category_questions">
                     <li><input name="question_selection" id="question_1" value="1 Web Engineering" type="radio" disabled="disabled" /><label class="tile clickable" for="question_1">€ 100</label></li>
                     <li><input name="question_selection" id="question_2" value="2 Web Engineering" type="radio"/><label class="tile clickable" for="question_2">€ 200</label></li>
                     <li><input name="question_selection" id="question_3" value="3 Web Engineering" type="radio"/><label class="tile clickable" for="question_3">€ 500</label></li>
                     <li><input name="question_selection" id="question_4" value="4 Web Engineering" type="radio"/><label class="tile clickable" for="question_4">€ 750</label></li>
                  </ol>
               </section>
               <section class="questioncategory" aria-labelledby="ssdheading">
                  <h3 id="ssdheading" class="tile category-title"><span class="accessibility">Kategorie: </span>TU Wien</h3>
                  <ol class="category_questions">
                     <li><input name="question_selection" id="question_5" value="1 TU Wien" type="radio" /><label class="tile clickable" for="question_5">€ 100</label></li>
                     <li><input name="question_selection" id="question_6" value="2 TU Wien" type="radio" /><label class="tile clickable" for="question_6">€ 200</label></li>
                     <li><input name="question_selection" id="question_7" value="3 TU Wien" type="radio" /><label class="tile clickable" for="question_7">€ 500</label></li>
                     <li><input name="question_selection" id="question_8" value="4 TU Wien" type="radio" /><label class="tile clickable" for="question_8">€ 750</label></li>
                     <li><input name="question_selection" id="question_9" value="5 TU Wien" type="radio" /><label class="tile clickable" for="question_9">€ 1000</label></li>
                  </ol>
               </section>
               <section class="questioncategory" aria-labelledby="webheading">
                  <h3 id="webheading" class="tile category-title"><span class="accessibility">Kategorie: </span>Semistrukturierte Daten</h3>
                  <ol class="category_questions">
                     <li><input name="question_selection" id="question_10" value="1 Semistrukturierte Daten" type="radio" /><label class="tile clickable" for="question_10">€ 100</label></li>
                     <li><input name="question_selection" id="question_11" value="2 Semistrukturierte Daten" type="radio" /><label class="tile clickable" for="question_11">€ 200</label></li>
                     <li><input name="question_selection" id="question_12" value="3 Semistrukturierte Daten" type="radio" disabled="disabled" /><label class="tile clickable" for="question_12">€ 500</label></li>
                     <li><input name="question_selection" id="question_13" value="4 Semistrukturierte Daten" type="radio" /><label class="tile clickable" for="question_13">€ 750</label></li>
                     <li><input name="question_selection" id="question_14" value="5 Semistrukturierte Daten" type="radio" /><label class="tile clickable" for="question_14">€ 1000</label></li>
                  </ol>
               </section>
               <section class="questioncategory" aria-labelledby="sportheading">
                  <h3 id="sportheading" class="tile category-title"><span class="accessibility">Kategorie: </span>Internet Technologien</h3>
                  <ol class="category_questions">
                     <li><input name="question_selection" id="question_15" value="1 Internet Technologien" type="radio" /><label class="tile clickable" for="question_15">€ 100</label></li>
                     <li><input name="question_selection" id="question_16" value="2 Internet Technologien" type="radio" disabled="disabled" /><label class="tile clickable" for="question_16">€ 200</label></li>
                     <li><input name="question_selection" id="question_17" value="3 Internet Technologien" type="radio" /><label class="tile clickable" for="question_17">€ 500</label></li>
                     <li><input name="question_selection" id="question_18" value="4 Internet Technologien" type="radio" /><label class="tile clickable" for="question_18">€ 750</label></li>
                  </ol>
               </section>
               <section class="questioncategory" aria-labelledby="tuwienheading">
                  <h3 id="tuwienheading" class="tile category-title"><span class="accessibility">Kategorie: </span>Internet</h3>
                  <ol class="category_questions">
                     <li><input name="question_selection" id="question_19" value="1 Internet" type="radio" /><label class="tile clickable" for="question_19">€ 100</label></li>
                     <li><input name="question_selection" id="question_20" value="2 Internet" type="radio" /><label class="tile clickable" for="question_20">€ 200</label></li>
                     <li><input name="question_selection" id="question_21" value="3 Internet" type="radio" /><label class="tile clickable" for="question_21">€ 500</label></li>
                     <li><input name="question_selection" id="question_22" value="4 Internet" type="radio" /><label class="tile clickable" for="question_22">€ 750</label></li>
                     <li><input name="question_selection" id="question_23" value="5 Internet" type="radio" disabled="disabled" /><label class="tile clickable" for="question_23">€ 1000</label></li>
                  </ol>
               </section> 
               </fieldset>               
               <input class="greenlink formlink clickable" name="question_submit" id="next" type="submit" value="wählen" accesskey="s" />
               <input type="hidden" action="whattodo" value="waelen" />
            </form>
         </section>
         
         <section id="lastgame" aria-labelledby="lastgameheading">
            <h2 id="lastgameheading" class="accessibility">Letztes Spielinfo</h2>
            <p>Letztes Spiel: Nie</p>
         </section>
		</div>
		
      <!-- footer -->
      <footer role="contentinfo">© 2015 BIG Jeopardy!</footer>
	  
	  <script type="text/javascript">
            //<![CDATA[
            
            // initialize time
            $(document).ready(function() {
                // set last game
                if(supportsLocalStorage()) {
	                var lastGameMillis = parseInt(localStorage['lastGame'])
	                if(!isNaN(parseInt(localStorage['lastGame']))){
	                    var lastGame = new Date(lastGameMillis);
	                	$("#lastgame p").replaceWith('<p>Letztes Spiel: <time datetime="'
	                			+ lastGame.toUTCString()
	                			+ '">'
	                			+ lastGame.toLocaleString()
	                			+ '</time></p>')
	                }
            	}
            });            
            //]]>
        </script>
    </body>
</html>
