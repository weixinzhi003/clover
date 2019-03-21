import 'package:clover/entity/todo/todo_info.dart';
import 'package:clover/entity/user/user.dart';
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

//删除todo
class OnTodoDeleteEvent{
  TodoInfo todoInfo;

  OnTodoDeleteEvent(this.todoInfo);
}

//新增Todo
class OnTodoAddEvent{
  TodoInfo todoInfo;

  OnTodoAddEvent(this.todoInfo);
}

//用户登录
class OnLoginStatusChangedEvent{
  User user;

  OnLoginStatusChangedEvent(this.user);
}

//用户注册
class OnRegisterEvent{
  User user;

  OnRegisterEvent(this.user);
}
