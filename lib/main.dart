import 'package:flutter/material.dart';

void main(){
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: datetime(),
  ));
}
class datetime extends StatefulWidget {
  const datetime({Key? key}) : super(key: key);

  @override
  State<datetime> createState() => _datetimeState();
}

class _datetimeState extends State<datetime> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("time and date picker")),
      ),
      body: Center(

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Select date",style: TextStyle(fontWeight: FontWeight.w700,fontSize: 20),),
            ElevatedButton(onPressed: () async{
              DateTime? datePicked = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(2021),
                  lastDate: DateTime(2023));
              if(datePicked!=null){
                print('Date selected : ${datePicked.year}');
              }
            },
                child: Text("Show")),
            ElevatedButton(onPressed: () async {
              TimeOfDay? pickedtime = await showTimePicker(
                  context: context,
                  initialTime: TimeOfDay.now(),
                initialEntryMode: TimePickerEntryMode.dial
              );
              if(pickedtime!=null){
                print("time selected: ${pickedtime.hour}:${pickedtime.minute}");
              }
            },
                child: Text("Select time"))
          ],
        ),
      ),
    );
  }
}
