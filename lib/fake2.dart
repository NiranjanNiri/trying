import 'dart:convert';
//5,6,9,10,11,12 via APIPHENY
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';
class fake20 extends StatefulWidget {
  final int id;
  const fake20({super.key,required this.id});

  @override
  State<fake20> createState() => _fake20State();
}

class _fake20State extends State<fake20> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchdata();
  }

  var data={};
  fetchdata()async{
    final response=await http.get(Uri.parse(
        "https://fakestoreapi.com/products/${widget.id}"
    ));
    if(response.statusCode==200){
      setState(() {

        data=json.decode(response.body);
        print(data);

      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 700,
            child: ListView.builder(
                itemCount: data.length,
                scrollDirection: Axis.vertical,
                itemBuilder: (BuildContext context,int index){
                  return data.isEmpty?CircularProgressIndicator():Container(
                    height: 320,
                    child: Column(
                      children: [
                        Text(data["id"].toString()),
                        Text(data["title"].toString()),
                          Text(data["price"] .toString()),
                        Text(data["description"].toString()),
                        Text(data["category"].toString()),
                        Container(
                          height: 100,
                          width: 100,
                          decoration: BoxDecoration(
                              image: DecorationImage(image: NetworkImage(data["image"]))
                          ),

                        ),
                        Text(data["rating"]  ["rate"].toString()),
                        Text(data["rating"] ["count"].toString()),
                      ],
                    ),
                  );
                }),
          ),


        ],
      ),
    );
  }
}
