class TodoListModel {
  final String? sId;
  final String? taskName;
  final String? taskDetail;
  final String? dateData;
  bool? taskCheck;
  final String? activity;
  final bool? priority;
  final int? iV;

  TodoListModel(
      {required this.sId,
      required this.taskName,
      required this.taskDetail,
      required this.dateData,
      required this.taskCheck,
      required this.activity,
      required this.priority,
      required this.iV});
  factory TodoListModel.fromJson(Map<String, dynamic> json) => TodoListModel(
      sId: json['_id'],
      taskName: json['taskName'],
      taskDetail: json['taskDetail'],
      dateData: json['dateData'],
      taskCheck: json['taskCheck'],
      activity: json['activity'],
      priority: json['priority'],
      iV: json['__v']);
}
