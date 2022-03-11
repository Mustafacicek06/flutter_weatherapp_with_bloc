import 'package:flutter/material.dart';

class SehirSec extends StatefulWidget {
  SehirSec({Key? key}) : super(key: key);

  @override
  State<SehirSec> createState() => _SehirSecState();
}

class _SehirSecState extends State<SehirSec> {
  final _textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('sehir sec'),
      ),
      body: Form(
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  maxLength: 25,
                  controller: _textController,
                  decoration: InputDecoration(
                    labelText: 'Şehir',
                    hintText: 'Şehir Seçin',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
            ),
            IconButton(
                onPressed: () {
                  Navigator.maybePop(context, _textController.text);
                },
                icon: Icon(Icons.search))
          ],
        ),
      ),
    );
  }
}
