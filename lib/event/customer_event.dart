import 'package:event_bus/event_bus.dart';

EventBus eventBus = new EventBus();

class OnTodoTypeChangedEvent{
  int todoType;

  OnTodoTypeChangedEvent(this.todoType);
}