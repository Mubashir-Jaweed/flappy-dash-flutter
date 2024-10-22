import 'package:flame/game.dart';
import 'package:flappydash/bloc/cubit/game_cubit.dart';
import 'package:flappydash/flappy_dash_game.dart';
import 'package:flappydash/widget/game_over_widget.dart';
import 'package:flappydash/widget/tap_to_play.dart';
import 'package:flappydash/widget/top_score.dart';
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
        if (state.currentPlayingState.isIdle &&
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
            if (state.currentPlayingState.isGameOver) const GameOverWidget(),
            if (state.currentPlayingState.isIdle)
              Align(
               
                  child: TapToPlay(),
                
                alignment: Alignment(0, 0.2),
              ),
            if (state.currentPlayingState.isNotGameOver) const TopScore(),
          ],
        ));
      },
    );
  }
}
