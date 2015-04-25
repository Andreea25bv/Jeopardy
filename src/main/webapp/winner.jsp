<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="game" scope="session" type="at.ac.tuwien.big.we15.lab2.api.Game" />
<jsp:useBean id="player" scope="session" type="at.ac.tuwien.big.we15.lab2.api.Player"/>

<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="de" lang="de">
    <head>
        <meta charset="utf-8"/>
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Business Informatics Group Jeopardy! - Gewinnanzeige</title>
        <link rel="stylesheet" type="text/css" href="style/base.css" />
        <link rel="stylesheet" type="text/css" href="style/screen.css" />
		  <script src="js/jquery.js" type="text/javascript"></script>
        <script src="js/framework.js" type="text/javascript"></script>
    </head>
    <body id="winner-page">
      <a class="accessibility" href="#winner">Zur Gewinnanzeige springen</a>
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
				<li><a class="orangelink navigationlink" id="logoutlink" title="Klicke hier um dich abzumelden" href="login.jsp" accesskey="l">Abmelden</a></li>
			</ul>
		</nav>
      
      <!-- Content -->
      <div role="main">
         <section id="gameinfo" aria-labelledby="winnerinfoheading">
            <h2 id="winnerinfoheading" class="accessibility">Gewinnerinformationen</h2>
            
            <% if(game.getRound().getPlayerHasAnswerd().equals("richtig")){%>
            <p class="user-info positive-change">Du hast richtig geantwortet: +<%=game.getRound().getQuestion().getValue()*10%> €</p>
           		 <%}else{%>
        	<p class="user-info negative-change">Du hast falsch geantwortet: -<%=game.getRound().getQuestion().getValue()*10%> €</p>
        		<%} %>
        	
            	<% if(game.getRound().getComputerHasAnswerd().equals("richtig")){%>      	
        	<p class="user-info positive-change"><%=game.getPlayer2().getName()%> hat richtig geantwortet: +<%=game.getRound().getCompQuestion().getValue()*10%> €</p>
          		 <%}else{ %>
            <p class="user-info negative-change"><%=game.getPlayer2().getName()%> hat falsch geantwortet: -<%=game.getRound().getCompQuestion().getValue()*10%> €</p>
           		<%} %>

           
            	
            	<%if(player.getMoney() > game.getPlayer2().getMoney()){ %>
           <section class="playerinfo leader" aria-labelledby="winnerannouncement">
               <h3 id="winnerannouncement">Gewinner: <%=player.getName()%></h3>
               <img class="avatar" src="img/avatar/<%=player.getAvatar().getImageFull()%>" alt="Spieler-Avatar <%=player.getName()%>" />
               <table>
                  <tr>
                     <th class="accessibility">Spielername</th>
                     <td class="playername"><%=player.getName()%></td>
                  </tr>
                  <tr>
                     <th class="accessibility">Spielerpunkte</th>
                     <td class="playerpoints">€ <%=player.getMoney() %></td>
                  </tr>
               </table>
            </section>
            <section class="playerinfo" aria-labelledby="loserheading">
               <h3 id="loserheading" class="accessibility">Verlierer: <%=game.getPlayer2().getName()%></h3>
               <img class="avatar" src="img/avatar/<%=game.getPlayer2().getAvatar().getImageHead() %>" alt="Spieler-Avatar <%=game.getPlayer2().getName()%>" />
               <table>
                  <tr>
                     <th class="accessibility">Spielername</th>
                     <td class="playername"><%=game.getPlayer2().getName()%></td>
                  </tr>
                  <tr>
                     <th class="accessibility">Spielerpunkte</th>
                     <td class="playerpoints">€ <%=game.getPlayer2().getMoney()%></td>
                  </tr>
               </table>
            </section>
            <%}else{ %>
           <section class="playerinfo leader" aria-labelledby="winnerannouncement">
            <h3 id="winnerannouncement">Gewinner: <%=game.getPlayer2().getName()%></h3>
               <img class="avatar" src="img/avatar/<%=game.getPlayer2().getAvatar().getImageFull()%>" alt="Spieler-Avatar <%=game.getPlayer2().getName()%>" />
               <table>
                  <tr>
                     <th class="accessibility">Spielername</th>
                     <td class="playername"><%=game.getPlayer2().getName()%></td>
                  </tr>
                  <tr>
                     <th class="accessibility">Spielerpunkte</th>
                     <td class="playerpoints">€ <%=game.getPlayer2().getMoney() %></td>
                  </tr>
               </table>
            </section>
            <section class="playerinfo" aria-labelledby="loserheading">
               <h3 id="loserheading" class="accessibility">Verlierer: <%=player.getName()%></h3>
               <img class="avatar" src="img/avatar/<%=player.getAvatar().getImageHead()%>" alt="Spieler-Avatar <%=player.getName()%>" />
               <table>
                  <tr>
                     <th class="accessibility">Spielername</th>
                     <td class="playername"><%=player.getName()%></td>
                  </tr>
                  <tr>
                     <th class="accessibility">Spielerpunkte</th>
                     <td class="playerpoints">€ <%=player.getMoney()%></td>
                  </tr>
               </table>
            </section>
            
            <%} %>
         <section id="newgame" aria-labelledby="newgameheading">
             <h2 id="newgameheading" class="accessibility">Neues Spiel</h2>
         	<form action="index" method="post">
               	<input class="clickable orangelink contentlink" id="new_game" type="submit" name="restart" value="Neues Spiel" />
            	<input type="hidden" name="whattodo" value="nextgame">
            </form>
         </section>
      </div>
        <!-- footer -->
        <footer role="contentinfo">© 2015 BIG Jeopardy</footer>  
		<script type="text/javascript">
        //<![CDATA[
           $(document).ready(function(){
         	   if(supportsLocalStorage()){
         		   localStorage["lastGame"] = new Date().getTime();
         	   }
           });
        //]]>
        </script>  
    </body>
</html>
