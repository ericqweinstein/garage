;(function() {
  'use strict';

  /* Get a handle on the canvas element */

  var canvas = document.getElementById('myCanvas');

  /* Settings for cells and grid */

  var settings = {
    CELL_SIZE: 5
  , GRID_WIDTH: canvas.width
  , GRID_HEIGHT: canvas.height
  , SPEED: 20
  , GRID_COLOR: '#1B58DE'
  , DEAD_COLOR: '#C8ECF7'
  , ALIVE_COLOR: '#050AA1'
  };

  /* Cells */

  var Cell = function(x, y) {
    this.x = x;
    this.y = y;
    this.alive = false;
  };

  Cell.prototype.animate = function() {
    this.alive = true;
  };

  Cell.prototype.die = function() {
    this.alive = false;
  };

  Cell.prototype.createNeighbors = function(grid) {
    this.checkNeighbors(function(x, y) {
      if (!grid.cellAt(x, y)) {
        grid.add(new Cell(x, y));
      }
    });
  };

  Cell.prototype.countNeighbors = function(grid) {
    var neighbors = 0;

    this.checkNeighbors(function(x, y) {
      var cell = grid.cellAt(x, y);
      if (cell && cell.alive) {
        neighbors++;
      }
    });

    return neighbors;
  };

  Cell.prototype.checkNeighbors = function(fn) {
    var x = this.x
      , y = this.y;

    for (var dx = -1; dx <= 1; dx++) {
      for (var dy = -1; dy <= 1; dy++) {
        if (dx !== 0 || dy !== 0) {
          fn(x + dx, y + dy);
        }
      }
    }
  };

  Cell.prototype.judge = function(grid) {
    var neighbors = this.countNeighbors(grid);
    this.lives = this.alive ? (neighbors === 2 || neighbors === 3) : (neighbors === 3);
  };

  /* Grid */

  var Grid = function(width, height) {
    this.initialize(width, height);
  };

  Grid.prototype.cellAt = function(x, y) {
    return this.cells[x] && this.cells[x][y];
  };

  Grid.prototype.iterate = function(fn) {
    if (this.cellsCache) return this.cellsCache.forEach(fn);

    this.cellsCache = [];

    var rows = this.cells;
    for (var i = 0, l = rows.length; i < l; i++) {
      if (!rows[i]) continue;
      var cells = rows[i];
      for (var j = 0, l2 = rows.length; j < l2; j++) {
        if (!cells[j]) continue;
        this.cellsCache.push(cells[j]);
      }
    }
    this.iterate(fn);
  };

  Grid.prototype.add = function(cell) {
    var x = cell.x
      , y = cell.y;

    if (!this.cells[x]) this.cells[x] = [];
    this.cells[x][y] = cell;
  };

  Grid.prototype.clearDead = function() {
    var cells = this.cells
      , self  = this;

    this.iterate(function(cell) {
      var x = cell.x
        , y = cell.y;

      if (!cell.alive && cell.countNeighbors(self) === 0) {
        cells[x][y] = null;
      }
    });

    this.cellsCache = null;
  };

  Grid.prototype.step = function() {
    var self  = this
      , cells = [];

    this.iterate(function(cell) {
      cells.push(cell);
      cell.judge(self);
    });

    for (var i = 0, l = cells.length; i < l; i++) {
      var cell = cells[i];
      if (cell.lives) {
        cell.animate();
        cell.createNeighbors(self);
      } else {
        cell.die();
      }
    }
  };

  Grid.prototype.initialize = function(width, height) {
    this.cells = [];
    for (var y = 0; y < height; y++) {
      for (var x = 0; x < width; x++) {
        if (0.8 < Math.random()) {
          var cell = new Cell(x, y);
          cell.animate();
          this.add(cell);
          cell.createNeighbors(this);
        }
      }
    }
  };

  /* Helpers */

  var isEmpty = function(obj) {
    for (var prop in obj) {
      if (obj.hasOwnProperty(prop)) {
        return false;
      }
    }

    return true;
  };

  /* Display */

  var display = {
    initialize: function() {
      var context  = canvas.getContext('2d');
      this.context = context;

      this.width      = settings.GRID_WIDTH;
      this.height     = settings.GRID_HEIGHT;
      this.cellSize   = settings.CELL_SIZE;
      this.gridColor  = settings.GRID_COLOR;
      this.deadColor  = settings.DEAD_COLOR;
      this.aliveColor = settings.ALIVE_COLOR;

      context.fillStyle = this.gridColor;
      context.fillRect(0, 0, this.width, this.height);

      for (var x = 0; x < this.width; x++) {
        for (var y = 0; y < this.height; y++) {
          this.fill(x, y, this.deadColor);
        }
      }
    }

  , fill: function(x, y, color) {
      var context = this.context;

      var cellSize = this.cellSize;
      context.fillStyle = color;

      context.fillRect(x * cellSize + 1, y * cellSize + 1, cellSize - 1, cellSize - 1);
    }

  , refresh: function(grid) {
      var self = this;

      var width      = this.width
        , height     = this.height
        , deadColor  = this.deadColor
        , aliveColor = this.aliveColor;

      grid.iterate(function(cell) {
        var x = cell.x
          , y = cell.y;

        if (x >= 0 && y >= 0 && x < width && y < height) {
          self.fill(x, y, (cell.alive ? aliveColor : deadColor));
        }
      });
    }
  };

  /* Let there be life! */

  var runGoL = function(grid) {
    display.refresh(grid);

    var interval = 1000 / settings.SPEED;

    var anim = function() {
      requestAnimationFrame(function() {
        grid.clearDead();
        grid.step();
        display.refresh(grid);
        setTimeout(anim, interval);
      });
    };
    anim();
  };

  var startGame = function() {
    var grid = new Grid(settings.GRID_WIDTH, settings.GRID_HEIGHT);
    display.initialize();

    runGoL(grid);
  };

  /* Event handlers */

  $(function() {
    $('.life-header').fadeIn(800, function() {
      $('#myCanvas').slideDown(800, function() {
        $('.btn-container').fadeIn(800);
      });
    });
    $('button').click(function() {
      startGame();
    });
  });
})();

