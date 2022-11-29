part of 'api_bloc.dart';

@freezed
class ApiState with _$ApiState {
  const factory ApiState.initial() = _Initial;
  const factory ApiState.loading() = _Loading;
  const factory ApiState.loaded() = _Loaded;
}
