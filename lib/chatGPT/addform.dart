// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:home_app/services/services.dart';

class PersonAdd extends StatefulWidget {
  const PersonAdd({super.key});

  @override
  State<PersonAdd> createState() => _PersonAddState();
}

class _PersonAddState extends State<PersonAdd> {
  final formKey = GlobalKey<FormState>();

  final _namecontroller = TextEditingController();

  final _biocontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Add a person to our database",
          style: TextStyle(fontSize: 18),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          top: 38.0,
          left: 20,
          right: 35,
        ),
        child: Column(
          children: [
            TextField(
              enableInteractiveSelection: true,
              controller: _namecontroller,
              decoration: InputDecoration(
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                labelText: 'Username',
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              enableInteractiveSelection: true,
              controller: _biocontroller,
              decoration: InputDecoration(
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                labelText: 'Bio',
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () async {
                  if (_biocontroller.text.isNotEmpty &&
                      _namecontroller.text.isNotEmpty) {
                    final data = {
                      "username": _namecontroller.text,
                      "bio": _biocontroller.text,
                    };
                    Uri uri = Uri.https(
                      'web-production-9444.up.railway.app',
                      '/advocates/',
                    );
                    final response = await http.post(
                      uri,
                      body: json.encode(data),
                      headers: {"Content-Type": "application/json"},
                    );
                    if (response.statusCode == 200) {
                      showDialog(
                        context: context,
                        builder: (_) => AlertDialog(
                          title: const Text('Submission status'),
                          content: Text(
                              '"${_namecontroller.text}" added succesfully'),
                          actions: [
                            ElevatedButton(
                              onPressed: () {
                                Navigator.of(context).pushReplacementNamed('/api');
                              },
                              child: const Text('Ok'),
                            ),
                          ],
                        ),
                      );
                    } else {
                      showDialog(
                        context: context,
                        builder: (_) => AlertDialog(
                          title: const Text('Submission status'),
                          content: Text('${response.statusCode} Error occured'),
                          actions: [
                            ElevatedButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: const Text('Ok'),
                            ),
                          ],
                        ),
                      );
                    }
                  }
                },
                child: const Text("Create"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
