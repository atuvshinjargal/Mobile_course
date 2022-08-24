import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'models/user.dart';
import 'stopwatch.dart';

class LoginScreen extends StatefulWidget {
  static const route = '/login';
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool loggedIn = false;
  late String name;
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Нэвтрэх'),
      ),
      body: Center(
        child: loggedIn ? _buildSuccess() : _buildLoginForm(),
      ),
    );
  }

  Widget _buildSuccess() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        const Icon(
          Icons.check,
          color: Colors.orange,
        ),
        Text("Сайн байна уу? $name та амжилттай нэвтэрлээ."),
      ],
    );
  }

  Widget _buildLoginForm() {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: _nameController,
              decoration: const InputDecoration(labelText: 'Нэр'),
              validator: (text) => text!.isEmpty ? 'Та утга оруулна уу.' : null,
            ),
            TextFormField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(labelText: 'Э-мэйл'),
              validator: (text) {
                if (text!.isEmpty) {
                  return 'Та Э-мэйлээ оруулна уу.';
                }
                final regex =
                    RegExp('[^@]+@[^\.]+\..+'); //tuvshinjargal@erdenetis.edu.mn
                if (!regex.hasMatch(text)) {
                  return 'Та Э-мэйл хаягаа зөв оруулна уу?';
                }
                return null;
              },
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: _validate,
              child: const Text(
                'Үргэлжлүүлэх',
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _validate() {
    final form = _formKey.currentState;
    if (!form!.validate()) {
      return;
    }
    final user = User(name: _nameController.text, email: _emailController.text);

    Navigator.of(context).pushReplacementNamed(
      StopWatch.route,
      arguments: user,
    );
  }
}
