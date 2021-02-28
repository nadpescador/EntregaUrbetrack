import 'package:ejercicio_urbetrack/presentation/home_page/cubit/home_page_cubit.dart';
import 'package:ejercicio_urbetrack/presentation/home_page/cubit/home_page_state.dart';
import 'package:ejercicio_urbetrack/presentation/home_page/home_page_loaded.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () => _getData(context),
      child: Scaffold(
        body: SafeArea(
          child: BlocBuilder<HomePageCubit, HomePageState>(
            builder: (_, state) {
              return state.when(
                  initial: () => Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextButton(
                              child: Container(
                                child: const Text('Enviar'),
                              ),
                              onPressed: () =>
                                  context.read<HomePageCubit>().requestApi(),
                            ),
                          ],
                        ),
                      ),
                  loading: () => Center(child: CircularProgressIndicator()),
                  loaded: (images) => HomePageLoaded(images: images));
            },
          ),
        ),
      ),
    );
  }

  Future<void> _getData(BuildContext context) async {
    await context.read<HomePageCubit>().requestApi();
  }
}
