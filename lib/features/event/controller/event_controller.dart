import 'package:eventapp/common/models/event_model.dart';
import 'package:eventapp/features/event/repository/event_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final eventDataProvider = FutureProvider((ref){
  final eventData = ref.watch(eventRepositoryProvider).fetchData();
  return eventData;
});

class EventController{
  late EventRepository eventRepository;

  Future<List<Event>> fetchData() async {
    final data = await eventRepository.fetchData();
    return data;
  }
}