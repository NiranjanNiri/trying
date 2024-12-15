import 'dart:convert';
//5,6,9,10,11,12 via APIPHENY
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';
class fake3 extends StatefulWidget {
  const fake3({super.key});

  @override
  State<fake3> createState() => _fake3State();
}

class _fake3State extends State<fake3> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchdata();
  }

  List data=[];
  fetchdata()async{
    final response=await http.get(Uri.parse(
        "https://fakestoreapi.com/products/categories"
    ));
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
                        child: Column(
                          children: [
                            Text(data[index].toString()),

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
