import 'dart:convert';
//5,6,9,10,11,12 via APIPHENY
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';
class api13 extends StatefulWidget {
  const api13({super.key});

  @override
  State<api13> createState() => _api13State();
}

class _api13State extends State<api13> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchdata();
  }
  var a={};
  fetchdata()async{
    final response=await http.get(Uri.parse(

    "https://randomuser.me/api/"    ));
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
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
        
        
        
              a.isEmpty?CircularProgressIndicator():Text(a["results"] [0] ["gender"].toString()),
              a.isEmpty?CircularProgressIndicator():Text(a["results"] [0] ["name"] ["title"].toString()),
              a.isEmpty?CircularProgressIndicator():Text(a["results"] [0] ["name"] ["first"].toString()),
              a.isEmpty?CircularProgressIndicator():Text(a["results"] [0] ["name"] ["last"].toString()),
              a.isEmpty?CircularProgressIndicator():Text(a["results"] [0] ["location"] ["street"]["number"].toString()),
              a.isEmpty?CircularProgressIndicator():Text(a["results"] [0] ["location"] ["street"]["name"].toString()),
              a.isEmpty?CircularProgressIndicator():Text(a["results"] [0] ["location"] ["city"].toString()),
              a.isEmpty?CircularProgressIndicator():Text(a["results"] [0] ["location"] ["state"].toString()),
              a.isEmpty?CircularProgressIndicator():Text(a["results"] [0] ["location"] ["country"].toString()),
              a.isEmpty?CircularProgressIndicator():Text(a["results"] [0] ["location"] ["postcode"].toString()),
              a.isEmpty?CircularProgressIndicator():Text(a["results"] [0] ["location"] ["coordinates"]["latitude"].toString()),
              a.isEmpty?CircularProgressIndicator():Text(a["results"] [0] ["location"] ["coordinates"]["longitude"].toString()),
              a.isEmpty?CircularProgressIndicator():Text(a["results"] [0] ["location"] ["timezone"]["offset"].toString()),
              a.isEmpty?CircularProgressIndicator():Text(a["results"] [0] ["location"] ["timezone"]["description"].toString()),
              a.isEmpty?CircularProgressIndicator():Text(a["results"] [0] ["email"].toString()),
              a.isEmpty?CircularProgressIndicator():Text(a["results"] [0] ["login"] ['uuid'].toString()),
              a.isEmpty?CircularProgressIndicator():Text(a["results"] [0] ["login"] ['username'].toString()),
              a.isEmpty?CircularProgressIndicator():Text(a["results"] [0] ["login"] ['password'].toString()),
              a.isEmpty?CircularProgressIndicator():Text(a["results"] [0] ["login"] ['salt'].toString()),
              a.isEmpty?CircularProgressIndicator():Text(a["results"] [0] ["login"] ['md5'].toString()),
              a.isEmpty?CircularProgressIndicator():Text(a["results"] [0] ["login"] ['sha1'].toString()),
              a.isEmpty?CircularProgressIndicator():Text(a["results"] [0] ["login"] ['sha256'].toString()),
              a.isEmpty?CircularProgressIndicator():Text(a["results"] [0] ["dob"] ['date'].toString()),
              a.isEmpty?CircularProgressIndicator():Text(a["results"] [0] ["dob"] ['age'].toString()),
              a.isEmpty?CircularProgressIndicator():Text(a["results"] [0] ["registered"] ['date'].toString()),
              a.isEmpty?CircularProgressIndicator():Text(a["results"] [0] ["registered"] ['age'].toString()),
              a.isEmpty?CircularProgressIndicator():Text(a["results"] [0] ["phone"]  .toString()),
              a.isEmpty?CircularProgressIndicator():Text(a["results"] [0] ["cell"]  .toString()),
              a.isEmpty?CircularProgressIndicator():Text(a["results"] [0] ["id"]  ["name"].toString()),
              a.isEmpty?CircularProgressIndicator():Text(a["results"] [0] ["id"]  ["value"].toString()),
              a.isEmpty?CircularProgressIndicator():Text(a["results"] [0] ["picture"]  ["large"].toString()),
              a.isEmpty?CircularProgressIndicator():Text(a["results"] [0] ["picture"]  ["medium"].toString()),
              a.isEmpty?CircularProgressIndicator():Text(a["results"] [0] ["picture"]  ["thumbnail"].toString()),
              a.isEmpty?CircularProgressIndicator():Text(a["results"] [0] ["nat"] .toString()),

              a.isEmpty?CircularProgressIndicator():Text(a["info"] ["seed"].toString()),
              a.isEmpty?CircularProgressIndicator():Text(a["info"] ["results"].toString()),
              a.isEmpty?CircularProgressIndicator():Text(a["info"] ["page"].toString()),
              a.isEmpty?CircularProgressIndicator():Text(a["info"] ["version"].toString()),

        
        
            ],
          ),
        ),
      ),
    );
  }
}
