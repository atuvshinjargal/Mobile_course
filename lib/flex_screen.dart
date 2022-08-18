import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter/material.dart';
import 'package:myapp/labeled_container.dart';

class FlexScreen extends StatelessWidget {
  const FlexScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flexible and Expanded'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ..._header(context, 'Expanded - сунгах боломжтой'),
          _buildExpanded(context),
          ..._header(context, 'Flexible - сунамтгай'),
          _buildFlexible(context),
          const Expanded(
            child: LabeledContainer(
              color: Colors.cyanAccent,
              text: 'Үлдсэн хэсэг',
              textColor: Colors.black,
            ),
          ),
          _buildFooter(context),
        ],
      ),
    );
  }

  Iterable<Widget> _header(BuildContext context, String text) {
    return [
      const SizedBox(
        height: 20,
      ),
      Text(
        text,
        style: Theme.of(context).textTheme.headline4,
      ),
    ];
  }

  Widget _buildExpanded(BuildContext context) {
    return SizedBox(
      height: 100,
      child: Row(
        children: const <Widget>[
          LabeledContainer(
            width: 100,
            color: Colors.green,
            text: '100',
            textColor: Colors.white,
          ),
          Expanded(
            child: LabeledContainer(
              color: Colors.purple,
              text: 'Үлдсэн хэсэг',
              textColor: Colors.white,
            ),
          ),
          LabeledContainer(
            width: 60,
            color: Colors.green,
            text: '60',
            textColor: Colors.white,
          ),
        ],
      ),
    );
  }

  Widget _buildFlexible(BuildContext context) {
    return SizedBox(
      height: 100,
      child: Row(
        children: const <Widget>[
          Flexible(
            flex: 1,
            child: LabeledContainer(
              color: Colors.orange,
              text: '25%',
              textColor: Colors.white,
            ),
          ),
          Flexible(
            flex: 1,
            child: LabeledContainer(
              color: Colors.deepOrange,
              text: '25%',
              textColor: Colors.white,
            ),
          ),
          Flexible(
            flex: 2,
            child: LabeledContainer(
              color: Colors.blue,
              text: '50%',
              textColor: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFooter(BuildContext context) {
    return Center(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.yellow,
          borderRadius: BorderRadius.circular(40),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 15,
            horizontal: 30,
          ),
          child: Text(
            'Хөл хэсэг',
            style: Theme.of(context).textTheme.subtitle1,
          ),
        ),
      ),
    );
  }
}
