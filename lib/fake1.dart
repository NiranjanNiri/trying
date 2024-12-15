import 'dart:convert';
//5,6,9,10,11,12 via APIPHENY
import 'package:api/fake2.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';
class fake1 extends StatefulWidget {
  const fake1({super.key});

  @override
  State<fake1> createState() => _fake1State();
}

class _fake1State extends State<fake1> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchdata();
  }

    List data=[];
    fetchdata()async{
      final response=await http.get(Uri.parse(
          "https://fakestoreapi.com/products"
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
                  scrollDirection: Axis.horizontal,
                    itemCount: data.length,
                    itemBuilder: (BuildContext context,int index){
                      return data.isEmpty?CircularProgressIndicator():GestureDetector(
                        onTap: (){
                         Navigator.push(context, MaterialPageRoute(builder: (context)=> fake20(id:data[index]["id"]) ));
                        },
                        child: Container(
                          height: 340,
                          child: Column(
                            children: [
                              // Text(data[index]["id"].toString()),
                              // Text(data[index]["title"].toString()),
                              // Text(data[index]["price"] .toString()),
                              // Text(data[index]["description"].toString()),
                              // Text(data[index]["category"].toString()),
                              Container(
                                height: 100,
                                width: 100,
                                decoration: BoxDecoration(
                                  image: DecorationImage(image: NetworkImage(data[index]["image"]))
                                ),

                              ),

                              // Text(data[index]["rating"]  ["rate"].toString()),
                              // Text(data[index]["rating"] ["count"].toString()),
                            ],
                          ),
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
