import 'package:ejercicio_urbetrack/presentation/home_page/cubit/home_page_cubit.dart';
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
              if (state is HomePageInitial) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                        child: Container(
                          child: Text('Enviar'),
                        ),
                        onPressed: () =>
                            context.read<HomePageCubit>().requestApi(),
                      ),
                    ],
                  ),
                );
              } else if (state is HomePageLoaded) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height * 0.5,
                        width: MediaQuery.of(context).size.height * 0.5,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: state.images.length,
                          itemBuilder: (_, index) {
                            return Container(
                              margin: EdgeInsets.all(20),
                              child: FadeInImage.assetNetwork(
                                  placeholder: 'assets/images/loading.gif',
                                  image: state.images[index].downloadUrl),
                            );
                          },
                        ),
                      ),
                      TextButton(
                        child: Container(
                          child: Text('Reload'),
                        ),
                        onPressed: () =>
                            context.read<HomePageCubit>().requestApi(),
                      ),
                    ],
                  ),
                );
              } else if (state is HomePageLoading) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
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
