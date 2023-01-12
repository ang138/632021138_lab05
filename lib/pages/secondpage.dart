import 'package:flutter/material.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({super.key});

  @override
  State<SecondPage> createState() => _InputPageState();
}

class _InputPageState extends State<SecondPage> {
  // Form
  final GlobalKey<FormState> _formKey = GlobalKey();

  // TextField
  final TextEditingController _text1 = TextEditingController();
  final TextEditingController _text2 = TextEditingController();
  final TextEditingController _text3 = TextEditingController();
  int isRadio = 0;
  bool isCheck  =false;
  double? _bmi;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Input"),
      ),
      body: Form(
        key: _formKey,
        child: ListView( 
          children: [
            Text(
              _bmi == null ? 'No Result' : _bmi!.toStringAsFixed(2),
              style: const TextStyle(fontSize: 50),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
