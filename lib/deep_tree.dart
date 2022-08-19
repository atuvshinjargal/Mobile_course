import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter/material.dart';

class DeepTree extends StatelessWidget {
  const DeepTree({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('Sain baina uu?'),
              Text('data'),
              Text('end buh widget baina.'),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('Ene bol flutter'),
                  FlutterLogo(),
                ],
              ),
              Expanded(
                child: Container(
                  color: Colors.purple,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
