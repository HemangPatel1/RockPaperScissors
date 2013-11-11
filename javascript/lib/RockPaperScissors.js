function Player(name) {
  this.name = name;
}

Player.prototype.picks = function(pick) {
  this.pick = pick; 
}


function Game(player1, player2) {
  this.player1 = player1;
  this.player2 = player2;

  this.pairs = new Array();
  this.pairs["rock"] = "scissors";
  this.pairs["paper"] = "rock";
  this.pairs["scissors"] = "paper";
}

Game.prototype.winner = function() {
  if(this.samePick() == true) {
    return null;
  }
  if(this.pairs[this.player1.pick] == this.player2.pick) {
    return this.player1; 
 }
  else {
    return this.player2;
  }
}

Game.prototype.samePick = function() {
  return this.player1.pick == this.player2.pick;
}

Game.prototype.computerPick = function() {
  var randomNumber = Math.random();
  if(randomNumber < 0.33) {
    return "rock";
  }
  else if(randomNumber > 0.66) {
    return "scissors";
  }
  else {
    return "paper";
  }
}
