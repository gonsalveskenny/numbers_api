part of 'api_bloc.dart';

@freezed
class ApiEvent with _$ApiEvent {
  const factory ApiEvent.fetchData() = _FetchData;
}