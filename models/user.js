var bcrypt = require('bcrypt-nodejs');
var userSchema = {
	userID		: -1,
	firstName	: "",
	lastName	: "",
	email		: "",
	password	: "",
	generateHash: function(pw) {
		return bcrypt.hashSync(pw, bcrypt.genSaltSync(8), null);
	},
	validPassword: function(pw) {
		return bcrypt.compareSync(pw, password);
	}	
}

module.exports = userSchema;