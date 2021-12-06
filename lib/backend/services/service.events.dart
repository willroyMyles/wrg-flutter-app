import 'package:eventify/eventify.dart';

class EventService {
  EventEmitter emitter = EventEmitter();
  final names = EventNames();
}

class EventNames {
  String loggedIn = "loggedIn";
  String loggedout = "loggedOut";
}

EventService _eventService = EventService();
EventService get eService => _eventService;
