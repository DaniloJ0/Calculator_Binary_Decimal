import 'package:f_template_conversor_decimal_binario_2022/ui/widgets/widgets_all.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class BinaryToDecimal extends StatefulWidget {
  @override
  _BinaryToDecimalState createState() => _BinaryToDecimalState();
}

class _BinaryToDecimalState extends State<BinaryToDecimal> {
  String _binary = "12";
  String _decimal =
      "1100"; // _decimal = int.parse(_binary, radix: 2).toRadixString(10);

  void _onPressed(String num) {
    setState(() {
      if (_binary.split('').length < 31) {
        _binary += num;
        _decimal = int.parse(_binary, radix: 2).toRadixString(10);
      } else {
        warning(context);
      }
    });
  }
  void _onReset() {
    setState(() {
      _binary = '';
      _decimal = '0';
    });
  }

  void _delete() {
    setState(() {
      try {
        if (_binary.split('').length > 1) {
          _binary = _binary.substring(0, _binary.split('').length - 1);
          _decimal = int.parse(_binary, radix: 2).toRadixString(10);
        } else {
          _binary = '';
          _decimal = '0';
        }
      } catch (e) {
        print('Size');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            results(_binary, _decimal),
            bottom_option(_onPressed),
            bottom_reset_delete(_onReset, _delete),
          ]),
    );
  }
}
