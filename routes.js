module.exports = function(app, passport, fs, db) {
	// ====================================================
	// HOME PAGE
	// ====================================================
	app.get('/', function(req, res) {	
	    var tagline = "Join a group and start playing games.";	
	    res.render('index', {
	        tagline: tagline
	    });
	
	});
	// ====================================================
	// ABOUT PAGE
	// ====================================================
	app.get('/about', function(req, res) {
		res.render('about');
	});
	// ====================================================
	// GAMES "LIST" PAGE
	// ====================================================
	app.get('/games', function(req, res) {
		var sql = fs.readFileSync('./queries/game_list.sql').toString();
		db.all(sql, function(err, games) {
			res.render('games', {
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
			res.render('game', {
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
			res.render('groups', {
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
				res.render('group', {
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
			res.render('events', {
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
			res.render('event', {
				event: event[0]
			});
		});
	});
	// ====================================================
	// LOGIN PAGE
	// ====================================================
	app.get('/login', function(req, res){
		res.render('login', { 
			message: req.flash('loginMessage')
		});
	});
	// ====================================================
	// SIGN-UP PAGE
	// ====================================================
	app.get('/signup', function(req, res){
		res.render('signup', { 
			message: req.flash('signupMessage')
		});
	});
	// process the signup form
	app.post('/signup', passport.authenticate('local-signup', {
		successRedirect: '/profile',
		failureRedirect: '/signup',
		failureFlash: true
	}));/*
	app.post('/signup', function(req, res) {
		console.log("hello world" + req.body.email + '|' + req.body.password);
	});*/
	// ====================================================
	// PROFILE PAGE
	// ====================================================
	app.get('/progile', isLoggedIn, function(req, res){
		res.render('profile', { 
			user: req.user 
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
	res.redirect('/');
}