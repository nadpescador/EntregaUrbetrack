import 'package:bloc/bloc.dart';
import 'package:ejercicio_urbetrack/models/images_model.dart';
import 'package:ejercicio_urbetrack/repository/picsum_api.dart';
import 'package:meta/meta.dart';

part 'home_page_state.dart';

class HomePageCubit extends Cubit<HomePageState> {
  HomePageCubit({
    this.picsumApi,
  }) : super(
          HomePageInitial(),
        );
  final PicsumApi picsumApi;

  Future<void> requestApi() async {
    emit(HomePageLoading());
    final _picsumApi = PicsumApi();
    final images = await _picsumApi.getData();
    emit(HomePageLoaded(images: images));
  }
}
