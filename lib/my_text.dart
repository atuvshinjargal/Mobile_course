import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter/material.dart';

class MyText extends StatelessWidget {
  const MyText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Text(
          "Сайн байна уу?",
          style: TextStyle(
            fontSize: 16,
          ),
        ),
        Text(
          'Бидний үйл ажиллагаа',
          style: Theme.of(context).textTheme.headline6,
        ),
        const Text(
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.'),
        const Divider(),
        RichText(
          text: const TextSpan(
            text: 'Flutter бол ',
            style: TextStyle(
              fontSize: 22,
              color: Colors.black,
            ),
            children: <TextSpan>[
              TextSpan(
                  text: 'үнэхээр ',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.red,
                  ),
                  children: [
                    TextSpan(
                        text: 'хүчирхэг.',
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                          decorationStyle: TextDecorationStyle.double,
                          fontSize: 40,
                        ))
                  ]),
            ],
          ),
        )
      ],
    );
  }
}
