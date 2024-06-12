// import 'package:http/http.dart';
// import 'dart:convert';

// class WorldTime{
//   String location;
//   String time;
//   String flag;
//   String url;
//
//   WorldTime({required this.location, required this.flag,required this.url});
//
//
//   Future<void> getData() async {
//     Response response=await get(Uri.parse('http://worldtimeapi.org/api/timezone/$url'));
//     Map data=jsonDecode(response.body);
//     // print(data);
//     String datetime=data['datetime'];
//     String offset=data['utc_offset'].substring(1,3);
//     // print(datetime);
//     // print(offset);
//     DateTime now=DateTime.parse(datetime);
//     now=now.add(Duration(hours:int.parse(offset)));
//     // print(now);
//     time=now.toString();
//   }
// }


import 'package:http/http.dart' as http; // Ensure you have this import for the HTTP client.
import 'dart:convert';
import 'package:intl/intl.dart';
class WorldTime {
  String location;
  String time='';
  String flag;
  String url;
  bool isDaytime=true;

  WorldTime({required this.location, required this.flag, required this.url});

  Future<void> getData() async {
    final response = await http.get(Uri.parse('http://worldtimeapi.org/api/timezone/$url'));
    if (response.statusCode == 200) {
      Map data = jsonDecode(response.body);
      String datetime = data['datetime'];
      String offset = data['utc_offset'].substring(1, 3);
      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offset)));
      isDaytime=now.hour>6 && now.hour<20 ?true:false;
      time = DateFormat.jm().format(now);
    } else {
      throw Exception('Failed to load data');
      // time='could not get time';
    }
  }
}
