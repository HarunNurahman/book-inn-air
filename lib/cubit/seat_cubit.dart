import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

class SeatCubit extends Cubit<List<String>> {
  SeatCubit() : super([]);

  void selectSeat(String id) {
    print('previous state: $state');
    state.add(id);
    print('current state: $state');
    emit(state);
  }
}
