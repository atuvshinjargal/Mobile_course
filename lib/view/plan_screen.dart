import 'package:myapp/plan_provider.dart';

import '../models/data_layer.dart';
import 'package:flutter/material.dart';

class PlanScreen extends StatefulWidget {
  final Plan plan;
  const PlanScreen({Key? key, required this.plan}) : super(key: key);
  @override
  State<PlanScreen> createState() => _PlanScreenState();
}

class _PlanScreenState extends State<PlanScreen> {
  //final plan = Plan();
  Plan get plan => widget.plan;
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
    //final plan = PlanProvider.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(plan.name),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: _buildList(),
          ),
          SafeArea(child: Text(plan.completenessMessage)),
        ],
      ),
      floatingActionButton: _buildAddTaskButton(),
    );
  }

  Widget _buildList() {
    //final plan = PlanProvider.of(context);
    return ListView.builder(
      controller: scrollController,
      itemCount: plan.tasks.length,
      itemBuilder: ((context, index) => _buildTaskTitle(plan.tasks[index])),
    );
  }

  Widget _buildAddTaskButton() {
    //final plan = PlanProvider.of(context);
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
      title: TextFormField(
        initialValue: task.description,
        onFieldSubmitted: (text) {
          setState(() {
            task.description = text;
          });
        },
      ),
    );
  }
}
