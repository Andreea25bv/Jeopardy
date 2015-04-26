<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="at.ac.tuwien.big.we15.lab2.api.Answer"%>
<jsp:useBean id="game" scope="session" type="at.ac.tuwien.big.we15.lab2.api.Game" />
<jsp:useBean id="player" scope="session" type="at.ac.tuwien.big.we15.lab2.api.Player"/>

    
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="de" lang="de">
    <head>
        <meta charset="utf-8"/>
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Business Informatics Group Jeopardy! - Fragenbeantwortung</title>
        <link rel="stylesheet" type="text/css" href="style/base.css" />
        <link rel="stylesheet" type="text/css" href="style/screen.css" />
        <script src="js/jquery.js" type="text/javascript"></script>
        <script src="js/framework.js" type="text/javascript"></script>
    </head>
    <body id="questionpage">
      <a class="accessibility" href="#questions">Zur Fragenauswahl springen</a>
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
				<li><a class="orangelink navigationlink" id="logoutlink" title="Klicke hier um dich abzumelden" href="login.jsp?whattodo=logout" accesskey="l">Abmelden</a></li>
			</ul>
		</nav>
      
      <!-- Content -->
      <div role="main"> 
         <!-- info -->
         <section id="gameinfo" aria-labelledby="gameinfoinfoheading">
            <h2 id="gameinfoinfoheading" class="accessibility">Spielinformationen</h2>
            <section id="firstplayer" class="playerinfo leader" aria-labelledby="firstplayerheading">
               <h3 id="firstplayerheading" class="accessibility">Führender Spieler</h3>
               <img class="avatar" src="img/avatar/<%= player.getAvatar().getImageHead() %>" alt="Spieler-Avatar <%= player.getName() %>" />
               <table>
                  <tr>
                     <th class="accessibility">Spielername</th>
                     <td class="playername"><%= player.getName() %> (Du)</td>
                  </tr>
                  <tr>
                     <th class="accessibility">Spielerpunkte</th>
                     <td class="playerpoints">€ <%= player.getMoney() %></td>
                  </tr>
               </table>
            </section>
            <section id="secondplayer" class="playerinfo" aria-labelledby="secondplayerheading">
               <h3 id="secondplayerheading" class="accessibility">Zweiter Spieler</h3>
               <img class="avatar" src="img/avatar/<%= game.getPlayer2().getAvatar().getImageHead() %>" alt="Spieler-Avatar <%= game.getPlayer2().getName() %>" />
               <table>
                  <tr>
                     <th class="accessibility">Spielername</th>
                     <td class="playername"><%= game.getPlayer2().getName() %></td>
                  </tr>
                  <tr>
                     <th class="accessibility">Spielerpunkte</th>
                     <td class="playerpoints">€ <%= game.getPlayer2().getMoney() %></td>
                  </tr>
               </table>
            </section>
            <p id="round">Frage: <%=game.getRoundNr() %> / 10</p>
         </section>
            
      <!-- Question -->
      <section id="question" aria-labelledby="questionheading">
            <form id="questionform" action="index" method="post">
               <h2 id="questionheading" class="accessibility">Frage</h2>
               <p id="questiontype"><%=game.getRound().getQuestion().getCategory().getName() %> für € <%=game.getRound().getQuestion().getValue()*10 %></p>
               
               <p id="questiontext"><%=game.getRound().getQuestion().getText()%></p>
               <ul id="answers">
               		<%int count =0; %>
               		<%for(Answer a : game.getRound().getQuestion().getAllAnswers()){ %>
               			<% count++; %>
                        <li><input name="answers" id="answer_<%= count %>" value=<%= a.getId()%> type="checkbox"/><label class="tile clickable" for="answer_<%= count %>"> <%= a.getText() %></label></li>

               		<%}%>
               </ul>
               <input id="timeleftvalue" type="hidden" value="100"/>
               <input class="greenlink formlink clickable" name="answer_submit" id="next" type="submit" value="antworten" accesskey="s"/>
               <input type ="hidden" name="whattodo" value="answerd" />
            </form>
         </section>
            
         <section id="timer" aria-labelledby="timerheading">
            <h2 id="timerheading" class="accessibility">Timer</h2>
            <p><span id="timeleftlabel">Verbleibende Zeit:</span> <time id="timeleft">00:30</time></p>
            <meter id="timermeter" min="0" low="20" value="100" max="100"/>
         </section>
      </div>

      <!-- footer -->
      <footer role="contentinfo">© 2015 BIG Jeopardy!</footer>
        
      <script type="text/javascript">
            //<![CDATA[
            
            // initialize time
            $(document).ready(function() {
                var maxtime = 30;
                var hiddenInput = $("#timeleftvalue");
                var meter = $("#timer meter");
                var timeleft = $("#timeleft");
                
                hiddenInput.val(maxtime);
                meter.val(maxtime);
                meter.attr('max', maxtime);
                meter.attr('low', maxtime/100*20);
                timeleft.text(secToMMSS(maxtime));
            });
            
            // update time
            function timeStep() {
                var hiddenInput = $("#timeleftvalue");
                var meter = $("#timer meter");
                var timeleft = $("#timeleft");
                
                var value = $("#timeleftvalue").val();
                if(value > 0) {
                    value = value - 1;   
                }
                
                hiddenInput.val(value);
                meter.val(value);
                timeleft.text(secToMMSS(value));
                
                if(value <= 0) {
                    $('#questionform').submit();
                }
            }
            
            window.setInterval(timeStep, 1000);
            
            //]]>
        </script>
    </body>
</html>
