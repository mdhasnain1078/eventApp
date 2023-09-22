import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

import '../../../common/models/event_model.dart';



final searchNotifierProvider = Provider((ref){
  return SearchNotifier();
  });

  final searchStateNotifierProvider =  StateNotifierProvider<SearchNotifier, List<Event>>((ref){
  return SearchNotifier();
  });

class SearchNotifier extends StateNotifier<List<Event>>{
  SearchNotifier():super([]);

    Future<List<Event>>  fetchData(String query) async {
    final response = await http.get(Uri.parse('https://sde-007.api.assignment.theinternetfolks.works/v1/event?search=$query'));
    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonData = json.decode(response.body);
      final List<dynamic> eventData = jsonData['content']['data'];
      state = eventData.map((data) => Event.fromJson(data)).toList();

    } else {
      throw Exception('Failed to load data');
    }
    return state;
  }
}