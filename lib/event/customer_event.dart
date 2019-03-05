import 'package:clover/entity/todo/todo_info.dart';
import 'package:event_bus/event_bus.dart';

EventBus eventBus = new EventBus();

//TodoHome界面todoType变更，刷新底下的tabView
class OnTodoTypeChangedEvent{
  int todoType;

  OnTodoTypeChangedEvent(this.todoType);
}

//修改Todo的状态
class OnTodoStatusChangedEvent{
  TodoInfo todoInfo;

  OnTodoStatusChangedEvent(this.todoInfo);
}

