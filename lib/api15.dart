import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class api15 extends StatefulWidget {
  const api15({super.key});

  @override
  State<api15> createState() => _api15State();
}

class _api15State extends State<api15> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchdata();
  }

  var a={};
  fetchdata()async{
    final response=await http.get(Uri.parse(
        "https://api.zippopotam.us/us/33162"
          ));
    if(response.statusCode==200){
      setState(() {
        a=json.decode(response.body);
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            a.isEmpty?CircularProgressIndicator():Text(a["post code"].toString()),
            a.isEmpty?CircularProgressIndicator():Text(a["country"].toString()),
            a.isEmpty?CircularProgressIndicator():Text(a["country abbreviation"].toString()),
            a.isEmpty?CircularProgressIndicator():Text(a["places"] [0]["place name"].toString()),
            a.isEmpty?CircularProgressIndicator():Text(a["places"] [0]["longitude"].toString()),
            a.isEmpty?CircularProgressIndicator():Text(a["places"] [0]["state"].toString()),
            a.isEmpty?CircularProgressIndicator():Text(a["places"] [0]["state abbreviation"].toString()),
            a.isEmpty?CircularProgressIndicator():Text(a["places"] [0]["latitude"].toString()),





          ],
        ),
      ),
    );
  }
}
