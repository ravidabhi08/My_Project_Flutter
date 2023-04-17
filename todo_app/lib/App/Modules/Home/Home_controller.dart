import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/App/Modules/todo/firestore_db.dart';
import 'package:todo_app/App/Modules/todo/todo_model.dart';

class HomeController extends GetxController {
  final TextEditingController contentTextEditorController =
      TextEditingController();
  Rx<List<TodoModel>> todoList = Rx<List<TodoModel>>([]);
  List<TodoModel> get todos => todoList.value;

  @override
  void onReady() {
    todoList.bindStream(FirestoreDb.todoStream());
  }
}
