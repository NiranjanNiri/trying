import 'dart:convert';
//5,6,9,10,11,12 via APIPHENY
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';
class api8 extends StatefulWidget {
  const api8({super.key});

  @override
  State<api8> createState() => _api8State();
}

class _api8State extends State<api8> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchdata();
  }
  var a={};
  List data=[];
  fetchdata()async{
    final response=await http.get(Uri.parse(
        "https://datausa.io/api/data?drilldowns=Nation&measures=Population"
    ));
    if(response.statusCode==200){
      setState(() {
        a=json.decode(response.body);
        data=json.decode(response.body)["data"];
        print(a);
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
         children: [
           Container(
             height: 700,
             child: ListView.builder(
                 itemCount: data.length,
                 itemBuilder: (BuildContext context,int index){
               return data.isEmpty?CircularProgressIndicator():Container(
                 height: 150,
                 child: Column(
                   children: [
                     Text(data[index]["ID Nation"].toString()),
                     Text(data[index]["Nation"].toString()),
                     Text(data[index]["ID Year"].toString()),
                     Text(data[index]["Year"].toString()),
                     Text(data[index]["Population"].toString()),
                     Text(data[index]["Slug Nation"].toString()),
                   ],
                 ),
               );
             }),
           ),
           Text(a["source"][0]["measures"][0].toString()),
           Text(a["source"][0]["annotations"]["source_name"].toString()),
           Text(a["source"][0]["annotations"]["source_description"].toString()),
           Text(a["source"][0]["annotations"]["dataset_name"].toString()),
           Text(a["source"][0]["annotations"]["dataset_link"].toString()),
           Text(a["source"][0]["annotations"]["table_id"].toString()),
           Text(a["source"][0]["annotations"]["topic"].toString()),
           Text(a["source"][0]["annotations"]["subtopic"].toString()),
           Text(a["source"][0]["name"].toString()),
           Text(a["source"][0]["substitutions"].toString()),

         ],
          ),
        ),
      ),
    );
  }
}
