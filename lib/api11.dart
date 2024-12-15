import 'dart:convert';
//5,6,9,10,11,12 via APIPHENY
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';
class api1 extends StatefulWidget {
  const api1({super.key});

  @override
  State<api1> createState() => _api1State();
}

class _api1State extends State<api1> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchdata();
  }
  var a={};
  fetchdata()async{
    final response=await http.get(Uri.parse(
        "https://ipinfo.io/161.185.160.93/geo"
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
      body: Column(
        children: [
          Center(child: SizedBox(height: 200)),
          ElevatedButton(onPressed: (){
            fetchdata();
          }, child: Text("OK")),
         SizedBox(height: 30),

         // a.isEmpty?CircularProgressIndicator():Text(a["count"].toString()),
         // a.isEmpty?CircularProgressIndicator():Text(a["count"]),
         //      image: DecorationImage(image: NetworkImage(a["message"]))

          a.isEmpty?CircularProgressIndicator():Text(a["ip"].toString()),
          a.isEmpty?CircularProgressIndicator():Text(a["city"]),
          a.isEmpty?CircularProgressIndicator():Text(a["region"]),
          a.isEmpty?CircularProgressIndicator():Text(a["country"]),
          a.isEmpty?CircularProgressIndicator():Text(a["loc"]),
          a.isEmpty?CircularProgressIndicator():Text(a["org"]),
          a.isEmpty?CircularProgressIndicator():Text(a["postal"].toString()),
          a.isEmpty?CircularProgressIndicator():Text(a["timezone"].toString()),
          a.isEmpty?CircularProgressIndicator():

          RichText(
            text: TextSpan(
              text: 'America/', // Regular text
              style: TextStyle(color: Colors.black), // Default style
              children: <TextSpan>[
                TextSpan(
                  text: 'New_York', // Hyperlinked text
                  style: TextStyle(
                    color: Colors.blue,
                    decoration: TextDecoration.underline,
                  ),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      final String timezone = 'America/New_York'; // Fixed timezone
                      final String url = 'https://example.com/api?timezone=$timezone'; // Update with your endpoint
                      launchUrl(Uri.parse(url));
                    },
                ),
              ],
            ),
          ),



          a.isEmpty?CircularProgressIndicator():
          Container(
            child: GestureDetector(
                onTap: () { launchUrl(Uri.parse("https://ipinfo.io/missingauth")); },
                child: Text(a["readme"],style: TextStyle(color: Colors.blue),)),
          ),


        ],
      ),
    );
  }
}
