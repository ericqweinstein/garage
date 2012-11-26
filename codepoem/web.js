// Load libraries
var requireJS = require('requirejs');
var express = require('express');
var app = express();

// Spin this mother up
app.use('/public', express.static(__dirname + '/public'));
app.get('/', function(req, res) {
  res.sendfile('public/index.html');
});

// Start listening, default = 5000
var port = process.env.PORT || 5000;
app.listen(port, function() {
  console.log('Listening on port ' + port + '...');
});
