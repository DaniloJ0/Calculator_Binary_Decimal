import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/binary_decimal.dart';
import '../widgets/decimal_binary.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
 bool _binary2Decimal = true;

  void _onPressed() {
    setState(() {
    _binary2Decimal = !_binary2Decimal;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Converter',
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        home: Scaffold(
            appBar: AppBar(
              title: const Text('Converter'),
            ),
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // StateBinary(_onPressed,_binary2Decimal),
              Container(
                padding: const EdgeInsets.all(11.0),
                alignment: Alignment.centerLeft,
                child: MaterialButton(
                    onPressed: () {_onPressed();},
                    child: Text(
                      _binary2Decimal ? 'Binary -> Decimal' : 'Decimal -> Binary',
                      style: const TextStyle(
                          color: Colors.blue, fontWeight: FontWeight.bold),
                    )),
              ),
                Expanded(
                    child: _binary2Decimal
                        ? BinaryToDecimal()
                        : DecimalToBinary()),
              ],
            )));
  }
}


