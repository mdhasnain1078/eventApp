import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../common/models/event_model.dart';
import 'package:http/http.dart' as http;

final eventRepositoryProvider = Provider((ref) => EventRepository());

class EventRepository{
    Future<List<Event>>  fetchData() async {
    final response = await http.get(Uri.parse('https://sde-007.api.assignment.theinternetfolks.works/v1/event'));
    List<Event> events = [];

    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonData = json.decode(response.body);
      final List<dynamic> eventData = jsonData['content']['data'];

      
        events = eventData.map((data) => Event.fromJson(data)).toList();
    } else {
      throw Exception('Failed to load data');
    }
    return events;
  }
}

