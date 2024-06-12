import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  Map<dynamic,dynamic> data={};

  @override
  Widget build(BuildContext context) {
    // final args = ModalRoute.of(context)?.settings.arguments as Map<dynamic, dynamic>?;
    //
    // // If args is not null, assign it to data
    // if (args != null) {
    //   data = args;
    // }
    data = data.isNotEmpty ? data : (ModalRoute.of(context)?.settings.arguments as Map<dynamic, dynamic>?) ?? {};



    print(data);
    bool isDaytime = data['isDaytime'] == true;
    String bgimage=isDaytime? 'day.png':'night.png';
    // Colors bhcolor=data['isdaytime']?Colors.blue:Colors.indigo[700];

    return Scaffold(
      body: SafeArea(
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/$bgimage'),
                fit: BoxFit.cover,
              )
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0.0,120.0, 0.0, 0.0),
              child: Column(
                      children: [
              TextButton.icon(
                onPressed : () async{
                  dynamic result=await Navigator.pushNamed(context, '/location');
                  setState((){
                    data={
                      'time':result['time'],
                      'location':result['location'],
                      'flag':result['flag'],
                      'isDaytime':result['isDaytime'],

                    };
                  });
                },
                icon:Icon(
                    Icons.edit_location,
                    color: Colors.grey[300],
                ),
                label:Text(
                    'edit location',
                  style: TextStyle(
                    color: Colors.grey[300],
                  ),
                )
              ),
              SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    data['location'],
                    style: TextStyle(
                      fontSize: 28.0,
                      letterSpacing: 2.0,
                      color: Colors.white,
                    ),
                  )
                ],
              ),
                        SizedBox(height: 20.0),
                        Text(
                          data['time'],
                          style: TextStyle(
                            fontSize: 66.0,
                            color: Colors.white,
                          ),
                        )
                      ],
                    ),
            ),
          )),
    );
  }
}
