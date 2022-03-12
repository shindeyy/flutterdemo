import 'package:flutter/material.dart';
import 'package:flutter_demo/main.dart';

class _TimePickerDemo extends State<MyHomePage>{
  TimeOfDay? time = const TimeOfDay(hour: 12, minute: 12);

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
            time = newTime;
          }
        },
        child: const Icon(
            Icons.access_time_filled_outlined),
      ),
    );
    throw UnimplementedError();
  }
  
}