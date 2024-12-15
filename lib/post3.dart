import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class post3 extends StatefulWidget {
  const post3({super.key});

  @override
  State<post3> createState() => _post1State();
}

class _post1State extends State<post3> {
  TextEditingController a=TextEditingController();
  TextEditingController b=TextEditingController();
  TextEditingController c=TextEditingController();
  TextEditingController d=TextEditingController();
  fetchdata()async{
    final reponse=await http.post(Uri.parse("http://49.204.232.254:98/gt/employee/create"),
    headers: {
      "content-type":"application/json"
        },
      body: json.encode({
           "employee_id":a.text,
          "employee_name":b.text,
          "employee_phone":c.text,
          "employee_address":d.text
         })
    );
    print(reponse.statusCode);
    if(reponse.statusCode==200||reponse.statusCode==201){
      print("successfully");
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            TextFormField(
              controller: a,
            ),
            TextFormField(
              controller: b,
            ),
            TextFormField(
              controller: c,
            ),
            TextFormField(
              controller: d,
            ),
            ElevatedButton(onPressed: (){
              fetchdata();
            }, child: Text("OK"))
          ],
        ),
      ),
    );
  }
}
