import 'package:bloc_cubit/cubits/internet_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: BlocBuilder<InternetCubit, InternetState>(
          builder: (context, state) {
            if (state == InternetState.gained) {
              return const Text('Connected');
            } else if (state == InternetState.lost) {
              return const Text('Not Connected');
            } else {
              return const Text('Hello Bloc');
            }
          },
        ),
      ),
    );
  }
}
