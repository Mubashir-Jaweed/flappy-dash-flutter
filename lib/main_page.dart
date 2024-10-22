import 'package:flame/game.dart';
import 'package:flappydash/bloc/cubit/game_cubit.dart';
import 'package:flappydash/flappy_dash_game.dart';
import 'package:flappydash/widget/game_over_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  late FlappyDashGame _flappyDashGame;
  late GameCubit gameCubit;
  PlayingState? _latestState;

  @override
  void initState() {
    gameCubit = BlocProvider.of<GameCubit>(context);
    _flappyDashGame = FlappyDashGame(gameCubit);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GameCubit, GameState>(
      listener: (BuildContext context, GameState state) {
        if (state.currentPlayingState == PlayingState.none &&
            _latestState == PlayingState.gameOver) {
          setState(() {
            _flappyDashGame = FlappyDashGame(gameCubit);
          });
        }
        _latestState = state.currentPlayingState;
      },
      builder: (context, state) {
        return Scaffold(
            body: Stack(
          children: [
            GameWidget(game: _flappyDashGame),
            if (state.currentPlayingState == PlayingState.gameOver)
              const GameOverWidget(),
            if (state.currentPlayingState == PlayingState.none)
              Align(
                child: IgnorePointer(
                  child: const Text(
                    'TAP TO PLAY',
                    style: TextStyle(
                      color: Colors.black87,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 3,
                      fontSize: 35,
                    ),
                  )
                      .animate(
                        onPlay: (controller) => controller.repeat(
                          reverse: true,
                        ),
                      )
                      .scale(
                        begin: const Offset(1.0, 1.0),
                        end: const Offset(1.1, 1.1),
                        duration: const Duration(milliseconds: 500),
                      ),
                ),
                alignment: Alignment(0, 0.2),
              ),
          ],
        ));
      },
    );
  }
}
