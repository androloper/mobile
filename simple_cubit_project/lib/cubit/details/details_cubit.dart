import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:simple_cubit_project/data/repository/repository.dart';
part 'details_state.dart';

class DetailsCubit extends Cubit<DetailsState> {
  final Repository? repository;

  DetailsCubit({this.repository}) : super(DetailsInitial());

  void fetchDetails(int id) {
    Timer(Duration(seconds: 2), () {
      repository!.fetchUserInfo(id).then((details) {
        emit(DetailsLoaded(details: details));
      });
    });
  }
}
