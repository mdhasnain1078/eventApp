import 'package:eventapp/common/models/event_model.dart';
import 'package:eventapp/features/event/repository/event_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../repository/search_notifier.dart';
import '../repository/search_repository.dart';

// final searchDataProvider = FutureProvider((ref){
//   final eventData = ref.watch(searchNotifierProvider).fetchData();
//   return eventData;
// });

// final searchControllerProvider = Provider((ref){
//   final searchRepository = ref.watch(searchNotifierProvider);
//   return SearchController(searchRepository);
// });


// class SearchController{
//   SearchNotifier searchNotifier;
//   SearchController(this.searchNotifier);

//   Future<List<Event>> fetchData() async {
//     final data = await searchNotifier.fetchData();
//     return data;
//   }

//   // List<Event>searchEvents(String query){
//   //  return searchRepository.searchEvents(query);
//   // }
// }