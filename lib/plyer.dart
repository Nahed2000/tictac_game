import 'dart:math';

class Player {
  static const x = 'X';
  static const o = 'O';
  static const empty = '';

  static List<int> playerX = [];
  static List<int> playerO = [];
}

extension ContaineAll on List {
  bool containeAll(int x, int y, [z]) {
    if (z == null) {
      return contains(x) && contains(y);
    } else {
      return contains(x) && contains(y) && contains(z);
    }
  }
}

class Game {
  void playGame(int index, String activePlayer) {
    if (activePlayer == 'X') {
      Player.playerX.add(index);
    } else {
      Player.playerO.add(index);
    }
  }

  String checkWinner() {
    String winner = '';
    if (Player.playerX.containeAll(0, 1, 2) ||
        Player.playerX.containeAll(3, 4, 5) ||
        Player.playerX.containeAll(6, 7, 8) ||
        Player.playerX.containeAll(0, 3, 6) ||
        Player.playerX.containeAll(1, 4, 7) ||
        Player.playerX.containeAll(2, 5, 8) ||
        Player.playerX.containeAll(0, 4, 8) ||
        Player.playerX.containeAll(2, 4, 6)) {
      winner = 'X';
    } else if (Player.playerO.containeAll(0, 1, 2) ||
        Player.playerO.containeAll(3, 4, 5) ||
        Player.playerO.containeAll(6, 7, 8) ||
        Player.playerO.containeAll(0, 3, 6) ||
        Player.playerO.containeAll(1, 4, 7) ||
        Player.playerO.containeAll(2, 5, 8) ||
        Player.playerO.containeAll(0, 4, 8) ||
        Player.playerO.containeAll(2, 4, 6)) {
      winner = 'O';
    } else {
      winner = '';
    }
    return winner;
  }

  autoPlay(activePlayer) {
    int index = 0;
    List<int> scaleEmpty = [];
    for (int i = 0; i < 9; i++) {
      if (!(Player.playerX.contains(i) || Player.playerO.contains(i))) {
        scaleEmpty.add(i);
      }
    }
    //attack
    //start- center
    if (Player.playerO.containeAll(0, 1) && scaleEmpty.contains(2)) {
      index = 2;
    } else if (Player.playerO.containeAll(3, 4) && scaleEmpty.contains(5)) {
      index = 5;
    } else if (Player.playerO.containeAll(6, 7) && scaleEmpty.contains(8)) {
      index = 8;
    } else if (Player.playerO.containeAll(0, 3) && scaleEmpty.contains(6)) {
      index = 6;
    } else if (Player.playerO.containeAll(1, 4) && scaleEmpty.contains(7)) {
      index = 7;
    } else if (Player.playerO.containeAll(2, 5) && scaleEmpty.contains(8)) {
      index = 8;
    } else if (Player.playerO.containeAll(0, 4) && scaleEmpty.contains(8)) {
      index = 8;
    } else if (Player.playerO.containeAll(2, 4) && scaleEmpty.contains(6)) {
      index = 6;
    } else if (Player.playerO.containeAll(0, 2) && scaleEmpty.contains(1)) {
      index = 1;
    } else if (Player.playerO.containeAll(3, 5) && scaleEmpty.contains(4)) {
      index = 4;
    } else if (Player.playerO.containeAll(6, 8) && scaleEmpty.contains(7)) {
      index = 7;
    } else if (Player.playerO.containeAll(0, 6) && scaleEmpty.contains(3)) {
      index = 3;
    } else if (Player.playerO.containeAll(1, 7) && scaleEmpty.contains(4)) {
      index = 4;
    } else if (Player.playerO.containeAll(2, 8) && scaleEmpty.contains(5)) {
      index = 5;
    } else if (Player.playerO.containeAll(0, 8) && scaleEmpty.contains(4)) {
      index = 4;
    } else if (Player.playerO.containeAll(2, 6) && scaleEmpty.contains(4)) {
      index = 4;
    } else if (Player.playerO.containeAll(2, 1) && scaleEmpty.contains(0)) {
      index = 0;
    } else if (Player.playerO.containeAll(5, 4) && scaleEmpty.contains(3)) {
      index = 3;
    } else if (Player.playerO.containeAll(8, 7) && scaleEmpty.contains(6)) {
      index = 6;
    } else if (Player.playerO.containeAll(6, 3) && scaleEmpty.contains(0)) {
      index = 0;
    } else if (Player.playerO.containeAll(7, 4) && scaleEmpty.contains(1)) {
      index = 1;
    } else if (Player.playerO.containeAll(8, 5) && scaleEmpty.contains(2)) {
      index = 2;
    } else if (Player.playerO.containeAll(8, 4) && scaleEmpty.contains(0)) {
      index = 0;
    } else if (Player.playerO.containeAll(6, 4) && scaleEmpty.contains(2)) {
      index = 2;
    } else if (Player.playerX.containeAll(0, 1) && scaleEmpty.contains(2)) {
      index = 2;
    } else if (Player.playerX.containeAll(3, 4) && scaleEmpty.contains(5)) {
      index = 5;
    } else if (Player.playerX.containeAll(6, 7) && scaleEmpty.contains(8)) {
      index = 8;
    } else if (Player.playerX.containeAll(0, 3) && scaleEmpty.contains(6)) {
      index = 6;
    } else if (Player.playerX.containeAll(1, 4) && scaleEmpty.contains(7)) {
      index = 7;
    } else if (Player.playerX.containeAll(2, 5) && scaleEmpty.contains(8)) {
      index = 8;
    } else if (Player.playerX.containeAll(0, 4) && scaleEmpty.contains(8)) {
      index = 8;
    } else if (Player.playerX.containeAll(2, 4) && scaleEmpty.contains(6)) {
      index = 6;
    } else if (Player.playerX.containeAll(0, 2) && scaleEmpty.contains(1)) {
      index = 1;
    } else if (Player.playerX.containeAll(3, 5) && scaleEmpty.contains(4)) {
      index = 4;
    } else if (Player.playerX.containeAll(6, 8) && scaleEmpty.contains(7)) {
      index = 7;
    } else if (Player.playerX.containeAll(0, 6) && scaleEmpty.contains(3)) {
      index = 3;
    } else if (Player.playerX.containeAll(1, 7) && scaleEmpty.contains(4)) {
      index = 4;
    } else if (Player.playerX.containeAll(2, 8) && scaleEmpty.contains(5)) {
      index = 5;
    } else if (Player.playerX.containeAll(0, 8) && scaleEmpty.contains(4)) {
      index = 4;
    } else if (Player.playerX.containeAll(2, 6) && scaleEmpty.contains(4)) {
      index = 4;
    } else if (Player.playerX.containeAll(2, 1) && scaleEmpty.contains(0)) {
      index = 0;
    } else if (Player.playerX.containeAll(5, 4) && scaleEmpty.contains(3)) {
      index = 3;
    } else if (Player.playerX.containeAll(8, 7) && scaleEmpty.contains(6)) {
      index = 6;
    } else if (Player.playerX.containeAll(6, 3) && scaleEmpty.contains(0)) {
      index = 0;
    } else if (Player.playerX.containeAll(7, 4) && scaleEmpty.contains(1)) {
      index = 1;
    } else if (Player.playerX.containeAll(8, 5) && scaleEmpty.contains(2)) {
      index = 2;
    } else if (Player.playerX.containeAll(8, 4) && scaleEmpty.contains(0)) {
      index = 0;
    } else if (Player.playerX.containeAll(6, 4) && scaleEmpty.contains(2)) {
      index = 2;
    } else {
      Random random = Random();
      int randomIndex = random.nextInt(scaleEmpty.length);
      index = scaleEmpty[randomIndex];
    }
    playGame(index, activePlayer);
  }
}