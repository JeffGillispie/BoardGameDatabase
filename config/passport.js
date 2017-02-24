var LocalStrategy = require('passport-local').Strategy;
var bcrypt = require('bcrypt-nodejs');
module.exports = function(passport, db, fs) {
	// used to serialize the user for the session
	passport.serializeUser(function(user, done) {
		console.log("serialize: " + user);
		done(null, user.Email);
	});
	// used to deserialize a user
	passport.deserializeUser(function(email, done) {
		var sql = fs.readFileSync('./queries/user_select.sql').toString().replace('{0}', email);
		console.log("deserialize query: " + sql);
		db.all(sql, function(err, records) {
			done(err, records);
		});		
	});
	// ================================================================================================
	// REGISTER A NEW USER
	// ================================================================================================
	passport.use('local-signup', new LocalStrategy({ 
		usernameField: 'email',
		passwordField: 'password',
		passReqToCallback : true
	},
	function(req, email, password, done) {
		var sql = fs.readFileSync('./queries/user_select.sql').toString().replace('{0}', email);
		console.log(sql);
		db.all(sql, function(err, records) {
			console.log(records);
			if (err)
				return done(err);
			if (records.length) {
				return dont(null, false, req.flash('signupMessage', 'That email is already registered.'));
			} else {
				// new user object
				var newUser = new Object();
				newUser.email = email;
				newUser.password = bcrypt.hashSync(password, bcrypt.genSaltSync(8), null);
				newUser.lastName = req.body.lastName;
				newUser.firstName = req.body.firstName;
				// form the insert query
				var sql_insert = fs.readFileSync('./queries/user_insert.sql').toString()
					.replace('{0}', newUser.email)
					.replace('{1}', newUser.password)
					.replace('{2}', newUser.firstName)
					.replace('{3}', newUser.lastName);
				console.log(sql_insert);
				db.run(sql_insert, function(err, records) {
					db.all(sql, function(err, users) {
						var user = users[0];
						return done(null, user);
					});					
				});				
			}
		});			
	}));
	// ================================================================================================
	// USER LOGIN
	// ================================================================================================
	passport.use('local-login', new LocalStrategy({
		usernameField: 'email',
		passwordField: 'password',
		passReqToCallback: true
	}, 
	function(req, email, password, done) {
		var sql = fs.readFileSync('./queries/user_select.sql').toString().replace('{0}', email);
		console.log(sql);
		db.all(sql, function(err, records) {
			var user = records[0];
			
			if (err)
				return done(err);
			if (!user)
				return done(null, false, req.flash('loginMessage', 'No user found.'));
			if (!bcrypt.compareSync(password, user.Password))
				return done(null, false, req.flash('loginMessage', 'Incorrect password.'));
			return done(null, user);
		});
	}));
};