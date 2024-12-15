import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class post2 extends StatefulWidget {
  const post2({super.key});

  @override
  State<post2> createState() => _post2State();
}

class _post2State extends State<post2> {
  @override
  fetchdata() async {
    final reponse = await http.post(
        Uri.parse("http://49.204.232.254:98/gt/employee/getbyid"),
        headers: {"content-type": "application/json"},
        body: json.encode({
          "allocationId": a.text,
          "clientId": b.text,
          "categoryId": c.text,
          "employeeId": d.text,
          "description": e.text,
          "scheduledDate": f.text,
          "dueDate": g.text,
          "status": h.text,
          "startedDate": i.text,
          "completedDate": j.text,
          "uploadsPath": k.text,
          "createdBy": l.text,
        }));
    print(reponse.statusCode);
    if (reponse.statusCode == 200 || reponse.statusCode == 201) {
      print("successfully");
    }
  }

  TextEditingController a = TextEditingController();
  TextEditingController b = TextEditingController();
  TextEditingController c = TextEditingController();
  TextEditingController d = TextEditingController();
  TextEditingController e = TextEditingController();
  TextEditingController f = TextEditingController();
  TextEditingController g = TextEditingController();
  TextEditingController h = TextEditingController();
  TextEditingController i = TextEditingController();
  TextEditingController j = TextEditingController();
  TextEditingController k = TextEditingController();
  TextEditingController l = TextEditingController();

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
          TextFormField(
            controller: e,
          ),
          TextFormField(
            controller: f,
          ),
          TextFormField(
            controller: g,
          ),
          TextFormField(
            controller: h,
          ),
          TextFormField(
            controller: i,
          ),
          TextFormField(
            controller: j,
          ),
          TextFormField(
            controller: k,
          ),
          TextFormField(
            controller: l,
          ),
          ElevatedButton(
              onPressed: () {
                fetchdata();
              },
              child: Text("Post it")),
        ],
      ),
    );
  }
}
