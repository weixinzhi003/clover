class TodoInfo extends TodoType {

  int id;
  String title;
  String content;
  String date;
  int priority; //优先级
  int status;

  TodoInfo({
    this.id,
    this.title,
    this.content,
    this.date,
    this.priority,
    this.status,
    int type,
    String typeIcon,
    String typeName,
  }) : super(type,typeIcon,typeName);

}

class TodoType {

  static const int type_work = 0;
  static const int type_study = 1;
  static const int type_life = 2;
  static const int type_ent = 3;

  final int type; //类别 工作0；学习1；生活2； 娱乐3
  final String typeIcon;
  final String typeName;

  const TodoType(this.type, this.typeIcon, this.typeName);


}

class TodoTypes {
  static const TodoType work = TodoType(
      TodoType.type_work, "images/todo_work.png", "工作");
  static const TodoType study = TodoType(
      TodoType.type_study, "images/todo_study.png", "学习");
  static const TodoType life = TodoType(
      TodoType.type_life, "images/todo_life.png", "生活");
  static const TodoType ent = TodoType(
      TodoType.type_ent, "images/todo_ent.png", "娱乐");
}
