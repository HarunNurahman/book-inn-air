import 'package:bloc/bloc.dart';
import 'package:book_inn_air/models/destination_model.dart';
import 'package:book_inn_air/services/destination_service.dart';
import 'package:equatable/equatable.dart';

part 'destination_state.dart';

class DestinationCubit extends Cubit<DestinationState> {
  DestinationCubit() : super(DestinationInitial());

  void fetchDestination() async {
    try {
      emit(DestinationLoading());
      List<DestinationModel> destinations =
          await DestinationService().fetchDestination();
      emit(DestinationSuccess(destinations));
    } catch (e) {
      emit(DestinationFailed(e.toString()));
    }
  }
}

