import 'package:flutter/material.dart';

void main() {
  runApp(const TemperatureConverterMain());
}

// Create a new stateless widget

class TemperatureConverterMain extends StatelessWidget {
  const TemperatureConverterMain({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TemperatureConverter(),
    );
  }
}
// the actual app
class TemperatureConverter extends StatefulWidget {
  const TemperatureConverter({super.key});

  @override
  State<TemperatureConverter> createState() => _TemperatureConverterState();
}

class _TemperatureConverterState extends State<TemperatureConverter> {
  // All clarr variables
  int groupValue = 0;
  double T = 0.0; // temperature to convert
  double R = 0.0; // converted value

  double sliderValue = 20.0;
  Color sliderColor =Colors.black;

  // Holds the display text for the last Text widget
  String converted = "";


  // custom methods/functions
  performConversion(int value) {
    setState(() {
      
    groupValue = value;

    // Formulas
    // C = (F - 32) X 5/9
    // F = (C X 9/5) + 32
    // value holds the value of the checked radio button 1 or 2
    if(value == 1){ 
      // F to C
      R = (T - 32) * (5/9);
      converted = "$R C";
      if (R < 0){
        sliderColor = Colors.purple;
      } else if (R < 11){
        sliderColor = Colors.blue;
      } else if (R < 22){
        sliderColor = Colors.green;
      } else if (R < 27){
        sliderColor = Colors.yellow;
      } else {
        sliderColor = Colors.red;
      }
    }else if (value == 2){
      // C to F
      R = (T * 1.8) + 32;
      converted = "$R F";
      if (R < 32){
        sliderColor = Colors.purple;
      } else if (R < 52){
        sliderColor = Colors.blue;
      } else if (R < 72){
        sliderColor = Colors.green;
      } else if (R < 82){
        sliderColor = Colors.yellow;
      } else {
        sliderColor = Colors.red;
      }
    }

    if (R > 100){
      sliderValue = 100;
    } else if (R < 0){
      sliderValue = 0;
    } else {
      sliderValue = R;
    }
    print(R);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Temperature Converter"),
        backgroundColor: Colors.blueGrey,
      ),
      body: Padding(
        padding: EdgeInsets.all(36.0),
        child: Column(
          children:<Widget>[
            SizedBox(height: 10.0),
            TextField(
              decoration: InputDecoration(labelText: "Enter temperature"),
              onChanged:(String value) {
                // TODO something with value
                if (value == ""){
                  // HEY write something
                } else {
                  T = double.parse(value);
                }
              },
            ),
            SizedBox(height: 10.0),
            Row(
              children: <Widget>[
                Radio(
                  value: 1, // F to C option 1
                  groupValue: groupValue, 
                  onChanged: (e) => {
                    // TODO conversion logic
                    performConversion(e!)
                  }),
                Text('F to C'),
                SizedBox(height: 10.0,),
                Radio(
                  value: 2, // C to F option 2
                  groupValue: groupValue, 
                  onChanged: (e) => {
                    // TODO conversion logic
                    performConversion(e!)
                  }),
                Text('C to F'),
              ],
            ),
            SizedBox(height: 10.0),
            TextButton(
              onPressed: ()=>{
                setState(() {
                  // Perform clearing operations
                  converted = "";
                  groupValue = 0;
                })
              }, 
              child: Text('Clear')
            ),
            SizedBox(height: 20.0),
            Text(converted),
            SizedBox(height: 10.0),
            Slider(
              value: sliderValue, 
              onChanged: (value){},
              activeColor: sliderColor,
              min: 0,
              max: 100.0)
          ]
        ),
      ),
    );
  }
}
