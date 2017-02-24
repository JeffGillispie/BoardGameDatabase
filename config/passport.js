var LocalStrategy = require('passport-local').Strategy;
var User = require('../models/user');
module.exports = function(passport) {
	
	passport.serializeUser(function(user, done) {
		console.log("serialize user: " + user);
		done(null, user.id);
	});
	
	passport.deserializeUser(function(email, done) {
		console.log("deserialize user: " + email);
			done(null, email);
		
	});
	
	passport.use('local-signup', new LocalStrategy({ 
		usernameField: 'email',
		password: 'password',
		passReqToCallback : true
	},
	function(req, email, password, done) {
		console.log(email);
		return done(null, 'test');	
	}));
		
	
};