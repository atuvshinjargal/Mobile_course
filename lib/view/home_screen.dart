import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:async/async.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String result = '';
  Future<Response> getData() async {
    final String authority = 'www.googleapis.com';
    final String path = '/books/v1/volumes/junbDwAAQBAJ';
    Uri url = Uri.https(authority, path);
    return await http.post(url);
  }

  Future<int> returnOneAsync() async {
    await Future.delayed(
      const Duration(seconds: 3),
      () {},
    );
    return 1;
  }

  Future<int> returnTwoAsync() async {
    await Future.delayed(
      const Duration(
        seconds: 3,
      ),
      () {},
    );
    return 2;
  }

  Future<int> returnThreeAsync() async {
    await Future.delayed(
      const Duration(seconds: 3),
      () {},
    );
    return 3;
  }

  Future Count() async {
    int total = 0;
    total = await returnOneAsync(); //+1 3-second
    total += await returnTwoAsync(); //+2 3-second
    total += await returnThreeAsync(); //+3 3-second niit 9 second
    setState(() {
      result = total.toString();
    });
  }

  Future CountUsingCallback() async {
    int total = 0;
    returnOneAsync().then((value) {
      total += value;
      returnTwoAsync().then((value) {
        total += value;
        returnThreeAsync().then((value) {
          total += value;
          setState(() {
            result = total.toString();
          });
        });
      });
    });
  }

  late Completer completer;
  Future<dynamic> getNumber() {
    completer = Completer<int>();
    calculate();
    return completer.future;
  }

  calculate() async {
    try {
      await new Future.delayed(
        const Duration(seconds: 5),
      );
      completer.complete(42);
    } catch (e) {
      completer.completeError(e);
    }
  }

  void returnFG() {
    FutureGroup<int> futureGroup = FutureGroup<int>();
    futureGroup.add(returnOneAsync());
    futureGroup.add(returnTwoAsync());
    futureGroup.add(returnThreeAsync());
    futureGroup.close();
    futureGroup.future.then((List<int> value) {
      int total = 0;
      value.forEach((element) {
        total += element;
      });
      setState(() {
        result = total.toString();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Future -ээс иргэж ирсэн нь'),
      ),
      body: Center(
        child: Column(
          children: [
            Spacer(),
            ElevatedButton(
              onPressed: () {
                result = '';
                //Count();
                //CountUsingCallback();
                // getNumber().then(
                //   (value) {
                //     setState(() {
                //       result = value.toString();
                //     });
                //   },
                // ).catchError((e) {
                //   result = 'Алдаа гарлаа';
                // });

                returnFG();
                setState(() {
                  result = result;
                });
                /* getData().then((value) {
                  result = value.body.toString().substring(0, 450);
                  setState(() {
                    result = result;
                  });
                }).catchError((onError) {
                  result = 'Алдаа гарлаа';
                  setState(() {
                    result = result;
                  });
                }); */
              },
              child: Text('Go!'),
            ),
            Spacer(),
            Text(
              result.toString(),
            ),
            Spacer(),
            CircularProgressIndicator(),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
