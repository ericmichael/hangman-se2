import 'package:flutter/material.dart';
import 'package:hangman_game/models/hangmangame.dart';
import 'package:hangman_game/config/globals.dart';

import 'gamescreen.dart';

class MainScreen extends StatelessWidget {
  MainScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Hangman",
              style: TextStyle(
                fontSize: 50,
              ),
            ),
            Text(
              "Game",
              style: TextStyle(
                fontSize: 50,
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 10, 0, 50),
            ),
            SizedBox(
                height: 100,
                child: Image(image: AssetImage('assets/progress_8.png'))),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
            ),
            ElevatedButton(
              //Here we are giving the new game button a key for use in our integration tests in test_driver/app_test.dart
              key: Key('new-game-button'),
              child: Text("New Game",
                  style: TextStyle(fontSize: 25),
                  //Here we are giving the new game text field a key for use in our integration tests in test_driver/app_test.dart
                  key: Key('new-game-text')),
              onPressed: () async {
                String word =
                    await HangmanGame.getStartingWord(areWeInIntegrationTest);

                HangmanGame game = HangmanGame(word);

                //TODO: Push a GameScreen and give it the HangmanGame
              },
            )
          ],
        ),
      ),
    );
  }
}
