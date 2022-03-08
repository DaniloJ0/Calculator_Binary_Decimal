import 'package:flutter/material.dart';

Widget keyNumber(number) {
    return ElevatedButton(
      child: Text(number.toString()),
      onPressed: () {},
    );
}

Widget results(_binary, _decimal) {
  return Container(
      padding: const EdgeInsets.all(11.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          Text(
            _binary,
            textAlign: TextAlign.right,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Color(int.parse("#FF5722".replaceAll('#', '0xff'))),
                fontSize: 35),
          ),
          Text(
            _decimal,
            textAlign: TextAlign.right,
            style: const TextStyle(
                fontWeight: FontWeight.bold, color: Colors.black, fontSize: 35),
          ),
        ],
      ));
}  

Widget bottom_option(_onPressed) {
  return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        Container(
          height: 370.0,
          width: 190.0,
          child: ElevatedButton(
            onPressed: () {
              _onPressed('1');
            },
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.green),
            ),
            child: const Text(
              '1',
              style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ),
        ),
        Container(
          height: 370.0,
          width: 190.0,
          child: ElevatedButton(
            onPressed: () {
              _onPressed('0');
            },
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.green),
            ),
            child: const Text(
              '0',
              style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ),
        ),
      ]);
}


Widget bottom_reset_delete(_onReset,_delete) {
    return Expanded(
              child: Row(children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Container(
                    padding: const EdgeInsets.all(8.0),
                    child: MaterialButton(
                      child: const Icon(
                        Icons.restart_alt_sharp,
                        color: Colors.red,
                        size: 36.0,
                      ),
                      color: Colors.white10,
                      onPressed: () {
                        _onReset();
                      },
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: MaterialButton(
                    child: const Icon(
                      Icons.arrow_back_rounded,
                      color: Colors.white,
                      size: 36.0,
                    ),
                    color: Colors.blueGrey,
                    onPressed: () {
                      _delete();
                    },
                  ),
                ),
              ]),
            );
  }

  Future warning(context){
    return showDialog(
            context: context,
            builder: (buildcontext) {
              return AlertDialog(
                title: const Text(
                  "¡Número Máximo de digítos!",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                content: const Text("El número máximo de digítos binarios ha sido rebasado."),
                actions: <Widget>[
                  ElevatedButton(
                    child: const Text(
                      "Cerrar",
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  )
                ],
              );
          });
  }