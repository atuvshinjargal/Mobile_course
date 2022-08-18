import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter/material.dart';

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
          ..._header(context, 'Expanded'),
          _buildExpanded(context),
          ..._header(context, 'Flexible'),
          _buildFlexible(context),
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
        style: Theme.of(context).textTheme.headline1,
      ),
    ];
  }

  Widget _buildExpanded(BuildContext context) {
    return Container();
  }

  Widget _buildFlexible(BuildContext context) {
    return Container();
  }

  Widget _buildFooter(BuildContext context) {
    return Container();
  }
}
