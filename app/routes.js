module.exports = function(app, passport, fs, db) {
	// ====================================================
	// HOME PAGE
	// ====================================================
	app.get('/', function(req, res) {	
	    
	    var hasUser, email, userid, firstName, lastName;
	    // set variables depending on if there is a logged in user
	    if (typeof req.user !== 'undefined' && req.user && typeof req.user[0] !== 'undefined' && req.user[0]) {
	    	hasUser = true;
	    	email = req.user[0].Email;
	    	userid = req.user[0].UserID;
	    	firstName = req.user[0].FirstName;
	    	lastName = req.user[0].LastName;
	    } else {
	    	hasUser = false;
	    	email = '';
	    	userid = '';
	    	firstName = '';
	    	lastName = '';
	    }
	    // get top 10 rated games
	    var sql_topGames = fs.readFileSync('./queries/game_ratings_top10.sql').toString();	    	    
	    console.log('current user = ' + email);
	    db.all(sql_topGames, function(err, topGames) {
		    res.render('pages/index', {	        
		    	hasUser: hasUser,
		    	email: email,
		    	userid: userid,
		    	firstName: firstName,
		    	lastName: lastName,
		    	topGames: topGames
		    });	
	    });
	});
	// ====================================================
	// ABOUT PAGE
	// ====================================================
	app.get('/about', function(req, res) {
		res.render('pages/about');
	});
	// ====================================================
	// GAMES "LIST" PAGE
	// ====================================================
	app.get('/games', function(req, res) {
		var sql = fs.readFileSync('./queries/game_list.sql').toString();
		db.all(sql, function(err, games) {
			res.render('pages/games', {
				games: games
			});
		});
	});
	// ====================================================
	// GAME "DETAILS" PAGE
	// ====================================================
	app.get('/game', function(req, res) {
		var id = req.query.GameID;
		var sql = fs.readFileSync('./queries/game_details.sql').toString().replace('{0}', id);
		var sql_reviews = fs.readFileSync('./queries/game_reviews.sql').toString().replace('{0}', id)
		db.all(sql, function(err, game) {
			db.all(sql_reviews, function(err, reviews) {								
				res.render('pages/game', {
					game: game[0],
					reviews, reviews
				});
			});
		});
	});
	// ====================================================
	// GROUPS "LIST" PAGE
	// ====================================================
	app.get('/groups', function(req, res) {
		var sql = fs.readFileSync('./queries/group_list.sql').toString();
		db.all(sql, function(err, groups) {
			res.render('pages/groups', {
				groups: groups
			});
		});	
	});
	// ====================================================
	// GROUP "DETAILS" PAGE
	// ====================================================
	app.get('/group', function(req, res) {
		var id = req.query.GroupID;
		var sql_group = fs.readFileSync('./queries/group_details.sql').toString().replace('{0}', id);
		var sql_events = fs.readFileSync('./queries/group_events.sql').toString().replace('{0}', id);	
		db.all(sql_group, function(err, group) {
			db.all(sql_events, function(er, events) {		
				res.render('pages/group', {
					group: group[0],
					events: events
				});
			});
		});
	});
	// ====================================================
	// EVENTS "LIST" PAGE
	// ====================================================
	app.get('/events', function(req, res) {
		var sql = fs.readFileSync('./queries/event_list.sql').toString();
		db.all(sql, function(err, events) {
			res.render('pages/events', {
				events: events
			});
		});	
	});
	// ====================================================
	// EVENT "DETAILS" PAGE
	// ====================================================
	app.get('/event', function(req, res) {
		var id = req.query.EventID;
		var sql = fs.readFileSync('./queries/event_details.sql').toString().replace('{0}', id);
		db.all(sql, function(err, event) {
			res.render('pages/event', {
				event: event[0]
			});
		});
	});
	// ====================================================
	// LOGIN PAGE
	// ====================================================
	app.get('/login', function(req, res){
		res.render('pages/login', { 
			message: req.flash('loginMessage')
		});
	});
	// process the login form
	app.post('/login', passport.authenticate('local-login', {
		successRedirect: '/',
		failureRedirect: '/login',
		failureFlash: true
	}));
	// ====================================================
	// SIGN-UP PAGE
	// ====================================================
	app.get('/signup', function(req, res){
		res.render('pages/signup', { 
			message: req.flash('signupMessage')
		});
	});
	// process the signup form
	app.post('/signup', passport.authenticate('local-signup', {
		successRedirect: '/profile',
		failureRedirect: '/signup',
		failureFlash: true
	}));
	// ====================================================
	// PROFILE PAGE
	// ====================================================
	app.get('/profile', isLoggedIn, function(req, res){		
		res.render('pages/profile', { 
			user: req.user[0] 
		});		
	});
	// ====================================================
	// LOGOUT PAGE
	// ====================================================
	app.get('/logout', function(req, res){
		req.logout();
		res.redirect('/');
	});
	// ====================================================
	// REVIEW PAGE
	// ====================================================
	app.get('/review', isLoggedIn, function(req, res) {
		var sql = fs.readFileSync('./queries/game_list.sql').toString();
		db.all(sql, function(err, games) {
			res.render('pages/review', {
				games: games,
				message: req.flash('failureMessage')
			});		
		});
	});
	// process the review form
	app.post('/review', function(req, res) {
		failureFlash: true;		
		var monthNames = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"];
		var date = new Date();
		var month = monthNames[date.getMonth()];
		var dd = date.getDate();
		var yyyy = date.getFullYear();
		date = month + ' ' + dd + ', ' + yyyy;
		var userid = req.user[0].UserID;
		var comments = req.body.comments;
		var rating = req.body.rating;
		var gameid = req.body.game;
		
		var sql = fs.readFileSync('./queries/review_insert.sql').toString()
			.replace('{0}', userid)
			.replace('{1}', gameid)
			.replace('{2}', date.replace('\'', '\'\''))
			.replace('{3}', rating)
			.replace('{4}', comments.replace('\'', '\'\''));
		db.run(sql, function(err, records) {			
			if (err) {
				console.log(err);
				console.log(sql);
				req.flash('failureMessage', 'There was a problem saving your review.');
				res.render('pages/review', { message: req.flash('failureMessage') });			
			} else {
				res.redirect('/game?GameID=' + gameid);
			}
		});
	});
	// ====================================================
	// GAME ADD PAGE
	// ====================================================
	app.get('/gameAdd', isLoggedIn, function(req, res) {
		var sql = fs.readFileSync('./queries/categories_list.sql').toString();
		db.all(sql, function(err, categories) {
			res.render('pages/gameAdd', {
				categories: categories,
				message: req.flash('failureMessage')
			});		
		});
	});
	// process the add game form
	app.post('/gameAdd', function(req, res) {
		failureFlash: true;
		var sql = fs.readFileSync('./queries/game_insert.sql').toString()
			.replace('{0}', req.body.gameName.replace('\'', '\'\''))
			.replace('{1}', req.body.gameDescription.replace('\'','\'\''))
			.replace('{2}', req.body.gameMSRP)
			.replace('{3}', req.body.gameMinPlayers)
			.replace('{4}', req.body.gameMaxPlayers)
			.replace('{5}', req.body.gameAge)
			.replace('{6}', req.body.gameCategory)
			.replace('{7}', req.body.gameLength);
		db.run(sql, function(err, records) {
			if (err) {
				console.log(err);
				console.log(sql);
				req.flash('failureMessage', 'There was a problem saving your game.');
				res.render('pages/gameAdd', { message: req.flash('failureMessage') });
			} else {
				res.redirect('/games');
			}
		});
	});
	// ====================================================
	// GROUP ADD PAGE
	// ====================================================
	app.get('/groupAdd', isLoggedIn, function(req, res) {
		var sql = fs.readFileSync('./queries/game_list.sql').toString();
		db.all(sql, function(err, games) {
			res.render('pages/groupAdd', {
				games: games,
				message: req.flash('failureMessage')
			});		
		});
	});
	// process the add group form
	app.post('/groupAdd', function(req, res) {
		failureFlash: true;
		var userid = req.user[0].UserID;
		var sql_groupAdd = 'insert into Groups (Name, Description, CreatedBy) values (\'{0}\', \'{1}\', {2})'
			.replace('{0}', req.body.groupName.replace('\'', '\'\''))
			.replace('{1}', req.body.groupDescription.replace('\'', '\'\''))
			.replace('{2}', userid);
		db.run(sql_groupAdd, function(err, records) {			
			if (err) {
				console.log(err);
				console.log(sql);
				req.flash('failureMessage', 'There was a problem saving your group.');
				res.render('pages/groupAdd', { message: req.flash('failureMessage') });				
			} 
			
			var sql_getGroupID = 'select * from Groups where Name = \'{0}\''
				.replace('{0}', req.body.groupName.replace('\'', '\'\''));
			
			db.all(sql_getGroupID, function(err, groups) {
				if (err) {
					console.log(err);
					console.log(sql_getGroupID);
				} else {
					var groupID = groups[0].GroupID
					var sql_gg = 'insert into GroupGames (GroupID, GameID) values ({0}, {1})';
					console.log('The group games value is: ' + req.body.groupGames);
										
					if (typeof req.body.groupGames !== 'undefined' && req.body.groupGames.length == 1) {
						var gameID = req.body.groupGames;
						var sql_ggInsert = sql_gg
							.replace('{0}', groupID)
							.replace('{1}', gameID);
						db.run(sql_ggInsert, function(err, records) {
							if (err) {
								console.log(err);
								console.log(sql_gg);
							}
						});
					} else if (typeof req.body.groupGames !== 'undefined' && req.body.groupGames.length > 1) {					
						req.body.groupGames.forEach(function(gameID) {
							var sql_ggInsert = sql_gg
								.replace('{0}', groupID)
								.replace('{1}', gameID);
							db.run(sql_ggInsert, function(err, records) {
								if (err) {
									console.log(err);
									console.log(sql_gg);
								}
							});						
						});					
					}
				}				
			});
			res.redirect('/groups');
		});
	});
	// ====================================================
	// EVENT ADD PAGE
	// ====================================================
	app.get('/eventAdd', isLoggedIn, function(req, res) {
		var userid = req.user[0].UserID;
		var sql_getOwners = fs.readFileSync('./queries/owners_list.sql').toString()
			.replace('{0}', userid)
			.replace('{0}', userid);
		db.all(sql_getOwners, function(err, owners) {
			if (err) {
				console.log(err);
				console.log(sql_getOwners);
			}
			
			db.all('select * from Locations', function(err, locations) {
				if (err) {
					console.log(err);
				}
			
				res.render('pages/eventAdd', {
					owners: owners,
					locations: locations,
					message: req.flash('failureMessage')
				});
			});
		});
	});
	// process the add event form
	app.post('/eventAdd', function(req, res) {
		failureFlash: true;
		//var eventLocationID = getLocationID(req, db);
		getLocationID(req, db, callback);
		
		function callback(result) {
			var eventLocationID = result;		
			console.log(eventLocationID);
			var eventName = req.body.eventName.replace('\'', '\'\'');
			var eventDescription = req.body.eventDescription.replace('\'', '\'\'');
			var eventOwnerID = req.body.eventOwner.split(';')[0];
			var eventOwnerType = req.body.eventOwner.split(';')[1];
			var eventDate = req.body.eventDate.replace('\'', '\'\'');
			var sql_insertEvent = 'insert into Events (Name, Description, LocationID, OwnerID, OwnerTypeID, Date) values (\'{0}\',\'{1}\',{2},{3},{4},\'{5}\')'
				.replace('{0}', eventName)
				.replace('{1}', eventDescription)
				.replace('{2}', eventLocationID)
				.replace('{3}', eventOwnerID)
				.replace('{4}', eventOwnerType)
				.replace('{5}', eventDate);
			console.log(sql_insertEvent);
			db.run(sql_insertEvent, function(err, results) {
				if (err) {
					console.log(err);
					console.log(sql_insertEvent);
					req.flash('failureMessage', 'There was a problem saving your event.');
					res.render('pages/eventAdd', { message: req.flash('failureMessage') });
				} else {
					res.redirect('/events');
				}
			});
		}
	});
};

// route middle-ware to make sure user is logged in
function isLoggedIn(req, res, next) {
	// if user is authenticated in the session, carry on
	if (req.isAuthenticated())
		return next();
	// if they aren't redirect them to the home page
	res.redirect('/login');
}

function getLocationID(req, db, callback) {
	var locationType = req.body.eventLocationType;
	// populate the location id based on the location type selection
	if (locationType == 'new') {			
		var sql_insertLocation = 'insert into Locations (Name, Address, City, State, Zip) values (\'{0}\',\'{1}\',\'{2}\',\'{3}\',\'{4}\')'
			.replace('{0}', req.body.locationName.replace('\'', '\'\''))
			.replace('{1}', req.body.locationAddress.replace('\'', '\'\''))
			.replace('{2}', req.body.locationCity.replace('\'', '\'\''))
			.replace('{3}', req.body.locationState.replace('\'', '\'\''))
			.replace('{4}', req.body.locationZip.replace('\'', '\'\''));
		console.log(sql_insertLocation);
		db.run(sql_insertLocation, function(err, results) {
			if (err) {
				console.log(err);				
			} else {					
				var locationName = req.body.locationName.replace('\'', '\'\'');
				var sql_getLocation = 'select * from Locations where Name = \'{0}\''.replace('{0}', locationName);
				console.log(sql_getLocation);
				db.all(sql_getLocation, function(err, locations) {
					if (err) {
						console.log(err);						
					}
					
					console.log(locations);
					callback(locations[0].LocationID);					
				});
			}
		});
	} else {
		callback(req.body.locationExisting);
	}
}
