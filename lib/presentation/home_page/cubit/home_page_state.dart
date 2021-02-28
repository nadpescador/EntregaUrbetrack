import 'package:meta/meta.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ejercicio_urbetrack/models/images_model.dart';

part 'home_page_state.freezed.dart';

@freezed
abstract class HomePageState with _$HomePageState {
  const factory HomePageState.initial() = HomePageInitialState;

  const factory HomePageState.loading() = HomePageLoadingState;

  const factory HomePageState.loaded(List<ImagesModel> images) =
      HomePageLoadedState;
}
