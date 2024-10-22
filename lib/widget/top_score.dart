import 'package:flappydash/bloc/cubit/game_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TopScore extends StatelessWidget {
  const TopScore({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GameCubit, GameState>(
      builder: (context, state) {
        return Align(
          child: Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: Text(
              state.currentScore.toString(),
              style: TextStyle(
                color: Colors.black87,
                fontSize: 38,
              ),
            ),
          ),
          alignment: Alignment.topCenter,
        );
      },
    );
  }
}
