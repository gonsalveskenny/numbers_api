// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:http/http.dart' as http;

part 'api_event.dart';
part 'api_state.dart';
part 'api_bloc.freezed.dart';

class ApiBloc extends Bloc<ApiEvent, ApiState> {
  // ignore: prefer_typing_uninitialized_variables
  var data;
  ApiBloc() : super(const _Initial()) {
    on<ApiEvent>((event, emit) async {
      await event.when(
        fetchData: () async {
          emit(const ApiState.loading());
          try {
            data = await http
                .get(Uri.parse('http://numbersapi.com/random/trivia'));
            emit(const ApiState.loaded());
          } catch (e) {
            // ignore: avoid_print
            print(e.toString());
          }
        },
      );
    });
  }

  String getData() {
    return data.body;
  }
}
