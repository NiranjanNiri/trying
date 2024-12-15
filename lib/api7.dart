import 'dart:convert';
//5,6,9,10,11,12 via APIPHENY
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';
class api7 extends StatefulWidget {
  const api7({super.key});

  @override
  State<api7> createState() => _api7State();
}

class _api7State extends State<api7> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchdata();
  }
  var a={};
  fetchdata()async{
    final response=await http.get(Uri.parse(
        "https://api.nationalize.io?name=nathaniel"
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



            a.isEmpty ? CircularProgressIndicator() : Text(a["count"].toString()),
            a.isEmpty ? CircularProgressIndicator() : Text(a["name"].toString()),
            a.isEmpty ? CircularProgressIndicator() : Text(a["country"][0]["country_id"].toString()),
            a.isEmpty ? CircularProgressIndicator() : Text(a["country"][0]["probability"].toString()),
            a.isEmpty ? CircularProgressIndicator() : Text(a["country"][1]["country_id"].toString()),
            a.isEmpty ? CircularProgressIndicator() : Text(a["country"][1]["probability"].toString()),
            a.isEmpty ? CircularProgressIndicator() : Text(a["country"][2]["country_id"].toString()),
            a.isEmpty ? CircularProgressIndicator() : Text(a["country"][2]["probability"].toString()),
            a.isEmpty ? CircularProgressIndicator() : Text(a["country"][3]["country_id"].toString()),
            a.isEmpty ? CircularProgressIndicator() : Text(a["country"][3]["probability"].toString()),
            a.isEmpty ? CircularProgressIndicator() : Text(a["country"][4]["country_id"].toString()),
            a.isEmpty ? CircularProgressIndicator() : Text(a["country"][4]["probability"].toString()),




          ],
        ),
      ),
    );
  }
}
