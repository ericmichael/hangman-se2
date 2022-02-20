import 'package:flutter/material.dart';
import 'package:hangman_game/config/globals.dart';
import 'package:hangman_game/models/hangmangame.dart';

import 'gamescreen.dart';

class LoseScreen extends StatelessWidget {
  HangmanGame game;
  //This should be modified to take in a HangmanGame
  LoseScreen(this.game);

  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            //Here we are giving the lose game button a key for use in our integration tests in test_driver/app_test.dart
            Text("You Lose",
                style: TextStyle(fontSize: 50), key: Key('lose-game-text')),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 60, 0, 0),
            ),
            SizedBox(
                height: 300,
                child: Image(image: AssetImage('assets/progress_7.png'))),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
            ),
            Text('Your word was: ${game.word()}',
                style: TextStyle(fontSize: 25)),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 0, 50),
            ),
            ElevatedButton(
                //Here we are giving the new game button a key for use in our integration tests in test_driver/app_test.dart
                key: Key('new-game-btn'),
                child: Text("New Game", style: TextStyle(fontSize: 25)),
                onPressed: () async {
                  //This setups a new game
                  String word =
                      await HangmanGame.getStartingWord(areWeInIntegrationTest);
                  HangmanGame game = HangmanGame(word);

                  //TODO: Push a GameScreen and give it the HangmanGame
                })
          ],
        ),
      ),
    ));
  }
}
