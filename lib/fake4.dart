import 'dart:convert';
//5,6,9,10,11,12 via APIPHENY
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';
class fake4 extends StatefulWidget {
  const fake4({super.key});

  @override
  State<fake4> createState() => _fake4State();
}

class _fake4State extends State<fake4> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchdata();
  }

  List data=[];
  fetchdata()async{
    final response=await http.get(Uri.parse(
        "https://fakestoreapi.com/carts?userId=1"
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
                        height: 290,
                        child: Column(
                          children: [
                            Text(data[index]["id"].toString()),
                            Text(data[index]["userId"].toString()),
                            Text(data[index]["date"].toString()),

                            for (dynamic product in data[index]["products"]) ...
                            [
                              Text(product["productId"].toString()),
                              Text(product["quantity"].toString()),
                            ],

                      Text(data[index]["__v"].toString()),
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
