import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../product/constant/image_enum.dart';
import '../model/travel_model.dart';

class TravelCubit extends Cubit<TravelStates> {
  TravelCubit() : super(TravelLaoding());
  List<TravelModel> allItems = [];

  Future<void> fetchItems() async {
    await Future.delayed(const Duration(seconds: 1));
    allItems = TravelModel.mockItmes;
    emit(TravelItemsLoaded(allItems));
  }

  void searchByItems(String data) {
    final result = allItems.where((element) => element.title.contains(data)).toList();

    emit(TravelItemsLoaded(result));
  }

  void seeAllItems() {
    emit(TravelItemsSeeAll([
      ImageEnums.camp_alt.toPathFeed,
      ImageEnums.camp_alt2.toPathFeed,
    ]));
  }
}

abstract class TravelStates {}

class TravelLaoding extends TravelStates {}

class TravelItemsLoaded extends TravelStates {
  final List<TravelModel> items;

  TravelItemsLoaded(this.items);
}

class TravelItemsSeeAll extends TravelStates {
  final List<String> images;

  TravelItemsSeeAll(this.images);
}