import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'manager_state.dart';

class ManagerCubit extends Cubit<ManagerState> {
  ManagerCubit() : super(ManagerInitial('a'));
}
