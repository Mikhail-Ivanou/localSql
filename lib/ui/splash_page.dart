import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:local_sql/injector.dart';
import 'package:local_sql/state/splash/splash_bloc.dart';
import 'package:local_sql/ui/main_page.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SplashBloc>(
      create: (context) => injector.get()..add(SplashInitEvent()),
      child: BlocListener<SplashBloc, SplashState>(
        listener: (context, state) {
          switch (state) {
            case SplashSuccess():
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const MainPage()),
              );
            default:
          }
        },
        child: Material(
          child: Container(
            color: Theme.of(context).colorScheme.inversePrimary,
            child: const Center(
              child: Text(
                'Loading...',
                style: TextStyle(fontSize: 16),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
