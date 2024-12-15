import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class api3 extends StatefulWidget {
  const api3({super.key});

  @override
  State<api3> createState() => _api3State();
}

class _api3State extends State<api3> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchdata();
  }
  
  var a={};
  fetchdata()async{
    final response=await http.get(Uri.parse("https://api.coindesk.com/v1/bpi/currentprice.json"));
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
            a.isEmpty?CircularProgressIndicator():Text(a["time"]["updated"].toString()),
            SizedBox(height: 10,),
            a.isEmpty?CircularProgressIndicator():Text(a["time"]["updatedISO"].toString()),
            SizedBox(height: 10),
            a.isEmpty?CircularProgressIndicator():Text(a["time"]["updateduk"].toString()),
            SizedBox(height: 10),
            a.isEmpty?CircularProgressIndicator():Text(a["disclaimer"].toString()),
            SizedBox(height: 10),
            a.isEmpty?CircularProgressIndicator():Text(a["chartName"].toString()),
            SizedBox(height: 10),

            a.isEmpty?CircularProgressIndicator():Text(a["bpi"]["USD"]["code"].toString()),
            SizedBox(height: 10),
            a.isEmpty?CircularProgressIndicator():Text(a["bpi"]["USD"]["symbol"].toString()),
            SizedBox(height: 10),
            a.isEmpty?CircularProgressIndicator():Text(a["bpi"]["USD"]["rate"].toString()),
            SizedBox(height: 10),
            a.isEmpty?CircularProgressIndicator():Text(a["bpi"]["USD"]["description"].toString()),
            SizedBox(height: 10),
            a.isEmpty?CircularProgressIndicator():Text(a["bpi"]["USD"]["rate_float"].toString()),
            SizedBox(height: 10),



            a.isEmpty?CircularProgressIndicator():Text(a["bpi"]["GBP"]["code"].toString()),
            SizedBox(height: 10),
            a.isEmpty?CircularProgressIndicator():Text(a["bpi"]["GBP"]["symbol"].toString()),
            SizedBox(height: 10),
            a.isEmpty?CircularProgressIndicator():Text(a["bpi"]["GBP"]["rate"].toString()),
            SizedBox(height: 10),
            a.isEmpty?CircularProgressIndicator():Text(a["bpi"]["GBP"]["description"].toString()),
            SizedBox(height: 10),
            a.isEmpty?CircularProgressIndicator():Text(a["bpi"]["GBP"]["rate_float"].toString()),
            SizedBox(height: 10),


            a.isEmpty?CircularProgressIndicator():Text(a["bpi"]["EUR"]["code"].toString()),
            SizedBox(height: 10),
            a.isEmpty?CircularProgressIndicator():Text(a["bpi"]["EUR"]["symbol"].toString()),
            SizedBox(height: 10),
            a.isEmpty?CircularProgressIndicator():Text(a["bpi"]["EUR"]["rate"].toString()),
            SizedBox(height: 10),
            a.isEmpty?CircularProgressIndicator():Text(a["bpi"]["EUR"]["description"].toString()),
            SizedBox(height: 10),
            a.isEmpty?CircularProgressIndicator():Text(a["bpi"]["EUR"]["rate_float"].toString()),
            SizedBox(height: 10),



          ],
        ),
      ),
    );
  }
}
