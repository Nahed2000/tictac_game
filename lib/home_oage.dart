import 'package:flutter/material.dart';
import 'plyer.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String activePlayer = 'X';
  bool gameOver = false;
  int turn = 0;
  String result = ' ';
  Game game = Game();
  bool _isswitched = false;

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context);
    final island = mq.orientation == Orientation.portrait;
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: SafeArea(
        child: island
            ? Column(
          children: [
            ...firstBlock(),
            _expandedbuild(context),
            ...lastBlock()
          ],
        )
            : Row(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [...firstBlock(), ...lastBlock()],
              ),
            ),
            _expandedbuild(context)
          ],
        ),
      ),
    );
  }

  List<Widget> lastBlock() {
    return [
      Text(
        result,
        style: const TextStyle(
            fontSize: 42, color: Colors.white, fontWeight: FontWeight.bold),
        textAlign: TextAlign.center,
      ),
      const SizedBox(height: 15),
      ElevatedButton.icon(
          style: ButtonStyle(
              backgroundColor:
              MaterialStateProperty.all(Theme.of(context).splashColor)),
          onPressed: () {
            setState(() {
              Player.playerO = [];
              Player.playerX = [];
              activePlayer = 'X';
              gameOver = false;
              turn = 0;
              result = '';
            });
          },
          icon: Icon(Icons.replay),
          label: Text('replay the game'))
    ];
  }

  List<Widget> firstBlock() {
    return [
      SwitchListTile.adaptive(
          title: const Text(
            'Turn On/Off two Player ',
            style: TextStyle(fontSize: 28, color: Colors.white),
            textAlign: TextAlign.center,
          ),
          value: _isswitched,
          onChanged: (newval) {
            setState(() {
              _isswitched = newval;
            });
          }),
      const SizedBox(height: 15),
      Text(
        "It\'s $activePlayer Trun",
        style: const TextStyle(
            fontSize: 52, color: Colors.white, fontWeight: FontWeight.bold),
        textAlign: TextAlign.center,
      ),
    ];
  }

  Expanded _expandedbuild(BuildContext context) {
    return Expanded(
        child: GridView.count(
          crossAxisCount: 3,
          mainAxisSpacing: 8,
          crossAxisSpacing: 8,
          padding: const EdgeInsets.all(16),
          children: List.generate(
            9,
                (index) => InkWell(
              onTap: gameOver ? null : () => _onTap(index),
              borderRadius: BorderRadius.circular(16),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Theme.of(context).splashColor),
                child: Center(
                    child: Text(
                      Player.playerX.contains(index)
                          ? 'X'
                          : Player.playerO.contains(index)
                          ? 'O'
                          : '',
                      style: TextStyle(
                        fontSize: 52,
                        color:
                        Player.playerX.contains(index) ? Colors.blue : Colors.pink,
                      ),
                    )),
              ),
            ),
          ),
        ));
  }

  _onTap(int index) async {
    if ((Player.playerX.isEmpty || !Player.playerX.contains(index)) &&
        (Player.playerO.isEmpty || !Player.playerO.contains(index))) {
      game.playGame(index, activePlayer);
      updatestate();
      if (!_isswitched && !gameOver && turn != 9) {
        await game.autoPlay(activePlayer);
        updatestate();
      }
    }
  }

  void updatestate() {
    setState(() {
      activePlayer = activePlayer == 'X' ? 'O' : 'X';
      turn++;
      String PlayerWinner = game.checkWinner();
      if (PlayerWinner != '') {
        gameOver = true;
        result = '$PlayerWinner is the Winner ';
      } else if (!gameOver && turn == 9) result = 'it\s a Draw ! ';
    });
  }
}