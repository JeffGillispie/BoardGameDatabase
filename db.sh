#!/bin/bash

sqlite3 game.db  "CREATE TABLE "Categories" ( 'CategoryID' INTEGER, 'Name' TEXT NOT NULL UNIQUE, PRIMARY KEY('CategoryID') );

CREATE TABLE "Events" ( 'EventID' INTEGER, 'Name' TEXT NOT NULL, 'Description' TEXT, 'LocationID' INTEGER NOT NULL, 'OwnerID' INTEGER NOT NULL, 'OwnerTypeID' INTEGER NOT NULL, 'Date' TEXT, PRIMARY KEY('EventID') );

CREATE TABLE 'FavoriteGames' ( 'UserID' INTEGER, 'GameID' INTEGER, PRIMARY KEY('UserID','GameID') );

CREATE TABLE "Games" ( 'GameID' INTEGER, 'Name' TEXT NOT NULL, 'Description' TEXT, 'MSRP' REAL, 'MinimumPlayers' INTEGER, 'MaximumPlayers' INTEGER, 'RecommendedAge' INTEGER, 'CategoryID' INTEGER NOT NULL, 'AvgGameLengthMin' INTEGER, 'Image' BLOB, PRIMARY KEY('GameID') );

CREATE TABLE 'GroupGames' ( 'GroupID' INTEGER, 'GameID' INTEGER, PRIMARY KEY('GroupID','GameID') );

CREATE TABLE "Groups" ( 'GroupID' INTEGER, 'Name' TEXT NOT NULL, 'Description' TEXT, 'CreatedBy' INTEGER, PRIMARY KEY('GroupID') );

CREATE TABLE "Locations" ( 'LocationID' INTEGER, 'Name' TEXT NOT NULL, 'Address' TEXT NOT NULL, 'City' TEXT NOT NULL, 'State' TEXT NOT NULL, 'Zip' TEXT NOT NULL, PRIMARY KEY('LocationID') );

CREATE TABLE "OwnerTypes" ( 'OwnerTypeID' INTEGER, 'Type' TEXT NOT NULL UNIQUE, PRIMARY KEY('OwnerTypeID') );

CREATE TABLE "Reviews" ( 'ReviewID' INTEGER, 'UserID' INTEGER NOT NULL, 'GameID' INTEGER NOT NULL, 'Date' TEXT NOT NULL, 'Rating' INTEGER NOT NULL, 'Comments' TEXT, PRIMARY KEY('ReviewID') );

CREATE TABLE "Users" ( 'UserID' INTEGER, 'FirstName' TEXT NOT NULL, 'LastName' TEXT NOT NULL, 'Email' TEXT NOT NULL, 'Password' TEXT, PRIMARY KEY('UserID') );"
sqlite3 game.db .tables

sqlite3 game.db "INSERT INTO Categories (CategoryID,Name) VALUES (\"1\",\"Strategy\"),(\"2\",\"Children\"),(\"3\",\"Party\"),(\"4\",\"Card\"),(\"5\",\"Dice\"),(\"6\",\"Adventure\"),(\"7\",\"Fantasy\"),(\"8\",\"Fighting\"),(\"9\",\"Horror\"),(\"10\",\"Mature\Adult\"),(\"11\",\"Memory\"),(\"12\",\"Nautical\"),(\"13\",\"Novel-based\"),(\"14\",\"Murder\Mystery\"),(\"15\",\"Science Fiction\"),(\"16\",\"Economic\"),(\"17\",\"Farming\"),(\"18\",\"Humor\"),(\"19\",\"Math\"),(\"20\",\"Music\"),(\"21\",\"Puzzle\"),(\"22\",\"Zombies\"),(\"23\",\"War\"),(\"24\",\"Trivia\"),(\"25\",\"Educational\");"

sqlite3 game.db "SELECT * FROM Categories;"

sqlite3 game.db "INSERT INTO Events (EventID, Name, Description, LocationID, OwnerID, OwnerTypeID, Date) VALUES (\"1\",\"Chess Club Meeting\",\"Weekly chess club meet.\",\"1\",\"1\",\"2\",\"February 28th, 2017\"), \
(\"2\",\"New Friend Time\",\"Monthly friend meeting.\",\"2\",\"2\",\"2\",\"March 1st, 2017\"), \
(\"3\",\"Barbara's Birthday Bash\",\"Barbara is getting older. Help her forget by playing games with her and her friends.\",\"8\",\"6\",\"1\",\"March 14th, 2017\"), \
(\"4\",\"Game Meet Up\",\"I'm new to the city. I hope to meet some other cool gamers!\",\"8\",\"16\",\"1\",\"March 20th, 2017\"), \
(\"5\",\"Beer-Thirty\",\"It's time to drink! And play games! And Drink!\",\"4\",\"3\",\"2\",\"March 14th, 2017\"), \
(\"6\",\"After school meet up\",\"Let's meet after school for games!\",\"7\",\"4\",\"2\",\"March 21st, 2017\"), \
(\"7\",\"Girls Night Out\",\"This week we are playing Catan.\",\"3\",\"5\",\"2\",\"March 8th, 2017\"), \
(\"8\",\"Seattle Meet Up\",\"Hey Seattle, let's play!\",\"2\",\"6\",\"2\",\"March 10th, 2017\"), \
(\"9\",\"Sun's Out, Pun's Out\",\"Avoid the sun with us!\",\"5\",\"7\",\"2\",\"March 26th, 2017\"), \
(\"10\",\"Beach Bum Gaming\",\"We're not actually going to play on the beach.\",\"6\",\"8\",\"	2\",\"March 30th, 2017\"), \
(\"11\",\"Weekly Meeting\",\"Bring your favorite game!\",\"4\",\"9\",\"2\",\"April 2nd, 2017\"), \
(\"12\",\"Monthly Meeting\",\"This month will be the best!\",\"8\",\"10\",\"2\",\"March 3rd, 2017\"), \
(\"13\",\"Kid's Game\",\"Bring your kids and some snacks to share.\",\"7\",\"11\",\"2\",\"March 8th, 2017\");"


sqlite3 game.db "SELECT * FROM Events;"

sqlite3 game.db "INSERT INTO GroupGames (GroupID, GameID) VALUES (\"8\",\"30\"), \
(\"7\",\"7\"), \
(\"6\",\"5\"), \
(\"5\",\"49\"), \
(\"4\",\"8\"), \
(\"3\",\"60\"), \
(\"2\",\"62\"), \
(\"1\",\"28\"), \
(\"9\",\"11\"), \
(\"10\",\"59\"), \
(\"11\",\"19\"), \
(\"13\",\"36\"), \
(\"12\",\"8\"), \
(\"12\",\"3\");"


 sqlite3 game.db "SELECT * FROM GroupGames;"

sqlite3 game.db "INSERT INTO FavoriteGames (UserID, GameID) VALUES (\"2\",\"61\"), \
(\"3\",\"65\"), \
(\"4\",\"45\"), \
(\"5\",\"33\"), \
(\"6\",\"26\"), \
(\"7\",\"47\"), \
(\"8\",\"71\"), \
(\"9\",\"65\"), \
(\"10\",\"69\"), \
(\"11\",\"66\"), \
(\"12\",\"73\"), \
(\"13\",\"3\"), \
(\"14\",\"68\"), \
(\"15\",\"63\"), \
(\"16\",\"38\"), \
(\"17\",\"55\"), \
(\"18\",\"52\"), \
(\"19\",\"49\"), \
(\"20\",\"40\"), \
(\"21\",\"5\"), \
(\"22\",\"60\"), \
(\"23\",\"32\"), \
(\"24\",\"21\"), \
(\"25\",\"50\"), \
(\"26\",\"55\"), \
(\"27\",\"9\"), \
(\"28\",\"57\"), \
(\"29\",\"34\"), \
(\"30\",\"10\"), \
(\"31\",\"13\"), \
(\"32\",\"45\"), \
(\"33\",\"3\"), \
(\"34\",\"60\"), \
(\"35\",\"47\"), \
(\"36\",\"6\"), \
(\"37\",\"39\"), \
(\"38\",\"5\"), \
(\"39\",\"51\"), \
(\"40\",\"30\"), \
(\"41\",\"70\"), \
(\"42\",\"24\"), \
(\"43\",\"20\"), \
(\"44\",\"58\"), \
(\"45\",\"59\"), \
(\"46\",\"38\"), \
(\"47\",\"61\"), \
(\"48\",\"10\"), \
(\"49\",\"29\"), \
(\"50\",\"69\"), \
(\"51\",\"1\"), \
(\"52\",\"7\"), \
(\"53\",\"47\"), \
(\"54\",\"2\"), \
(\"55\",\"43\"), \
(\"56\",\"65\"), \
(\"57\",\"46\"), \
(\"58\",\"66\"), \
(\"59\",\"43\"), \
(\"60\",\"29\"), \
(\"61\",\"28\"), \
(\"62\",\"8\"), \
(\"63\",\"67\"), \
(\"64\",\"52\"), \
(\"65\",\"70\"), \
(\"66\",\"55\"), \
(\"67\",\"25\"), \
(\"68\",\"31\"), \
(\"69\",\"54\"), \
(\"70\",\"18\"), \
(\"71\",\"67\"), \
(\"72\",\"38\"), \
(\"73\",\"30\"), \
(\"74\",\"52\"), \
(\"75\",\"54\"), \
(\"76\",\"63\"), \
(\"77\",\"10\"), \
(\"78\",\"33\"), \
(\"79\",\"9\"), \
(\"80\",\"37\"), \
(\"81\",\"12\"), \
(\"82\",\"15\"), \
(\"83\",\"13\"), \
(\"84\",\"57\"), \
(\"85\",\"3\"), \
(\"86\",\"48\"), \
(\"87\",\"54\"), \
(\"88\",\"16\"), \
(\"89\",\"33\"), \
(\"90\",\"39\"), \
(\"91\",\"65\"), \
(\"92\",\"73\"), \
(\"93\",\"31\"), \
(\"94\",\"65\"), \
(\"95\",\"71\"), \
(\"96\",\"40\"), \
(\"97\",\"9\"), \
(\"98\",\"52\"), \
(\"99\",\"54\"), \
(\"100\",\"44\");"

sqlite3 game.db "SELECT * FROM FavoriteGames;"

sqlite3 game.db "INSERT INTO Games(GameID,Name, Description, MSRP, MinimumPlayers, MaximumPlayers, RecommendedAge, CategoryID, AvgGameLengthMin) VALUES (\"1\",\"Chess\",\"Lorem Ipsum\",\"9.99\",\"2\",\"2\",\"6\",\"1\",\"60\"), \
(\"2\",\"Checkers\",\"Lorem Ipsum\",\"4.99\",\"2\",\"2\",\"6\",\"1\",\"30\"), \
(\"3\",\"Catan\",\"Lorem Ipsum\",\"29.99\",\"3\",\"4\",\"10\",\"1\",\"90\"),\
(\"4\",\"Pandemic Legacy: Season 1\",\"Pandemic Legacy is a co-operative campaign game, with an overarching story-arc played through 12-24 sessions, depending on how well your group does at the game.\",\"69.99\",\"2\",\"4\",\"13\",\"1\",\"60\"), \
(\"5\",\"Through the Ages: A New Story of Civilization\",\"Through the Ages is a civilization building game. Each player attempts to build the best civilization through careful resource management, discovering new technologies, electing the right leaders, building wonders and maintaining a strong military.\",\"59.95\",\"2\",\"4\",\"14\",\"1\",\"180\"), \
(\"6\",\"The Jungle Book\",\"Mowgli, as you know, must leave the Cave and return to the Man Village, accompanied by some of his jungle friends to see him safely on his way. So they decide to make a ""race"" of it, to see who can be the first to reach the Man Village.\",\"19.95\",\"2\",\"4\",\"6\",\"2\",\"20\"), \
(\"7\",\"1 2 3 Game\",\"A great way to have fun learning numbers!\",\"10.0\",\"1\",\"4\",\"3\",\"2\",\"15\"), \
(\"8\",\"Cards Against Humanity\",\"A party game for horrible people.\",\"25.0\",\"4\",\"30\",\"17\",\"3\",\"30\"), \
(\"9\",\"20 Questions\",\"20 Questions is the popular panel game in which the panel ask up to 20 Questions to guess the Person, Place or Thing.\",\"23.0\",\"2\",\"7\",\"8\",\"3\",\"30\"), \
(\"10\",\".hack//ENEMY\",\"Confront the world of .hack. It will test you, captivate you, and engulf you... but don't let it destroy you. \",\"20.0\",\"2\",\"2\",\"12\",\"4\",\"30\"), \
(\"11\",\"Joking Hazard\",\"From the creators of Cyanide & Happiness comes a card game where players compete to finish an awful comic strip.\",\"25.0\",\"3\",\"10\",\"18\",\"4\",\"30\"), \
(\"12\",\"$ Fever\",\"The goal is to achieve more winning combinations after 1 or more shots.\",\"14.95\",\"2\",\"6\",\"8\",\"5\",\"20\"), \
(\"13\",\"4 the Birds\",\"4 the Birds is the board game in which you will use beak-and-taloned strategy as well as a peck of luck to be the first to ""flock"" four of your birds together in a tree besieged by a menagerie of other birds trying to do the same.\",\"30.0\",\"2\",\"6\",\"8\",\"5\",\"20\"),\
(\"14\",\"The Shared Dream\",\"Of Dreams and Magic: The Shared Dream is a cooperative board game for 2-4 players.\",\"65.0\",\"2\",\"4\",\"13\",\"6\",\"120\"),\
(\"15\",\"The 7th Continent\",\"It's the early 20th century. You have decided to sail back to the newly discovered seventh continent to attempt to lift the terrible curse that has struck you since your return from the previous expedition.\",\"59.95\",\"1\",\"4\",\"12\",\"6\",\"120\"), \
(\"16\",\"Abduction\",\"The players take the role of victims of an alien abduction trying to escape from captivity on an alien ship. The object is to be the first to escape...\",\"10.0\",\"2\",\"4\",\"10\",\"6\",\"20\"), \
(\"17\",\"Terra Mystica\",\"In the land of Terra Mystica dwell 14 different peoples in seven landscapes, and each group is bound to its own home environment, so to develop and grow, they must terraform neighboring landscapes into their home environments in competition with the other groups.\",\"79.99\",\"2\",\"5\",\"12\",\"7\",\"150\"), \
(\"18\",\"Caverna: The Cave Farmers\",\"Caverna: The Cave Farmers is a worker-placement game at heart, with a focus on farming. In the game, you are the bearded leader of a small dwarf family that lives in a little cave in the mountains.\",\"97.0\",\"1\",\"7\",\"12\",\"7\",\"210\"), \
(\"19\",\"Mage Knight Board Game\",\"The Mage Knight board game puts you in control of one of four powerful Mage Knights as you explore (and conquer) a corner of the Mage Knight universe under the control of the Atlantean Empire.\",\"89.99\",\"1\",\"4\",\"14\",\"7\",\"150\"), \
(\"20\",\"Scythe\",\"It is a time of unrest in 1920s Europa. The ashes from the first great war still darken the snow. The capitalistic city-state known simply as “The Factory”, which fueled the war with heavily armored mechs, has closed its doors, drawing the attention of several nearby countries.\",\"80.0\",\"1\",\"5\",\"14\",\"8\",\"115\"), \
(\"21\",\"Star Wars: Imperial Assault\",\"Star Wars: Imperial Assault is a strategy board game of tactical combat and missions for two to five players, offering two distinct games of battle and adventure in the Star Wars universe!\",\"99.99\",\"2\",\"5\",\"14\",\"8\",\"120\"), \
(\"22\",\"Blood Rage\",\"For a Viking there are many pathways to glory. You can invade and pillage the land for its rewards, crush your opponents in epic battles, fulfill quests, increase your clan's stats, or even die gloriously either in battle or from Ragnarök, the ultimate inescapable doom.\",\"79.99\",\"2\",\"4\",\"14\",\"8\",\"90\"), \
(\"23\",\"Mansions of Madness: Second Edition i\",\"Mansions of Madness: Second Edition is a fully cooperative, app-driven board game of horror and mystery for one to five players that takes place in the same universe as Eldritch Horror and Elder Sign. Let the immersive app guide you through the veiled streets of Innsmouth and the haunted corridors of Arkham's cursed mansions as you search for answers and respite.\",\"99.95\",\"1\",\"5\",\"14\",\"9\",\"180\"), \
(\"24\",\"Dead of Winter\",\"Dead of Winter: A Crossroads Game, the first game in this series, puts 2-5 players in a small, weakened colony of survivors in a world where most of humanity is either dead or diseased, flesh-craving monsters. Each player leads a faction of survivors with dozens of different characters in the game.\",\"59.99\",\"2\",\"5\",\"14\",\"9\",\"120\"), \
(\"25\",\"Eldritch Horror\",\"Across the globe, ancient evil is stirring. Now, you and your trusted circle of colleagues must travel around the world, working against all odds to hold back the approaching horror.\",\"59.99\",\"1\",\"8\",\"14\",\"9\",\"240\"), \
(\"26\",\"Kingdon Death: Monster\",\"Kingdom Death: Monster is a fully cooperative tabletop hobby game experience. Set in a unique nightmarish world devoid of most natural resources, you control a settlement at the dawn of its existence.\",\"100.0\",\"1\",\"6\",\"17\",\"10\",\"60\"), \
(\"27\",\"Tanto Cuore\",\"Each player plays as the Lord of a mansion and hires maids to fill out their house to become the King of Maids! The end goal is simple enough, the player who has the most Victory Points at the end of the game wins!\",\"49.95\",\"2\",\"4\",\"13\",\"10\",\"45\"), \
(\"28\",\"Funny Friends\",\"Each player plays a character who starts the game as a teenager and then must choose the cards that will make his life take shape.\",\"39.0\",\"2\",\"6\",\"16\",\"10\",\"60\"), \
(\"29\",\"Hanabi\",\"A cooperative game in which players try to create the perfect fireworks show by placing the cards on the table in the right order.\",\"8.0\",\"2\",\"5\",\"8\",\"11\",\"25\"), \
(\"30\",\"Witness\",\"Witness is set in the world of Blake and Mortimer, a Belgian comic series started in the 1940s by writer/artist Edgar P. Jacobs. In the game, which is playable strictly by four players, you each represent one of four characters and your goal is to solve mysteries or crimes by sharing information with one another — but you are quite restricted in how you can share information!\",\"39.99\",\"4\",\"4\",\"13\",\"11\",\"15\"), \
(\"31\",\"Pyramid\",\"Fluch der Mumie (Curse of the Mummy) is a game with asymmetrical goals. While one player as the Mummy tries to catch tomb raiders, the other players try to secure as many treasures as possible from the Pyramid.\",\"60.0\",\"2\",\"5\",\"8\",\"11\",\"35\"), \
(\"32\",\"Le Havre\",\"n Le Havre, a player’s turn consists of two parts: First, distribute newly supplied goods onto the offer spaces; then take an action\",\"69.99\",\"1\",\"5\",\"12\",\"12\",\"150\"), \
(\"33\",\"Keyflower\",\"Keyflower is a game for two to six players played over four rounds. Each round represents a season: spring, summer, autumn, and finally winter.\",\"72.99\",\"2\",\"6\",\"12\",\"12\",\"120\"), \
(\"34\",\"Concordia\",\"Two thousand years ago, the Roman Empire ruled the lands around the Mediterranean Sea. With peace at the borders, harmony inside the provinces, uniform law, and a common currency, the economy thrived and gave rise to mighty Roman dynasties as they expanded throughout the numerous cities.\",\"64.99\",\"2\",\"5\",\"13\",\"12\",\"100\"), \
(\"35\",\"War of the Ring\",\"n War of the Ring, one player takes control of the Free Peoples (FP), the other player controls Shadow Armies (SA). Initially, the Free People Nations are reluctant to take arms against Sauron, so they must be attacked by Sauron or persuaded by Gandalf or other Companions, before they start to fight properly: this is represented by the Political Track, which shows if a Nation is ready to fight in the War of the Ring or not.\",\"62.45\",\"2\",\"4\",\"13\",\"13\",\"180\"), \
(\"36\",\"Robinsono Crusoe: Adventures on the Cursed Island\",\"Robinson Crusoe: Adventures on the Cursed Island is a game created by Ignacy Trzewiczek, the author of Stronghold.\",\"74.99\",\"1\",\"4\",\"14\",\"13\",\"180\"), \
(\"37\",\"Arkham Horror: The Card Game\",\"Something evil stirs in Arkham, and only you can stop it. Blurring the traditional lines between roleplaying and card game experiences, Arkham Horror: The Card Game is a Living Card Game of Lovecraftian mystery, monsters, and madness!\",\"39.95\",\"1\",\"2\",\"14\",\"13\",\"120\"), \
(\"38\",\"Sherlock Holmes Consulting Detective\",\"Have you ever had the desire to walk the streets of Victorian London with Sherlock Holmes in search of Professor Moriarty? To search the docks for the giant rat of Sumatra? To walk up Baker Street as the fog is rolling in and hear Holmes cry out, ""Come, Watson, come! The game is afoot!""? Now you can!\",\"70.0\",\"1\",\"8\",\"10\",\"14\",\"120\"), \
(\"39\",\"Letters from Whitechapel\",\"Get ready to enter the poor and dreary Whitechapel district in London 1888 – the scene of the mysterious Jack the Ripper murders\",\"41.99\",\"2\",\"6\",\"13\",\"14\",\"120\"), \
(\"40\",\"Mr. Jack\",\"n Mr. Jack, one of the two players represents Jack the Ripper, who will be one of the eight characters on the board. This player knows which character is Mr. Jack, and his goal is to flee from the district as soon as possible (or avoid being accused for eight turns). \",\"42.99\",\"2\",\"2\",\"9\",\"14\",\"30\"), \
(\"41\",\"Terraforming Mars\",\"In the 2400s, mankind begins to terraform the planet Mars. Giant corporations, sponsored by the World Government on Earth, initiate huge projects to raise the temperature, the oxygen level, and the ocean coverage until the environment is habitable.\",\"69.95\",\"1\",\"5\",\"12\",\"15\",\"120\"), \
(\"42\",\"Eclipse\",\"The galaxy has been a peaceful place for many years. After the ruthless Terran–Hegemony War (30.027–33.364), much effort has been employed by all major spacefaring species to prevent the terrifying events from repeating themselves.\",\"99.0\",\"2\",\"6\",\"14\",\"15\",\"200\"), \
(\"43\",\"Android: Netrunner\",\"Welcome to New Angeles, home of the Beanstalk. From our branch offices in this monument of human achievement, NBN proudly broadcasts all your favorite media programming.\",\"39.95\",\"2\",\"2\",\"14\",\"15\",\"45\"), \
(\"44\",\"Puerto Rico\",\"In Puerto Rico players assume the roles of colonial governors on the island of Puerto Rico. The aim of the game is to amass victory points by shipping goods to Europe or by constructing buildings.\",\"21.42\",\"2\",\"5\",\"14\",\"16\",\"150\"), \
(\"45\",\"Agricola\",\"In Agricola, you're a farmer in a wooden shack with your spouse and little else.\",\"69.99\",\"1\",\"5\",\"12\",\"16\",\"120\"), \
(\"46\",\"Power Grid\",\"The objective of Power Grid is to supply the most cities with power when someone's network gains a predetermined size. In this new edition, players mark pre-existing routes between cities for connection, and then bid against each other to purchase the power plants that they use to power their cities.\",\"44.99\",\"2\",\"6\",\"12\",\"16\",\"120\"), \
(\"47\",\"Fields of Arle\",\"In the worker placement game Fields of Arle, set in the German region of East Frisia, players develop an estate and expand their territory by cutting peat and building dikes.\",\"79.99\",\"1\",\"2\",\"13\",\"17\",\"120\"), \
(\"48\",\"Goa\",\"Goa, a strategy game of auctions and resource management, is set at the start of the 16th century: beautiful beaches, a mild climate, and one of the most important trading centers in the world.\",\"97.9\",\"2\",\"4\",\"12\",\"17\",\"90\"), \
(\"49\",\"Village\",\"Life in the village is hard – but life here also allows the inhabitants to grow and prosper as they please. One villager might want to become a friar. Another might feel ambitious and strive for a career in public office. A third one might want to seek his luck in distant lands.\",\"49.99\",\"2\",\"4\",\"12\",\"17\",\"90\"), \
(\"50\",\"Galaxy Trucker\",\"In a galaxy far, far away... they need sewer systems, too. Corporation Incorporated builds them. Everyone knows their drivers -- the brave men and women who fear no danger and would, if the pay was good enough, even fly through Hell.\",\"59.95\",\"2\",\"4\",\"10\",\"18\",\"60\"), \
(\"51\",\"Dixit Odyssey\",\"Game play in Dixit Odyssey matches that of Dixit: Each turn one player is the storyteller. This player secretly chooses one card in his hand, then gives a word or sentence to describe this card—but not too obviously.\",\"43.76\",\"3\",\"12\",\"8\",\"18\",\"30\"), \
(\"52\",\"Dungeon Lords\",\"n Dungeon Lords, you are an evil dungeonlord who is trying to build the best dungeon out there. You hire monsters, build rooms, buy traps and defeat the do-gooders who wish to bring you down.\",\"69.95\",\"2\",\"4\",\"12\",\"18\",\"90\"), \
(\"53\",\"Sleeping Queens\",\"Rise and shine! The Pancake Queen, the Ladybug Queen, and ten of their closest friends have fallen under a sleeping spell and it's your job to wake them up\",\"9.99\",\"2\",\"5\",\"8\",\"19\",\"10\"), \
(\"54\",\"Utopia Engine\",\"Utopia Engine is a free print-and-play dice game for one player. You play an old artificer named Isodoros who is attempting to reconstruct the Utopia Engine, a fabled device from the distant past and possibly the only hope for averting the fast approaching Doomsday.\",\"0.0\",\"1\",\"1\",\"12\",\"19\",\"60\"), \
(\"55\",\"BuyWord\",\"BuyWord is a game of words with a twist. You pay good hard cash to buy your letters, then form a word to sell at a profit, if you can.\",\"14.99\",\"1\",\"4\",\"8\",\"19\",\"45\"), \
(\"56\",\"Opera\",\"n 1607 Monteverdi’s Opera La Favola d’Orfeo had its worldwide premiere. Over the following centuries, Europe was taken over. In the board game Opera, the players bring Opera to the public.\",\"58.19\",\"2\",\"4\",\"12\",\"20\",\"90\"), \
(\"57\",\"Rock the Beat\",\"Players in Rock the Beat do just that, creating a steady beat by slapping their thighs and clapping their hands to the rhythm of the Queen song ""We Will Rock You"".\",\"15.0\",\"4\",\"12\",\"8\",\"20\",\"30\"), \
(\"58\",\"Schrille Stille\",\"Players are the heads of 1 of 6 fictitious music companies, trying to predict/influence the popularity of 14 different musical acts.\",\"15.0\",\"3\",\"6\",\"10\",\"20\",\"60\"), \
(\"59\",\"Patchwork\",\"In Patchwork, two players compete to build the most aesthetic (and high-scoring) patchwork quilt on a personal 9x9 game board. To start play, lay out all of the patches at random in a circle and place a marker directly clockwise of the 2-1 patch.\",\"27.99\",\"2\",\"2\",\"8\",\"21\",\"30\"), \
(\"60\",\"A Feast for Odin\",\"Using the central board in A Feast for Odin, players have to hunt, gather basic materials, refine those materials, develop their production-buildings, build/buy ships, and raid settlements.\",\"99.99\",\"1\",\"4\",\"12\",\"21\",\"120\"), \
(\"61\",\"Legends of Andor\",\"Legends of Andor is a cooperative adventure board game for two to four players in which a band of heroes must work together to defend a fantasy realm from invading hordes.\",\"59.99\",\"2\",\"4\",\"14\",\"21\",\"90\"), \
(\"62\",\"Zombiecide: Black Plague\",\"Zombicide: Black Plague takes the zombie apocalypse into a fantastical medieval setting! The arcane powers of the Necromancers have unleashed a zombie invasion in the age of swords and sorcery, and it's up to your group of straggling survivors to not only stay alive during these dark times, but to take back the realm and punish those responsible for the apocalypse!\",\"99.99\",\"1\",\"6\",\"10\",\"22\",\"180\"), \
(\"63\",\"Earth Reborn\",\"arth Reborn offers nine scenarios that take you through missions of rescue, retrieval, and escort through areas of labs, mansions, towns, and more.\",\"79.99\",\"2\",\"4\",\"13\",\"22\",\"180\"), \
(\"64\",\"Last Night on Earth: The Zombie Game\",\"Last Night on Earth, The Zombie Game is a survival horror board game that pits small-town Heroes head-to-head against a horde of Zombies.\",\"59.99\",\"2\",\"6\",\"12\",\"22\",\"90\"), \
(\"65\",\"Twilight Struggle\",\"In 1945, unlikely allies toppled Hitler's war machine, while humanity's most devastating weapons forced the Japanese Empire to its knees in a storm of fire. Where once there stood many great powers, there then stood only two.\",\"37.95\",\"2\",\"2\",\"13\",\"23\",\"180\"), \
(\"66\",\"A Game of Thrones: The Board Game\",\"n the second edition of A Game of Thrones: The Board Game, three to six players take on the roles of the great Houses of the Seven Kingdoms of Westeros, as they vie for control of the Iron Throne through the use of diplomacy and warfare.\",\"59.99\",\"3\",\"6\",\"14\",\"23\",\"240\"), \
(\"67\",\"Paths of Glory\",\"They called it the Great War. In over four years of titanic struggle, the ancient Europe of Kings and Emperors tore itself to pieces, giving birth to our own violent modern age.\",\"49.95\",\"2\",\"2\",\"14\",\"23\",\"480\"), \
(\"68\",\"Wits & Wagers\",\"Not a trivia buff? It doesn't matter! In Wits & Wagers, each player writes a guess to a question such as “In what year did the bikini swimsuit makes its first appearance?” or “How many feet wide is an NFL football field?” and places it face-up on the betting mat.\",\"34.99\",\"3\",\"7\",\"10\",\"24\",\"25\"), \
(\"69\",\"Timeline: Inventions\",\"Timeline: Inventions is a card game played using 109 cards. Each card depicts an invention on both sides, with the year in which that invention was created on only one side.\",\"14.99\",\"2\",\"8\",\"8\",\"24\",\"15\"), \
(\"70\",\"Timeline: Historical Events\",\"Timeline: Events is a card game played using 110 cards. Each card depicts a historical event on both sides, with the year in which that event occurred on only one side.\",\"14.99\",\"2\",\"8\",\"8\",\"24\",\"15\"), \
(\"71\",\"1775: Rebellion\",\"In 1775: Rebellion, players take the roles of the American Continental Army and Patriots against the British Army and the Loyalists. Each side tries to control the colonies, provinces and territories.\",\"70.0\",\"2\",\"4\",\"10\",\"25\",\"120\"), \
(\"72\",\"Freedom: The Underground Railroad\",\"Early in the history of the United States, slavery was an institution that seemed unmovable but with efforts of men and women across the country, it was toppled. In Freedom: The Underground Railroad, players are working to build up the strength of the Abolitionist movement through the use of notable figures and pivotal events. By raising support for the cause and moving slaves to freedom in Canada, the minds of Americans can be changed and the institution of slavery can be brought down.\",\"69.99\",\"1\",\"4\",\"13\",\"25\",\"120\"), \
(\"73\",\"Evolution\",\"In Evolution, players adapt their species in a dynamic ecosystem where food is scarce and predators lurk. Traits like Hard Shell and Horns will protect your species from Carnivores, while a Long Neck will help them get food that others cannot reach. With over 4,000 ways to evolve your species, every game becomes a different adventure.\",\"54.99\",\"2\",\"6\",\"12\",\"25\",\"70\"), \
(\"74\",\"Exploding Kittens\",\"Players draw cards until someone draws an Exploding Kitten, at which point they explode, they are dead, and they are out of the game.\",\"19.99\",\"2\",\"4\",\"13\",\"4\",\"30\");"

sqlite3 game.db "SELECT * FROM Games;"

sqlite3 game.db "INSERT INTO Groups ('GroupID', 'Name', 'Description', 'CreatedBy') VALUES (\"1\",\"Chess Club\",\"We play chess and stuff.\",\"101\"), \
(\"2\",\"Games With Friends\",\"Come join us to make new friends! We're super nice!\",NULL), \
(\"3\",\"Beers and Games\",\"Do you like beer? Do you like games? If so, come party!\",NULL), \
(\"4\",\"After School Special\",\"A club for kids to meet after school and play games.\",NULL), \
(\"5\",\"Women Gamers Club\",\"We are women who like to game. Girls only!\",NULL), \
(\"6\",\"Seattle Players\",\"We are a Seattle based gaming club that meets every Tuesday night. Umbrellas options.\",NULL), \
(\"7\",\"Los Angeles Fun Group\",\"Play board games with glamorous Hollywood stars!\",NULL), \
(\"8\",\"San Diego Meetup\",\"We like games and Sea World and stuff…\",NULL), \
(\"9\",\"Cards, Dice, and Stuff\",\"We play all kinds of games. A different kind every week.\", NULL), \
(\"10\",\"Best Game Club\",\"This is the game club to end all game clubs. Other clubs wish they were us.\", NULL), \
(\"11\",\"Kids Game Group\",\"A great place for kids (and parents) to make new friends.\", NULL), \
(\"12\",\"Catan Kings\",\"We love two things Catan and Cards Against Humanity!\",\"101\"); "


sqlite3 game.db "SELECT * FROM Groups;"



sqlite3 game.db "INSERT INTO Locations('LocationID', 'Name', 'Address', 'City', 'State', 'Zip') VALUES (\"1\",\"Phoenix Public Library\",\"101 Main St.\",\"Phoenix\",\"AZ\",\"54321\"), \
(\"2\",\"Blue Highway Games\",\"2203 Queen Anne Ave N\",\"Seattle\",\"WA\",\"98109\"), \
(\"3\",\"Dice Age Games\",\"5107 NE 4th Plain Blvd\",\"Vancouver\",\"WA\",\"98661\"), \
(\"4\",\"Next-Gen Games\",\"5360 Wilshire Blvd\",\"Los Angeles\",\"CA\",\"90036\"), \
(\"5\",\"Turn Zero Games\",\"3959 Wilshire Blvd\",\"Los Angeles\",\"CA\",\"90010\"), \
(\"6\",\"Game Empire\",\"7051 Clairemont Mesa Blvd #306\",\"San Diego\",\"CA\",\"92111\"), \
(\"7\",\"Board Game Barrister\",\"6120 W Layton Ave\",\"Greenfield\",\"WI\",\"53220\"), \
(\"8\",\"The Compleat Strategist\",\"11 E 33rd St\",\"New York\",\"NY\",\"11016\"), \
(\"9\",\"Phoenix Community Center\",\"123 Main St.\",\"Phoenix\",\"AZ\",\"54321\");"

sqlite3 game.db "SELECT * FROM Locations;"


sqlite3 game.db "INSERT INTO OwnerTypes(OwnerTypeID,Type) VALUES (\"1\",\"User\"),(\"2\",\"Group\");"

sqlite3 game.db "SELECT * FROM OwnerTypes;"


sqlite3 game.db "INSERT INTO Reviews ('ReviewID', 'UserID', 'GameID', 'Date', 'Rating', 'Comments') VALUES (\"1\",\"74\",\"43\",\"April 8, 2016\",\"2\",\"I've played better.\"), \
(\"2\",\"19\",\"61\",\"April 13, 2016\",\"3\",NULL), \
(\"3\",\"10\",\"30\",\"May 9, 2016\",\"1\",NULL), \
(\"4\",\"71\",\"61\",\"May 13, 2016\",\"4\",\"This game was great!!\"), \
(\"5\",\"77\",\"1\",\"May 22, 2016\",\"1\",NULL), \
(\"6\",\"44\",\"37\",\"June 20, 2016\",\"1\",\"Worst game ever.\"), \
(\"7\",\"64\",\"50\",\"July 3, 2016\",\"2\",NULL), \
(\"8\",\"89\",\"2\",\"July 8, 2016\",\"2\",NULL), \
(\"9\",\"40\",\"43\",\"July 14, 2016\",\"4\",\"Amazing!!!\"), \
(\"10\",\"11\",\"64\",\"July 15, 2016\",\"2\",NULL), \
(\"11\",\"33\",\"19\",\"August 5, 2016\",\"3\",NULL), \
(\"12\",\"2\",\"66\",\"August 16, 2016\",\"5\",\"Must buy!\"), \
(\"13\",\"50\",\"29\",\"September 2, 2016\",\"1\",NULL), \
(\"14\",\"40\",\"70\",\"September 9, 2016\",\"2\",NULL), \
(\"15\",\"79\",\"68\",\"September 14, 2016\",\"5\",NULL), \
(\"16\",\"62\",\"58\",\"October 3, 2016\",\"3\",NULL), \
(\"17\",\"2\",\"64\",\"October 10, 2016\",\"4\",NULL), \
(\"18\",\"82\",\"18\",\"October 28, 2016\",\"1\",\"Avoid this game at all costs.\"), \
(\"19\",\"24\",\"38\",\"November 1, 2016\",\"3\",NULL), \
(\"20\",\"93\",\"50\",\"November 22, 2016\",\"3\",NULL), \
(\"21\",\"42\",\"45\",\"December 1, 2016\",\"5\",\"Sell your first born to buy this game if you have to.\"), \
(\"22\",\"29\",\"72\",\"December 8, 2016\",\"3\",NULL), \
(\"23\",\"77\",\"52\",\"January 21, 2017\",\"3\",NULL), \
(\"24\",\"91\",\"51\",\"February 19, 2017\",\"2\",NULL), \
(\"25\",\"91\",\"34\",\"February 23, 2017\",\"5\",NULL), \
(\"26\",\"4\",\"18\",\"March 3, 2016\",\"5\",\"I play every day!\"), \
(\"27\",\"21\",\"23\",\"March 19, 2016\",\"4\",NULL), \
(\"28\",\"53\",\"15\",\"March 31, 2016\",\"5\",NULL), \
(\"29\",\"89\",\"11\",\"April 2, 2016\",\"1\",\"My girlfriend dumped me because I made her play this dumb game.\"), \
(\"30\",\"39\",\"58\",\"April 4, 2016\",\"4\",NULL), \
(\"31\",\"2\",\"52\",\"April 17, 2016\",\"3\",NULL), \
(\"32\",\"25\",\"56\",\"April 19, 2016\",\"1\",NULL), \
(\"33\",\"39\",\"66\",\"June 15, 2016\",\"4\",NULL), \
(\"34\",\"74\",\"54\",\"July 3, 2016\",\"4\",\"Would recommend!\"), \
(\"35\",\"22\",\"38\",\"July 26, 2016\",\"4\",NULL), \
(\"36\",\"30\",\"24\",\"August 18, 2016\",\"2\",NULL), \
(\"37\",\"21\",\"22\",\"August 20, 2016\",\"4\",NULL), \
(\"38\",\"73\",\"3\",\"August 30, 2016\",\"2\",NULL), \
(\"39\",\"93\",\"18\",\"September 9, 2016\",\"3\",NULL), \
(\"40\",\"90\",\"69\",\"November 11, 2016\",\"1\",NULL), \
(\"41\",\"73\",\"46\",\"November 12, 2016\",\"4\",NULL), \
(\"42\",\"41\",\"30\",\"November 24, 2016\",\"1\",NULL), \
(\"43\",\"41\",\"43\",\"November 28, 2016\",\"5\",NULL), \
(\"44\",\"99\",\"60\",\"December 4, 2016\",\"4\",NULL), \
(\"45\",\"48\",\"61\",\"December 15, 2016\",\"1\",\"Never again! : (\"), \
(\"46\",\"16\",\"35\",\"December 23, 2016\",\"3\",NULL), \
(\"47\",\"24\",\"73\",\"January 1, 2017\",\"5\",\"This is my favorite game ever!\"), \
(\"48\",\"64\",\"9\",\"January 8, 2017\",\"1\",NULL), \
(\"49\",\"64\",\"4\",\"January 20, 2017\",\"3\",NULL), \
(\"50\",\"8\",\"23\",\"February 1, 2017\",\"5\",\"So good!\"), \
(\"52\",\"101\",\"2\",\"February 24, 2017\",\"3\",\"Not as hard as chess.\"), \
(\"53\",\"101\",\"8\",\"February 26, 2017\",\"5\",\"Playing this game is the most fun I've had in ages.\"), \
(\"54\",\"102\",\"37\",\"February 26, 2017\",\"4\",\"I love this game!\");"


sqlite3 game.db "SELECT * FROM Reviews;"


sqlite3 game.db "INSERT INTO Users ('UserID','FirstName','LastName','Email','Password') VALUES (\"1\",\"Jeff\",\"Gillispie\",\"jgillisp@asu.edu\",\"$2a$08$qaiW598ui44LGOxaEq9eT.1RxNcgd8uAGBQBjs\siWjhGOgAe7RfW\"), \
(\"2\",\"Todd\",\"McDaniel\",\"ToddMMcDaniel@cuvox.de\",\"$2a$08$qaiW598ui44LGOxaEq9eT.1RxNcgd8uAGBQBjs\siWjhGOgAe7RfW\"), \
(\"3\",\"Manuel\",\"Mayer\",\"ManuelHMayer@einrot.com\",\"$2a$08$qaiW598ui44LGOxaEq9eT.1RxNcgd8uAGBQBjs\siWjhGOgAe7RfW\"), \
(\"4\",\"Michael\",\"Flores\",\"MichaelFFlores@fleckens.hu\",\"$2a$08$qaiW598ui44LGOxaEq9eT.1RxNcgd8uAGBQBjs\siWjhGOgAe7RfW\"), \
(\"5\",\"Lindsey\",\"Gardner\",\"LindseyJGardner@superrito.com\",\"$2a$08$qaiW598ui44LGOxaEq9eT.1RxNcgd8uAGBQBjs\siWjhGOgAe7RfW\"), \
(\"6\",\"Barbara\",\"Lowe\",\"BarbaraHLowe@teleworm.us\",\"$2a$08$qaiW598ui44LGOxaEq9eT.1RxNcgd8uAGBQBjs\siWjhGOgAe7RfW\"), \
(\"7\",\"Jose\",\"Davis\",\"JoseMDavis@cuvox.de\",\"$2a$08$qaiW598ui44LGOxaEq9eT.1RxNcgd8uAGBQBjs\siWjhGOgAe7RfW\"), \
(\"8\",\"Karen\",\"Garza\",\"KarenBGarza@jourrapide.com\",\"$2a$08$qaiW598ui44LGOxaEq9eT.1RxNcgd8uAGBQBjs\siWjhGOgAe7RfW\"), \
(\"9\",\"Lemuel\",\"Reed\",\"LemuelJReed@superrito.com\",\"$2a$08$qaiW598ui44LGOxaEq9eT.1RxNcgd8uAGBQBjs\siWjhGOgAe7RfW\"), \
(\"10\",\"Alicia\",\"Sanchez\",\"AliciaNSanchez@fleckens.hu\",\"$2a$08$qaiW598ui44LGOxaEq9eT.1RxNcgd8uAGBQBjs\siWjhGOgAe7RfW\"), \
(\"11\",\"Eric\",\"Moreno\",\"EricSMoreno@teleworm.us\",\"$2a$08$qaiW598ui44LGOxaEq9eT.1RxNcgd8uAGBQBjs\siWjhGOgAe7RfW\"), \
(\"12\",\"Martin\",\"Colby\",\"MartinJColby@rhyta.com\",\"$2a$08$qaiW598ui44LGOxaEq9eT.1RxNcgd8uAGBQBjs\siWjhGOgAe7RfW\"), \
(\"13\",\"Randall\",\"Bass\",\"RandallVBass@cuvox.de\",\"$2a$08$qaiW598ui44LGOxaEq9eT.1RxNcgd8uAGBQBjs\siWjhGOgAe7RfW\"), \
(\"14\",\"Mark\",\"Nicholson\",\"MarkGNicholson@gustr.com\",\"$2a$08$qaiW598ui44LGOxaEq9eT.1RxNcgd8uAGBQBjs\siWjhGOgAe7RfW\"), \
(\"15\",\"William\",\"Wash\",\"WilliamLWash@rhyta.com\",\"$2a$08$qaiW598ui44LGOxaEq9eT.1RxNcgd8uAGBQBjs\siWjhGOgAe7RfW\"), \
(\"16\",\"Aaron\",\"Seabolt\",\"AaronSSeabolt@einrot.com\",\"$2a$08$qaiW598ui44LGOxaEq9eT.1RxNcgd8uAGBQBjs\siWjhGOgAe7RfW\"), \
(\"17\",\"Dawn\",\"Mendoza\",\"DawnDMendoza@fleckens.hu\",\"$2a$08$qaiW598ui44LGOxaEq9eT.1RxNcgd8uAGBQBjs\siWjhGOgAe7RfW\"), \
(\"18\",\"Jesse\",\"Latimore\",\"JesseRLatimore@rhyta.com\",\"$2a$08$qaiW598ui44LGOxaEq9eT.1RxNcgd8uAGBQBjs\siWjhGOgAe7RfW\"), \
(\"19\",\"Doris\",\"Jones\",\"DorisFJones@jourrapide.com\",\"$2a$08$qaiW598ui44LGOxaEq9eT.1RxNcgd8uAGBQBjs\siWjhGOgAe7RfW\"), \
(\"20\",\"Willard\",\"Danner\",\"WillardPDanner@cuvox.de\",\"$2a$08$qaiW598ui44LGOxaEq9eT.1RxNcgd8uAGBQBjs\siWjhGOgAe7RfW\"), \
(\"21\",\"Donna\",\"Taber\",\"DonnaTTaber@gustr.com\",\"$2a$08$qaiW598ui44LGOxaEq9eT.1RxNcgd8uAGBQBjs\siWjhGOgAe7RfW\"), \
(\"22\",\"Christopher\",\"Blauser\",\"ChristopherKBlauser@gustr.com\",\"$2a$08$qaiW598ui44LGOxaEq9eT.1RxNcgd8uAGBQBjs\siWjhGOgAe7RfW\"), \
(\"23\",\"Brenda\",\"Jones\",\"BrendaCJones@einrot.com\",\"$2a$08$qaiW598ui44LGOxaEq9eT.1RxNcgd8uAGBQBjs\siWjhGOgAe7RfW\"), \
(\"24\",\"Brandon\",\"Schneider\",\"BrandonBSchneider@rhyta.com\",\"$2a$08$qaiW598ui44LGOxaEq9eT.1RxNcgd8uAGBQBjs\siWjhGOgAe7RfW\"),\
(\"25\",\"Jessica\",\"Giles\",\"JessicaWGiles@teleworm.us\",\"$2a$08$qaiW598ui44LGOxaEq9eT.1RxNcgd8uAGBQBjs\siWjhGOgAe7RfW\"),\
(\"26\",\"Gary\",\"Bishop\",\"GaryMBishop@fleckens.hu\",\"$2a$08$qaiW598ui44LGOxaEq9eT.1RxNcgd8uAGBQBjs\siWjhGOgAe7RfW\"), \
(\"27\",\"Daniel\",\"Sanders\",\"DanielESanders@rhyta.com\",\"$2a$08$qaiW598ui44LGOxaEq9eT.1RxNcgd8uAGBQBjs\siWjhGOgAe7RfW\"), \
(\"28\",\"Andrew\",\"Maske\",\"AndrewPMaske@fleckens.hu\",\"$2a$08$qaiW598ui44LGOxaEq9eT.1RxNcgd8uAGBQBjs\siWjhGOgAe7RfW\"), \
(\"29\",\"James\",\"Cauthen\",\"JamesMCauthen@rhyta.com\",\"$2a$08$qaiW598ui44LGOxaEq9eT.1RxNcgd8uAGBQBjs\siWjhGOgAe7RfW\"), \
(\"30\",\"Rogelio\",\"Pettway\",\"RogelioDPettway@superrito.com\",\"$2a$08$qaiW598ui44LGOxaEq9eT.1RxNcgd8uAGBQBjs\siWjhGOgAe7RfW\"), \
(\"31\",\"Michelle\",\"Edmonds\",\"MichelleJEdmonds@rhyta.com\",\"$2a$08$qaiW598ui44LGOxaEq9eT.1RxNcgd8uAGBQBjs\siWjhGOgAe7RfW\"), \
(\"32\",\"Grace\",\"Lamar\",\"GraceLLamar@jourrapide.com\",\"$2a$08$qaiW598ui44LGOxaEq9eT.1RxNcgd8uAGBQBjs\siWjhGOgAe7RfW\"), \
(\"33\",\"Leon\",\"Henline\",\"LeonEHenline@armyspy.com\",\"$2a$08$qaiW598ui44LGOxaEq9eT.1RxNcgd8uAGBQBjs\siWjhGOgAe7RfW\"), \
(\"34\",\"Jesse\",\"Torres\",\"JesseETorres@jourrapide.com\",\"$2a$08$qaiW598ui44LGOxaEq9eT.1RxNcgd8uAGBQBjs\siWjhGOgAe7RfW\"), \
(\"35\",\"Sarah\",\"Geller\",\"SarahCGeller@armyspy.com\",\"$2a$08$qaiW598ui44LGOxaEq9eT.1RxNcgd8uAGBQBjs\siWjhGOgAe7RfW\"), \
(\"36\",\"Elvie\",\"Bentley\",\"ElvieWBentley@fleckens.hu\",\"$2a$08$qaiW598ui44LGOxaEq9eT.1RxNcgd8uAGBQBjs\siWjhGOgAe7RfW\"), \
(\"37\",\"Anna\",\"Soto\",\"AnnaMSoto@dayrep.com\",\"$2a$08$qaiW598ui44LGOxaEq9eT.1RxNcgd8uAGBQBjs\siWjhGOgAe7RfW\"), \
(\"38\",\"Marlene\",\"Bryant\",\"MarleneCBryant@gustr.com\",\"$2a$08$qaiW598ui44LGOxaEq9eT.1RxNcgd8uAGBQBjs\siWjhGOgAe7RfW\"), \
(\"39\",\"Mary\",\"East\",\"MaryJEast@rhyta.com\",\"$2a$08$qaiW598ui44LGOxaEq9eT.1RxNcgd8uAGBQBjs\siWjhGOgAe7RfW\"), \
(\"40\",\"Terrence\",\"Elamin\",\"TerrenceCElamin@teleworm.us\",\"$2a$08$qaiW598ui44LGOxaEq9eT.1RxNcgd8uAGBQBjs\siWjhGOgAe7RfW\"), \
(\"41\",\"Enrique\",\"Stein\",\"EnriqueLStein@rhyta.com\",\"$2a$08$qaiW598ui44LGOxaEq9eT.1RxNcgd8uAGBQBjs\siWjhGOgAe7RfW\"), \
(\"42\",\"Evelyn\",\"Campbell\",\"EvelynRCampbell@teleworm.us\",\"$2a$08$qaiW598ui44LGOxaEq9eT.1RxNcgd8uAGBQBjs\siWjhGOgAe7RfW\"), \
(\"43\",\"Tammy\",\"Hitchcock\",\"TammyRHitchcock@jourrapide.com\",\"$2a$08$qaiW598ui44LGOxaEq9eT.1RxNcgd8uAGBQBjs\siWjhGOgAe7RfW\"), \
(\"44\",\"Lynne\",\"McCarthy\",\"LynneEMcCarthy@rhyta.com\",\"$2a$08$qaiW598ui44LGOxaEq9eT.1RxNcgd8uAGBQBjs\siWjhGOgAe7RfW\"), \
(\"45\",\"Michael\",\"Hankins\",\"MichaelEHankins@einrot.com\",\"$2a$08$qaiW598ui44LGOxaEq9eT.1RxNcgd8uAGBQBjs\siWjhGOgAe7RfW\"), \
(\"46\",\"Sammie\",\"Ketter\",\"SammieMKetter@einrot.com\",\"$2a$08$qaiW598ui44LGOxaEq9eT.1RxNcgd8uAGBQBjs\siWjhGOgAe7RfW\"), \
(\"47\",\"Bret\",\"Campbell\",\"BretHCampbell@rhyta.com\",\"$2a$08$qaiW598ui44LGOxaEq9eT.1RxNcgd8uAGBQBjs\siWjhGOgAe7RfW\"), \
(\"48\",\"Antonio\",\"Ware\",\"AntonioRWare@fleckens.hu\",\"$2a$08$qaiW598ui44LGOxaEq9eT.1RxNcgd8uAGBQBjs\siWjhGOgAe7RfW\"), \
(\"49\",\"Bonnie\",\"Walker\",\"BonnieJWalker@fleckens.hu\",\"$2a$08$qaiW598ui44LGOxaEq9eT.1RxNcgd8uAGBQBjs\siWjhGOgAe7RfW\"), \
(\"50\",\"Jeffrey\",\"Powell\",\"JeffreyAPowell@gustr.com\",\"$2a$08$qaiW598ui44LGOxaEq9eT.1RxNcgd8uAGBQBjs\siWjhGOgAe7RfW\"), \
(\"51\",\"Kimberly\",\"Stanton\",\"KimberlyHStanton@dayrep.com\",\"$2a$08$qaiW598ui44LGOxaEq9eT.1RxNcgd8uAGBQBjs\siWjhGOgAe7RfW\"), \
(\"52\",\"Dora\",\"Shaffer\",\"DoraJShaffer@gustr.com\",\"$2a$08$qaiW598ui44LGOxaEq9eT.1RxNcgd8uAGBQBjs\siWjhGOgAe7RfW\"), \
(\"53\",\"Jo\",\"Kuo\",\"JoMKuo@teleworm.us\",\"$2a$08$qaiW598ui44LGOxaEq9eT.1RxNcgd8uAGBQBjs\siWjhGOgAe7RfW\"), \
(\"54\",\"Andrew\",\"Loewen\",\"AndrewDLoewen@jourrapide.com\",\"$2a$08$qaiW598ui44LGOxaEq9eT.1RxNcgd8uAGBQBjs\siWjhGOgAe7RfW\"), \
(\"55\",\"Terry\",\"Fisher\",\"TerryJFisher@dayrep.com\",\"$2a$08$qaiW598ui44LGOxaEq9eT.1RxNcgd8uAGBQBjs\siWjhGOgAe7RfW\"), \
(\"56\",\"Samuel\",\"Hallmark\",\"SamuelMHallmark@einrot.com\",\"$2a$08$qaiW598ui44LGOxaEq9eT.1RxNcgd8uAGBQBjs\siWjhGOgAe7RfW\"), \
(\"57\",\"Ida\",\"Fontaine\",\"IdaJFontaine@cuvox.de\",\"$2a$08$qaiW598ui44LGOxaEq9eT.1RxNcgd8uAGBQBjs\siWjhGOgAe7RfW\"), \
(\"58\",\"Donna\",\"Brown\",\"DonnaLBrown@gustr.com\",\"$2a$08$qaiW598ui44LGOxaEq9eT.1RxNcgd8uAGBQBjs\siWjhGOgAe7RfW\"), \
(\"59\",\"Alejandro\",\"Malec\",\"AlejandroMMalec@einrot.com\",\"$2a$08$qaiW598ui44LGOxaEq9eT.1RxNcgd8uAGBQBjs\siWjhGOgAe7RfW\"), \
(\"60\",\"Shelley\",\"Felipe\",\"ShelleyWFelipe@teleworm.us\",\"$2a$08$qaiW598ui44LGOxaEq9eT.1RxNcgd8uAGBQBjs\siWjhGOgAe7RfW\"), \
(\"61\",\"Juan\",\"Whitaker\",\"JuanSWhitaker@jourrapide.com\",\"$2a$08$qaiW598ui44LGOxaEq9eT.1RxNcgd8uAGBQBjs\siWjhGOgAe7RfW\"), \
(\"62\",\"Charles\",\"Roundtree\",\"CharlesKRoundtree@dayrep.com\",\"$2a$08$qaiW598ui44LGOxaEq9eT.1RxNcgd8uAGBQBjs\siWjhGOgAe7RfW\"), \
(\"63\",\"Daryl\",\"Mueller\",\"DarylMMueller@teleworm.us\",\"$2a$08$qaiW598ui44LGOxaEq9eT.1RxNcgd8uAGBQBjs\siWjhGOgAe7RfW\"), \
(\"64\",\"Wilson\",\"Murrow\",\"WilsonAMurrow@superrito.com\",\"$2a$08$qaiW598ui44LGOxaEq9eT.1RxNcgd8uAGBQBjs\siWjhGOgAe7RfW\"), \
(\"65\",\"Richard\",\"Behrens\",\"RichardLBehrens@rhyta.com\",\"$2a$08$qaiW598ui44LGOxaEq9eT.1RxNcgd8uAGBQBjs\siWjhGOgAe7RfW\"), \
(\"66\",\"Carol\",\"Macklin\",\"CarolJMacklin@jourrapide.com\",\"$2a$08$qaiW598ui44LGOxaEq9eT.1RxNcgd8uAGBQBjs\siWjhGOgAe7RfW\"), \
(\"67\",\"Irene\",\"Brunelle\",\"IreneDBrunelle@cuvox.de\",\"$2a$08$qaiW598ui44LGOxaEq9eT.1RxNcgd8uAGBQBjs\siWjhGOgAe7RfW\"), \
(\"68\",\"Randy\",\"McBrayer\",\"RandyBMcBrayer@einrot.com\",\"$2a$08$qaiW598ui44LGOxaEq9eT.1RxNcgd8uAGBQBjs\siWjhGOgAe7RfW\"), \
(\"69\",\"Jaime\",\"Roth\",\"JaimeMRoth@fleckens.hu\",\"$2a$08$qaiW598ui44LGOxaEq9eT.1RxNcgd8uAGBQBjs\siWjhGOgAe7RfW\"), \
(\"70\",\"Angela\",\"Brekke\",\"AngelaPBrekke@fleckens.hu\",\"$2a$08$qaiW598ui44LGOxaEq9eT.1RxNcgd8uAGBQBjs\siWjhGOgAe7RfW\"), \
(\"71\",\"Rodolfo\",\"Hairston\",\"RodolfoBHairston@jourrapide.com\",\"$2a$08$qaiW598ui44LGOxaEq9eT.1RxNcgd8uAGBQBjs\siWjhGOgAe7RfW\"), \
(\"72\",\"Elliott\",\"Eng\",\"ElliottNEng@cuvox.de\",\"$2a$08$qaiW598ui44LGOxaEq9eT.1RxNcgd8uAGBQBjs\siWjhGOgAe7RfW\"), \
(\"73\",\"Phyllis\",\"Moreno\",\"PhyllisPMoreno@einrot.com\",\"$2a$08$qaiW598ui44LGOxaEq9eT.1RxNcgd8uAGBQBjs\siWjhGOgAe7RfW\"), \
(\"74\",\"Jesus\",\"Walden\",\"JesusDWalden@teleworm.us\",\"$2a$08$qaiW598ui44LGOxaEq9eT.1RxNcgd8uAGBQBjs\siWjhGOgAe7RfW\"), \
(\"75\",\"Adrian\",\"Trask\",\"AdrianSTrask@armyspy.com\",\"$2a$08$qaiW598ui44LGOxaEq9eT.1RxNcgd8uAGBQBjs\siWjhGOgAe7RfW\"), \
(\"76\",\"Margaret\",\"Richter\",\"MargaretJRichter@jourrapide.com\",\"$2a$08$qaiW598ui44LGOxaEq9eT.1RxNcgd8uAGBQBjs\siWjhGOgAe7RfW\"), \
(\"77\",\"Hubert\",\"Evans\",\"HubertGEvans@superrito.com\",\"$2a$08$qaiW598ui44LGOxaEq9eT.1RxNcgd8uAGBQBjs\siWjhGOgAe7RfW\"), \
(\"78\",\"Tonya\",\"Aiello\",\"TonyaMAiello@fleckens.hu\",\"$2a$08$qaiW598ui44LGOxaEq9eT.1RxNcgd8uAGBQBjs\siWjhGOgAe7RfW\"), \
(\"79\",\"Raymond\",\"Aguero\",\"RaymondDAguero@superrito.com\",\"$2a$08$qaiW598ui44LGOxaEq9eT.1RxNcgd8uAGBQBjs\siWjhGOgAe7RfW\"), \
(\"80\",\"Adria\",\"Morales\",\"AdriaCMorales@armyspy.com\",\"$2a$08$qaiW598ui44LGOxaEq9eT.1RxNcgd8uAGBQBjs\siWjhGOgAe7RfW\"), \
(\"81\",\"Alex\",\"Mejia\",\"AlexTMejia@fleckens.hu\",\"$2a$08$qaiW598ui44LGOxaEq9eT.1RxNcgd8uAGBQBjs\siWjhGOgAe7RfW\"), \
(\"82\",\"Travis\",\"Pickard\",\"TravisSPickard@superrito.com\",\"$2a$08$qaiW598ui44LGOxaEq9eT.1RxNcgd8uAGBQBjs\siWjhGOgAe7RfW\"), \
(\"83\",\"Jose\",\"Wax\",\"JoseOWax@dayrep.com\",\"$2a$08$qaiW598ui44LGOxaEq9eT.1RxNcgd8uAGBQBjs\siWjhGOgAe7RfW\"), \
(\"84\",\"Laura\",\"Duke\",\"LauraRDuke@dayrep.com\",\"$2a$08$qaiW598ui44LGOxaEq9eT.1RxNcgd8uAGBQBjs\siWjhGOgAe7RfW\"), \
(\"85\",\"Alessandra\",\"Hollingsworth\",\"AlessandraMHollingsworth@dayrep.com\",\"$2a$08$qaiW598ui44LGOxaEq9eT.1RxNcgd8uAGBQBjs\siWjhGOgAe7RfW\"), \
(\"86\",\"Wayne\",\"Johnston\",\"WayneRJohnston@fleckens.hu\",\"$2a$08$qaiW598ui44LGOxaEq9eT.1RxNcgd8uAGBQBjs\siWjhGOgAe7RfW\"), \
(\"87\",\"Craig\",\"Ostby\",\"CraigHOstby@gustr.com\",\"$2a$08$qaiW598ui44LGOxaEq9eT.1RxNcgd8uAGBQBjs\siWjhGOgAe7RfW\"), \
(\"88\",\"Rosa\",\"Watt\",\"RosaJWatt@superrito.com\",\"$2a$08$qaiW598ui44LGOxaEq9eT.1RxNcgd8uAGBQBjs\siWjhGOgAe7RfW\"), \
(\"89\",\"Claudio\",\"Campbell\",\"ClaudioACampbell@rhyta.com\",\"$2a$08$qaiW598ui44LGOxaEq9eT.1RxNcgd8uAGBQBjs\siWjhGOgAe7RfW\"), \
(\"90\",\"Arthur\",\"Santos\",\"ArthurKSantos@teleworm.us\",\"$2a$08$qaiW598ui44LGOxaEq9eT.1RxNcgd8uAGBQBjs\siWjhGOgAe7RfW\"), \
(\"91\",\"Robert\",\"Jacobs\",\"RobertNJacobs@einrot.com\",\"$2a$08$qaiW598ui44LGOxaEq9eT.1RxNcgd8uAGBQBjs\siWjhGOgAe7RfW\"), \
(\"92\",\"Martha\",\"Gambrell\",\"MarthaDGambrell@superrito.com\",\"$2a$08$qaiW598ui44LGOxaEq9eT.1RxNcgd8uAGBQBjs\siWjhGOgAe7RfW\"), \
(\"93\",\"Jennifer\",\"Evans\",\"JenniferPEvans@fleckens.hu\",\"$2a$08$qaiW598ui44LGOxaEq9eT.1RxNcgd8uAGBQBjs\siWjhGOgAe7RfW\"), \
(\"94\",\"Rose\",\"Barber\",\"RoseRBarber@superrito.com\",\"$2a$08$qaiW598ui44LGOxaEq9eT.1RxNcgd8uAGBQBjs\siWjhGOgAe7RfW\"), \
(\"95\",\"Alfred\",\"Castaneda\",\"AlfredSCastaneda@jourrapide.com\",\"$2a$08$qaiW598ui44LGOxaEq9eT.1RxNcgd8uAGBQBjs\siWjhGOgAe7RfW\"), \
(\"96\",\"William\",\"Bare\",\"WilliamMBare@gustr.com\",\"$2a$08$qaiW598ui44LGOxaEq9eT.1RxNcgd8uAGBQBjs\siWjhGOgAe7RfW\"), \
(\"97\",\"Oliver\",\"Hurley\",\"OliverCHurley@cuvox.de\",\"$2a$08$qaiW598ui44LGOxaEq9eT.1RxNcgd8uAGBQBjs\siWjhGOgAe7RfW\"), \
(\"98\",\"Joseph\",\"Williams\",\"JosephJWilliams@einrot.com\",\"$2a$08$qaiW598ui44LGOxaEq9eT.1RxNcgd8uAGBQBjs\siWjhGOgAe7RfW\"), \
(\"99\",\"Mark\",\"Cloer\",\"MarkCCloer@superrito.com\",\"$2a$08$qaiW598ui44LGOxaEq9eT.1RxNcgd8uAGBQBjs\siWjhGOgAe7RfW\"), \
(\"100\",\"Mario\",\"Benson\",\"MarioRBenson@superrito.com\",\"$2a$08$qaiW598ui44LGOxaEq9eT.1RxNcgd8uAGBQBjs\siWjhGOgAe7RfW\"), \
(\"101\",\"Clark\",\"Kent\",\"clark@superman.com\",\"$2a$08$PmdAfn8IrN3eiXuBmXp4MeLe.Wgf1JcEpKuTQr1j6fdYw4az.TQpa\"), \
(\"102\",\"Eli\",\"Hanna\",\"ehanna2@asu.edu\",\"$2a$08$UFpVMXw1nvnzq0CUHT8ZX.7F1NE4L7yLJe3O5405PLNVZMeb8Ba1C\");"


sqlite3 game.db "SELECT * FROM Users;"
