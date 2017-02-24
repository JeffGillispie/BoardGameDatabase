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
	    console.log('logged in user: ' + email);
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
		db.all(sql, function(err, game) {
			res.render('pages/game', {
				game: game[0]			
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
};

// route middle-ware to make sure user is logged in
function isLoggedIn(req, res, next) {
	// if user is authenticated in the session, carry on
	if (req.isAuthenticated())
		return next();
	// if they aren't redirect them to the home page
	res.redirect('/login');
}