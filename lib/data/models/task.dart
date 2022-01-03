import 'package:flutter_boilerplate/domain/entities/task_entity.dart';


class Task extends TaskEntity {
  Task({
    required String? id,
    required String? name,
    required String? avatar,
    required String? createdAt,
  }) : super(id: id, name: name, avatar: avatar, createdAt: createdAt);

  factory Task.fromJson(Map<String, dynamic> json) => Task(
    id: json['id'] as String?,
    name: json['name'] as String?,
    avatar: json['avatar'] as String?,
    createdAt: json['createdAt'] as String?,
  );
}

