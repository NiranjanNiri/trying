import 'dart:convert';
//5,6,9,10,11,12 via APIPHENY
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';
class api14 extends StatefulWidget {
  const api14({super.key});

  @override
  State<api14> createState() => _api14State();
}

class _api14State extends State<api14> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchdata();
  }

  List data=[];
  fetchdata()async{
    final response=await http.get(Uri.parse(
"http://universities.hipolabs.com/search?country=United+States"    ));
    if(response.statusCode==200){
      setState(() {

        data=json.decode(response.body);

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
                            Text(data[index]["country"]),
                            Text(data[index]["alpha_two_code"].toString()),
                            Text(data[index]["web_pages"] [0].toString()),

                            Text(data[index]["state_province"].toString()),
                            Text(data[index]["name"].toString()),
                            Text(data[index]["domains"] [0].toString()),
                          ],
                        ),
                      );
                    }),
              ),


            ],
          ),
        ),
      ),
    );
  }
}
