import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
  //runApp(const _TimePickerDemo());
}

class _AppBar extends State<MyHomePage>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
      slivers: [
        const SliverAppBar(
          pinned: true,
          floating: true,
          snap: false,
          title: Text("Fittr"),
          expandedHeight: 130.0,
          flexibleSpace: FlexibleSpaceBar(
            title: Text("Test"),
            centerTitle: true,
          ),
        ),
        SliverList(delegate: SliverChildListDelegate([
            const Text("Fittr test",
            style: TextStyle(fontSize: 1800),),
        ]))
      ],
    ),);
    throw UnimplementedError();
  }

}

class _ChoiceChip extends State<MyHomePage>{
  bool _isSelected = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(
      title: Text(widget.title),
    ),
    body: Center(
        child: ChoiceChip(label: const Text("Choice chip"),
                selected: _isSelected,
                selectedColor: Colors.lightBlueAccent,
                onSelected: (newSelected) {
                    setState(() {
                      _isSelected = newSelected;
                    });
                },),
    ),);
    throw UnimplementedError();
  }

}

class _WidgetDemo extends State<MyHomePage>{
  bool _switchValue = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(
      title: Text(widget.title),
    ),
      body: Center(child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Slider.adaptive(
              value: 1, 
              onChanged: (double newValue){
                setState(() {
                    newValue;
                });
              }),
          SwitchListTile.adaptive(
              value: true,
              title: const Text("Apply"),
              onChanged: (bool newValue){
                setState(() {
                  newValue;
                });
              }),
          Switch.adaptive(
              value: _switchValue,
              onChanged: (bool newValue){
                  setState(() {
                    _switchValue = newValue;
                  });
            }),
          Icon(
            Icons.adaptive.share
          ),
          const CircularProgressIndicator.adaptive()
        ],
    ),),);
    throw UnimplementedError();
  }

}

class _StepperDemo extends State<MyHomePage>{
  int _currentSteps = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title:
          Text(widget.title),),
          body: Center(child: Stepper(steps: const [
            Step(
                title: Text("Step 1"),
                content: Text("Info for step 1")
            ),
            Step(
                title: Text("Step 2"),
                content: Text("Info for step 2")
            ),
            Step(
                title: Text("Step 3"),
                content: Text("Info for step 3")
            ),
            Step(
                title: Text("Step 4"),
                content: Text("Info for step 4")
            ),
            Step(
                title: Text("Step 5"),
                content: Text("Info for step 5")
            ),
            Step(
                title: Text("Step 6"),
                content: Text("Info for step 6")
            ),
            Step(
                title: Text("Step 7"),
                content: Text("Info for step 7")
            ),
            Step(
                title: Text("Step 8"),
                content: Text("Info for step 8")
            ),
            Step(
                title: Text("Step 9"),
                content: Text("Info for step 9")
            )
          ],
            onStepTapped: (int newIndex){
              setState(() {
                _currentSteps = newIndex;
              });
            },
            currentStep: _currentSteps,
            onStepContinue: (){
                if(_currentSteps!=8){
                  setState(() {
                    _currentSteps+=1;
                  });
                }
            },
            onStepCancel: (){
                if(_currentSteps!=0){
                    setState(() {
                      _currentSteps-=1;
                    });
                }
            },
          ),
        ),
    );
    throw UnimplementedError();
  }

}

class _DatePickerDemo extends State<MyHomePage>{
  DateTime? _dateTime = DateTime(2021);

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(
      title: Text(widget.title),
    ),
      body: Center(child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          '${_dateTime!.day.toString()}-${_dateTime!.month.toString()}-${_dateTime!.year.toString()}',
          style: const TextStyle(fontSize: 40),
        ),
        ElevatedButton(
            onPressed: () async {
            DateTime? _newDateTime = await showDatePicker(context: context, initialDate: _dateTime!, firstDate: DateTime(1900), lastDate: DateTime(3000));
            if(_newDateTime!=null){
              setState(() {
                  _dateTime = _newDateTime;
              });
            }
        } , child: const Text("Get Date"))
      ],
    ),
    ),
  );
    throw UnimplementedError();
  }

}

class _TimePickerDemo extends State<MyHomePage>{
  TimeOfDay? time = const TimeOfDay(hour: 10, minute: 15);

  @override
  Widget build(BuildContext context) {
    return Scaffold( appBar: AppBar(
      title: Text(widget.title),
    ), body: Center(child: Text(
      '${time!.hour.toString()}: ${time!.minute.toString()}', style: const TextStyle(fontSize: 60),
    ),
    ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          TimeOfDay? newTime = await showTimePicker(
            context: context,
            initialTime: time!,
          );
          if(newTime!=null){
            setState(() {
              time = newTime;
            });
          }
        },
        child: const Icon(
            Icons.access_time_filled_outlined),
      ),
    );
    throw UnimplementedError();
  }

}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _AppBar();
}

