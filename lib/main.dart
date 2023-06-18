import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: '급여 계산기'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final inputContorller = TextEditingController();
  var button_text_list = [
    "", "C", ">", "%",
    "7", "8", "9", "X",
    "4", "5", "6", "-",
    "", "0", ".", "=",
  ];
  var operator = "";
  var input_1 = "";

  void button_clicked(button_text) {
    if (["+", "-", "X", "%"].contains(button_text)) {
      operator = button_text;
      input_1 = inputContorller.text;
      inputContorller.text = "";
    } else if (button_text == "C") {
      inputContorller.text = "";
      operator = "";
    } else if (button_text == "<") {
      inputContorller.text =
          inputContorller.text.substring(0, inputContorller.text.length - 1);
    } else if (button_text == "=") {
      var result = 0.0;
      if (operator == "+") {
        result = double.parse(input_1) + double.parse(inputContorller.text);
      } else if (operator == "-") {
        result = double.parse(input_1) - double.parse(inputContorller.text);
      } else if (operator == "X") {
        result = double.parse(input_1) * double.parse(inputContorller.text);
      } else if (operator == "%") {
        result = double.parse(input_1) / double.parse(inputContorller.text);
      }
      inputContorller.text = result.toString();
    } else if (button_text == "") {

    } else {
      inputContorller.text = inputContorller.text + button_text;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: inputContorller,
              ),

              Row(
                children: [
                  ElevatedButton(child: Text(""), onPressed: () {
                    button_clicked("");
                  },),
                  ElevatedButton(child: Text("C"), onPressed: () {
                    button_clicked("C");
                  },),
                  ElevatedButton(child: Text("<"), onPressed: () {
                    button_clicked("<");
                  },),
                  ElevatedButton(child: Text("%"), onPressed: () {
                    button_clicked("%");
                  },),
                ],
              ),
              Row(
                children: [
                  ElevatedButton(child: Text("7"), onPressed: () {
                    button_clicked("7");
                  },),
                  ElevatedButton(child: Text("8"), onPressed: () {
                    button_clicked("8");
                  },),
                  ElevatedButton(child: Text("9"), onPressed: () {
                    button_clicked("9");
                  },),
                  ElevatedButton(child: Text("X"), onPressed: () {
                    button_clicked("X");
                  },),
                ],
              ),
              Row(
                children: [
                  ElevatedButton(child: Text("4"), onPressed: () {
                    button_clicked("4");
                  },),
                  ElevatedButton(child: Text("5"), onPressed: () {
                    button_clicked("5");
                  },),
                  ElevatedButton(child: Text("6"), onPressed: () {
                    button_clicked("6");
                  },),
                  ElevatedButton(child: Text("-"), onPressed: () {
                    button_clicked("-");
                  },),
                ],
              ),
              Row(
                children: [
                  ElevatedButton(child: Text("1"), onPressed: () {
                    button_clicked("1");
                  },),
                  ElevatedButton(child: Text("2"), onPressed: () {
                    button_clicked("2");
                  },),
                  ElevatedButton(child: Text("3"), onPressed: () {
                    button_clicked("3");
                  },),
                  ElevatedButton(child: Text("+"), onPressed: () {
                    operator = "+";
                    input_1 = inputContorller.text;
                    inputContorller.text = "";
                    setState(() {});
                  },),
                ],
              ),
              Row(
                children: [
                  ElevatedButton(child: Text(""), onPressed: () {},),
                  ElevatedButton(child: Text("0"), onPressed: () {
                    button_clicked("0");
                  },),
                  ElevatedButton(child: Text("."), onPressed: () {
                    inputContorller.text = inputContorller.text + ".";
                    setState(() {});
                  },),
                  ElevatedButton(child: Text("="), onPressed: () {
                   var result = 0.0;
                    if (operator == "+") {
                      result = double.parse(input_1) + double.parse(inputContorller.text);
                    } else if(operator == "-") {
                      result = double.parse(input_1) - double.parse(inputContorller.text);
                    } else if(operator == "X") {
                      result = double.parse(input_1) * double.parse(inputContorller.text);
                    } else if(operator == "%") {
                      result = double.parse(input_1) / double.parse(inputContorller.text);
                    }
                      inputContorller.text = result. toString();
                      setState(() {});
                  },),
                ],
              ),
            ],
          )
      ),
    );
  }
}

