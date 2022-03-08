import 'package:f_template_conversor_decimal_binario_2022/ui/widgets/widgets_all.dart';
import 'package:flutter/material.dart';

class DecimalToBinary extends StatefulWidget {
  @override
  State<DecimalToBinary> createState() => _DecimalToBinaryState();
}

class _DecimalToBinaryState extends State<DecimalToBinary> {
  String _binary = "10";
  String _decimal = "2";

  void _onPressed(String num) {
    setState(() {
      if (_binary.split('').length < 31) {
      _decimal += num;
      _binary = int.parse(_decimal, radix: 10).toRadixString(2);
      } else {
        warning(context);
      }
    });
  }

  void _reset() {
    setState(() {
      _binary = '';
      _decimal = '';
    });
  }

void _delete() {
    setState(() {
      try {
        if (_decimal.split('').length > 1) {
          _decimal = _decimal.substring(0, _decimal.split('').length - 1);
          _binary = int.parse(_decimal, radix: 10).toRadixString(2);
        } else {
          _binary = '0';
          _decimal = '';
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
            results(_decimal, _binary),
            Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
              Expanded(
                child: keyNumber('9', _onPressed),
              ),
              Expanded(
                child: keyNumber('8', _onPressed),
              ),
              Expanded(
                child: keyNumber('7', _onPressed),
              ),
            ]),
            Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
              Expanded(
                child: keyNumber('6', _onPressed),
              ),
              Expanded(
                child: keyNumber('5', _onPressed),
              ),
              Expanded(
                child: keyNumber('4', _onPressed),
              ),
            ]),
            Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
              Expanded(
                child: keyNumber('3', _onPressed),
              ),
              Expanded(
                child: keyNumber('2', _onPressed),
              ),
              Expanded(
                child: keyNumber('1', _onPressed),
              ),
            ]),
            Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
              Expanded(
                flex: 1,
                child: Container(
                  padding: const EdgeInsets.all(9.0),
                  height: 100.0,
                  child: MaterialButton(
                    onPressed: () {
                      _reset();
                    },
                    color: Colors.redAccent,
                    child: const Icon(
                        Icons.restart_alt_sharp,
                        color: Colors.white,
                        size: 36.0,
                      ),
                    ),
                  ),
                ),
                Expanded(
                flex: 1,
                child: Container(
                  padding: const EdgeInsets.all(9.0),
                  height: 100.0,
                  child: MaterialButton(
                    onPressed: () {
                      _delete();
                    },
                    color: Colors.blueGrey,
                    child: const Icon(
                        Icons.arrow_back_rounded,
                        color: Colors.white,
                        size: 36.0,
                      ),
                    ),
                  ),
                ),
              Expanded(
                child: keyNumber('0', _onPressed),
              ),
            ]),
          ]),
    );
  }
}

Widget keyNumber(String number, [_onPressed, colorPara = Colors.green]) {
  return Container(
    padding: const EdgeInsets.all(9.0),
    height: 100.0,
    child: ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(colorPara),
      ),
      child: Text(
        number.toString(),
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
      ),
      onPressed: () {
        _onPressed(number);
      },
    ),
  );
}
// Widget buttoms_decimal(){
//   return 
// }