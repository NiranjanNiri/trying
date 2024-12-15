import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
class post1 extends StatefulWidget {
  const post1({super.key});

  @override
  State<post1> createState() => _post1State();
}

class _post1State extends State<post1> {
  @override
  fetchdata()async{
    final reponse=await http.post(Uri.parse(
"http://catodotest.elevadosoftwares.com/Category/InsertCategory"
    ),
        headers: {
          "content-type":"application/json"
        },
        body: json.encode({
          "categoryId":a.text,
          "category":b.text,
          "description":c.text,
          "createdBy":d.text
        })
    );
    print(reponse.statusCode);
    if(reponse.statusCode==200||reponse.statusCode==201){
      print("successfully");
    }
  }
  TextEditingController a = TextEditingController();
  TextEditingController b = TextEditingController();
  TextEditingController c = TextEditingController();
  TextEditingController d = TextEditingController();
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
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
          }, child: Text("Post it")),
        ],
      ),



    );
  }
}
