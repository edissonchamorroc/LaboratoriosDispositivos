import 'package:hive_flutter/hive_flutter.dart';
import 'package:ticket_master/models/Event.dart';


class HiveApi {
  late Box<Event> _eventBox;

  Future<void> initializeHive() async {
    Hive.registerAdapter(EventAdapter());
    _eventBox = await Hive.openBox<Event>('eventsBox');
  }

  Future<void> insertEvent(Event event) async {
    await _eventBox.put(event.id, event);
  }

   Future<void> deleteEvent(Event event) async {
    await _eventBox.delete(event.id);
  }


  Event? getEvent(String id) {
    return _eventBox.get(id);
  }

  List<Event> getAllEvents() {
    return _eventBox.values.toList();
  }
}
