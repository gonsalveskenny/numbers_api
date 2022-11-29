import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:numbers_api/bloc/api_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ApiBloc(),
      child: BlocBuilder<ApiBloc, ApiState>(
        builder: (context, state) {
          return Scaffold(
            body: state.when(
              initial: () {
                context.read<ApiBloc>().add(const ApiEvent.fetchData());
                return Container();
              },
              loading: () => const Center(child: CircularProgressIndicator()),
              loaded: () => scaff(context.read<ApiBloc>().getData(), context),
            ),
          );
        },
      ),
    );
  }

  Widget scaff(String show, BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.only(
              left: 30,
              right: 30,
            ),
            child: Text(
              show,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 20,
              ),
            ),
          ),
          const SizedBox(height: 100),
          ElevatedButton(
            onPressed: () {
              context.read<ApiBloc>().add(const ApiEvent.fetchData());
            },
            child: const Text('Next'),
          ),
        ],
      ),
    );
  }
}
