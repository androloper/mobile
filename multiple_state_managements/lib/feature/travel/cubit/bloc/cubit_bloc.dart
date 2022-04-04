import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
part 'cubit_event.dart';
part 'cubit_state.dart';

class CubitBloc extends Bloc<CubitEvent, CubitState> {
  CubitBloc() : super(CubitInitial()) {
    on<CubitEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
