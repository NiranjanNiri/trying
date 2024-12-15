import 'dart:convert';
//5,6,9,10,11,12 via APIPHENY
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';
class api6 extends StatefulWidget {
  const api6({super.key});

  @override
  State<api6> createState() => _api6State();
}

class _api6State extends State<api6> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchdata();
  }
  var a={};
  fetchdata()async{
    final response=await http.get(Uri.parse(
        "https://api.genderize.io?name=luc"
    ));
    if(response.statusCode==200){
      setState(() {
        a=json.decode(response.body);
        print(a);
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [



            a.isEmpty?CircularProgressIndicator():Text(a["count"].toString()),
            a.isEmpty?CircularProgressIndicator():Text(a["name"].toString()),
            a.isEmpty?CircularProgressIndicator():Text(a["gender"].toString()),
            a.isEmpty?CircularProgressIndicator():Text(a["probability"].toString()),




          ],
        ),
      ),
    );
  }
}
