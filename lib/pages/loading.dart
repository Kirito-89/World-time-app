import 'package:flutter/material.dart';
import '/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
// import 'int'
class loading extends StatefulWidget {
  const loading({super.key});

  @override
  State<loading> createState() => _loadingState();
}

class _loadingState extends State<loading> {

  // String time='loading';

 void setWorldTime() async{
   WorldTime instance=WorldTime(location:'Berlin', flag:'germany.png',url: '/Europe/Berlin');
   await instance.getData();
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location':instance.location,
      'flag':instance.flag,
      'time':instance.time,
      'isDaytime':instance.isDaytime,
    });
 }
  
  // Future<void> getData() async {
  //   final response = await get(Uri.parse('http://worldtimeapi.org/api/timezone/Europe/London'));
  //   if (response.statusCode == 200) {
  //     List<dynamic> data = jsonDecode(response.body);
  //     print(data);
  //   } else {
  //     print('Failed to load data');
  //   }
  // }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      body:Center(
        child: SpinKitFadingCircle(
          itemBuilder: (BuildContext context, int index) {
            return DecoratedBox(
              decoration: BoxDecoration(
                color: index.isEven ? Colors.red : Colors.green,
              ),
            );
          },
        ),
      ),
    );
  }
}



