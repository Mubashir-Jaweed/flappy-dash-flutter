import 'package:flappydash/bloc/cubit/game_cubit.dart';
import 'package:flappydash/main.dart';
import 'package:flappydash/main_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GameOverWidget extends StatelessWidget {
  const GameOverWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black54,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'GAME OVER!',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 38,
              ),
            ),
            SizedBox(
              height: 18,
            ),
            ElevatedButton(
              onPressed: () => context.read<GameCubit>().restartGame(),
              child: const Text('PLAY AGAIN!'),
            ),
          ],
        ),
      ),
    );
  }
}