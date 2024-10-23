import 'package:flappydash/audio_helper.dart';
import 'package:flappydash/bloc/cubit/game_cubit.dart';
import 'package:flappydash/main_page.dart';
import 'package:flappydash/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async{
  await setupServiceLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => GameCubit(getIt.get<AudioHelper>() ),
      child: MaterialApp(
        title: 'Flappy Dash',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(fontFamily: 'Chewy'),
        home: const MainPage(),
      ),
    );
  }
}
