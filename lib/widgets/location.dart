import 'package:flutter/material.dart';

class LocationWidget extends StatelessWidget {
  final String secilenSehir;
  const LocationWidget({required this.secilenSehir, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      secilenSehir,
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 35),
    );
  }
}
