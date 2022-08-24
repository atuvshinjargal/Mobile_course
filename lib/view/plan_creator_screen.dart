import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:myapp/plan_provider.dart';

import '../models/plan.dart';
import 'plan_screen.dart';

class PlanCreatorScreen extends StatefulWidget {
  const PlanCreatorScreen({Key? key}) : super(key: key);

  @override
  State<PlanCreatorScreen> createState() => _PlanCreatorScreenState();
}

class _PlanCreatorScreenState extends State<PlanCreatorScreen> {
  final textController = TextEditingController();

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Миний төлөвлөгөөнүүд'),
      ),
      body: Column(
        children: <Widget>[
          _buildListCreator(),
          Expanded(child: _buildMasterPlans()),
        ],
      ),
    );
  }

  Widget _buildListCreator() {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Material(
        color: Theme.of(context).cardColor,
        elevation: 10,
        child: TextField(
          controller: textController,
          decoration: InputDecoration(
            labelText: 'Төлөвлөгөө нэмэх',
            contentPadding: EdgeInsets.all(20),
          ),
          onEditingComplete: addPlan,
        ),
      ),
    );
  }

  void addPlan() {
    final text = textController.text;
    if (text.isEmpty) {
      return;
    }
    final plan = Plan()..name = text;
    PlanProvider.of(context).add(plan);
    FocusScope.of(context).requestFocus(FocusNode());
    setState(() {}); //huudsiig dahin zurna.
  }

  Widget _buildMasterPlans() {
    final plans = PlanProvider.of(context);
    if (plans.isEmpty) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(
            Icons.note,
            size: 100,
            color: Colors.grey,
          ),
          Text(
            'Танд одоогоор төлөвлөгөө байхгүй байна.',
            style: Theme.of(context).textTheme.headline5,
          ),
        ],
      );
    }
    return ListView.builder(
      itemCount: plans.length,
      itemBuilder: ((context, index) {
        final plan = plans[index];
        return ListTile(
          title: Text(plan.name),
          subtitle: Text(plan.completenessMessage),
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: ((context) => PlanScreen(plan: plan)),
              ),
            );
          },
        );
      }),
    );
  }
}
