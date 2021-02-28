import 'package:bloc/bloc.dart';
import 'package:ejercicio_urbetrack/repository/picsum_api.dart';
import 'package:ejercicio_urbetrack/presentation/home_page/cubit/home_page_state.dart';

class HomePageCubit extends Cubit<HomePageState> {
  HomePageCubit({
    this.picsumApi,
  }) : super(
          HomePageState.initial(),
        );
  final PicsumApi picsumApi;

  Future<void> requestApi() async {
    emit(HomePageState.loading());
    final _picsumApi = PicsumApi();
    final images = await _picsumApi.getData();
    emit(HomePageState.loaded(images));
  }
}
