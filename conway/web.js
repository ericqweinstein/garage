'use strict';

/*
 * Conway's Game of Life
 *
 * An implementation of Conway's
 * Game of Life in JavaScript.
 *
 * See LICENSE for copying
 */

var express = require('express')
  , http    = require('http');

var app = express();

/* Express middleware */

app.set('port', process.env.PORT || 3000);
app.set('views', __dirname + '/public');
app.set('view engine', 'jade');
app.use(express.static('public'));
app.use(express.favicon('public/img/favicon.ico'));

/* Our lone route */

app.get('/', function(req, res) {
  res.render('index');
});

/* Let there be life! */

http.createServer(app).listen(app.get('port'), function() {
  console.log('Express server listening on port ' + app.get('port') + '.');
});

