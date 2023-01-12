import 'package:flutter/material.dart';
import 'package:lab05/pages/secondpage.dart';

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  // Form
  final GlobalKey<FormState> _formKey = GlobalKey();

  // TextField
  final TextEditingController _height = TextEditingController();
  final TextEditingController _weight = TextEditingController();
  final TextEditingController _text3 = TextEditingController();
  String isRadio = "";
  bool isCheck = false;
  double? _bmi;


  List<Fruit> fruits = [];

  void _calculate() {
    double? height = double.parse(_height.value.text) / 100;
    double? weight = double.parse(_weight.value.text);

    // Check if the inputs are valid
    if (height == null || height <= 0 || weight == null || weight <= 0) {
      setState(() {});
      return;
    }

    setState(() {
      _bmi = weight / ((height * height));
      if (_bmi! < 18.5) {
        //_message = "You are underweight";
      } else if (_bmi! < 25) {
        //_message = 'You body is fine';
      } else if (_bmi! < 30) {
        //_message = 'You are overweight';
      } else {
        //_message = 'You are obese';
      }
    });
  }

  @override
  void initState() {
    super.initState();
    fruits = Fruit.getFruit();
    print(fruits[0].engName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("BMI Calculation"),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          children: [
            //Center(child: Text("\nHeight")),
            TextFormField(
              controller: _height,
              keyboardType: TextInputType.number,
              decoration:
                  const InputDecoration(suffixText: "cm", labelText: "ส่วนสูง"),
              onChanged: (value) {
                setState(() {});
              },
            ),
            TextFormField(
              controller: _weight,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                  suffixText: "kg", labelText: "นํ้าหนัก"),
              onChanged: (value) {
                setState(() {});
              },
            ),

            ElevatedButton(
              onPressed: _calculate,
              child: const Text('Calculate'),
            ),

            
            const SizedBox(
              height: 30,
            ),
            Text(
              _bmi == null ? 'No Result' : _bmi!.toStringAsFixed(2),
              style: const TextStyle(fontSize: 50),
              textAlign: TextAlign.center,
            ),
            /*Center(child: Text("\nTextFormField #2")),
            TextFormField(
              controller: _weight,
              keyboardType: TextInputType.visiblePassword,
              obscureText: true,
              onChanged: (value) {
                setState(() {});
              },
            ),
            Center(child: Text("\nTextFormField #3")),
            TextFormField(
            controller: _text3,
              keyboardType: TextInputType.url,
              obscureText: true,
              onChanged: (value) {
                setState(() {});
              },
              decoration: InputDecoration(
                
                prefixIcon: Icon(Icons.email,color: Colors.green,),
                hintText: "This is label text",
                enabledBorder: OutlineInputBorder(
                  
                  borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide(color: Colors.green,width: 3),


                  
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide(color: Colors.green,width: 3),
                  
                  
                ),
              ),
              
              
            ),*/

            Center(child: Text("\nSex")),
            RadioListTile(
              title: Text("Male"),
              value: "Male",
              groupValue: isRadio,
              onChanged: (value) {
                setState(() {
                  isRadio = value!;
                });
              },
            ),
            RadioListTile(
              title: Text("Female"),
              value: "Female",
              groupValue: isRadio,
              onChanged: (value) {
                setState(() {
                  isRadio = value!;
                });
              },
            ),
            RadioListTile(
              title: Text("Other (LGBT+)"),
              value: "Other",
              groupValue: isRadio,
              onChanged: (value) {
                setState(() {
                  isRadio = value!;
                });
              },
            ),
            RadioListTile(
              title: Text("Not Specify"),
              value: "Not",
              groupValue: isRadio,
              onChanged: (value) {
                setState(() {
                  isRadio = value!;
                });
              },
            ),
            Column(
              children: createFruitCheckbox(),
            ),

            ElevatedButton(
              child: Text('Go to next page.'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SecondPage(
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> createFruitCheckbox() {
    List<Widget> myfruit = [];

    for (Fruit fruit in fruits) {
      //print(fruit.thName);
      myfruit.add(
        CheckboxListTile(
          title: Text(fruit.engName),
          subtitle: Text(fruit.thName),
          value: fruit.isCheck,
          onChanged: (value) {
            setState(() {
              fruit.isCheck = value!;
            });
          },
        ),
      );
    }

    return myfruit;
  }
}

class Fruit {
  String engName;
  String thName;
  bool isCheck;

  Fruit(this.engName, this.thName, this.isCheck);

  static List<Fruit> getFruit() {
    return <Fruit>[
      Fruit("Banana", "กล้วย", false),
      Fruit("Orange", "ส้ม", false),
      Fruit("Apple", "แอปเปิ้ล", false),
      Fruit("Papaya", "มะละกอ", false),
      Fruit("Coconut", "มะพร้าว", false),
    ];
  }
}

/*class Faculty {
  int value;
  String facName;

  Faculty(this.value, this.facName);

  static List<Fruit> getFruit() {
    return <Fruit>[
      Fruit("Banana", "กล้วย", false),
      Fruit("Orange", "ส้ม", false),
      Fruit("Apple", "แอปเปิ้ล", false),
      Fruit("Papaya", "มะละกอ", false),
      Fruit("Coconut", "มะพร้าว", false),
    ];
  }
}*/


