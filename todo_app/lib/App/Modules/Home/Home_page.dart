import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/App/Modules/todo/firestore_db.dart';
import 'package:todo_app/App/Modules/todo/todo_model.dart';
import 'Home_controller.dart';

class Homepage extends StatelessWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      init: HomeController(),
      builder: (controller) => Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueAccent.shade400,
          title: const Text('Add-todo'),
          centerTitle: true,
        ),
        body: Center(
          child: Container(
            padding: EdgeInsets.only(
                top: MediaQuery.of(context).viewPadding.top,
                left: 30,
                right: 30),
            child: Column(children: [
              TextFormField(
                decoration: InputDecoration(
                  fillColor: Colors.grey.shade100,
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  labelText: "Enter Data",
                  prefixIcon: const Icon(Icons.text_snippet),
                ),
                keyboardType: TextInputType.emailAddress,
                controller: controller.contentTextEditorController,
              ),
              const SizedBox(
                height: 30,
              ),
              ElevatedButton(
                child: const Text(
                  "Add Todo",
                ),
                onPressed: () async {
                  final todoModel = TodoModel(
                    content: controller.contentTextEditorController.text.trim(),
                    isDone: false,
                  );
                  await FirestoreDb.addTodo(todoModel);
                  controller.contentTextEditorController.clear();
                  Get.toNamed("/home");
                },
              ),
              StreamBuilder<List<TodoModel>>(
                  stream: FirestoreDb.todoStream(),
                  builder:
                      (context, AsyncSnapshot<List<TodoModel>> streamSnapshot) {
                    if (streamSnapshot.hasData) {
                      return ListView.builder(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemCount: controller.todos.length,
                        itemBuilder: (BuildContext context, int index) {
                          final _todoModel = controller.todos[index];
                          return Container(
                              margin: const EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 10,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.black26,
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 10),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Expanded(
                                      child: Text(
                                        _todoModel.content,
                                        style: TextStyle(
                                          fontSize:
                                              Get.textTheme.headline6!.fontSize,
                                          decoration: _todoModel.isDone
                                              ? TextDecoration.lineThrough
                                              : TextDecoration.none,
                                        ),
                                      ),
                                    ),
                                    Checkbox(
                                      value: _todoModel.isDone,
                                      onChanged: (status) {
                                        FirestoreDb.updateStatus(
                                          status!,
                                          _todoModel.documentId,
                                        );
                                      },
                                    ),
                                    IconButton(
                                      onPressed: () {
                                        FirestoreDb.deleteTodo(
                                            _todoModel.documentId!);
                                      },
                                      icon: const Icon(
                                        Icons.delete,
                                        color: Colors.redAccent,
                                      ),
                                    ),
                                  ],
                                ),
                              ));
                        },
                      );
                    }
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  })
            ]),
          ),
        ),
      ),
    );
  }
}
