import '../models/data_layer.dart';
import 'package:flutter/material.dart';

class PlanScreen extends StatefulWidget {
  const PlanScreen({Key? key}) : super(key: key);

  @override
  State<PlanScreen> createState() => _PlanScreenState();
}

class _PlanScreenState extends State<PlanScreen> {
  final plan = Plan();
  late ScrollController scrollController;
  @override
  void initState() {
    super.initState();
    scrollController = ScrollController()
      ..addListener(() {
        FocusScope.of(context).requestFocus(FocusNode());
      });
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Мастер төлөвлөгөө'),
      ),
      body: _buildList(),
      floatingActionButton: _buildAddTaskButton(),
    );
  }

  Widget _buildList() {
    return ListView.builder(
      controller: scrollController,
      itemCount: plan.tasks.length,
      itemBuilder: ((context, index) => _buildTaskTitle(plan.tasks[index])),
    );
  }

  Widget _buildAddTaskButton() {
    return FloatingActionButton(
      onPressed: () {
        setState(() {
          plan.tasks.add(Task());
        });
      },
      child: Icon(Icons.add),
    );
  }

  Widget _buildTaskTitle(Task task) {
    return ListTile(
      leading: Checkbox(
        value: task.complete,
        onChanged: (value) {
          setState(() {
            task.complete = value!; //null check, null baival false
          });
        },
      ),
      title: TextField(
        onChanged: (text) {
          setState(() {
            task.description = text;
          });
        },
      ),
    );
  }
}
