import 'package:flutter/material.dart';
import 'package:home_app/chatGPT/chatgpt2.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class PersonAdd extends StatefulWidget {
  const PersonAdd({super.key});

  @override
  State<PersonAdd> createState() => _PersonAddState();
}

class _PersonAddState extends State<PersonAdd> {
  final formKey = GlobalKey<FormState>();

  final _namecontroller = TextEditingController();
  //final _companyNamecontroller = TextEditingController();

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
              controller: _namecontroller,
              decoration: InputDecoration(
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                //hintText: 'use your email address ending with (.com only)',
                labelText: 'Username',
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: _biocontroller,
              decoration: InputDecoration(
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                labelText: 'Bio',
              ),
            ),
            // const SizedBox(
            //   height: 10,
            // ),
            // TextField(
            //   controller: _companyNamecontroller,
            //   decoration: InputDecoration(
            //     filled: true,
            //     border: OutlineInputBorder(
            //       borderRadius: BorderRadius.circular(10),
            //     ),
            //     labelText: 'Company Name',
            //   ),
            // ),
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
                      //"company": _companyNamecontroller.text,
                    };
                    var url = Uri.http('localhost:8000', '/advocates/');
                    final response = await http.post(
                      url,
                      body: json.encode(data),
                      headers: {"Content-Type": "application/json"},
                    );
                    //print(response.statusCode);
                    if (response.statusCode == 200) {
                      showDialog(
                        context: context,
                        builder: (_) => AlertDialog(
                          title: const Text('Submission status'),
                          content: const Text(
                              'Submission succesfully!!!!\nOne advocate added'),
                          actions: [
                            ElevatedButton(
                              onPressed: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) {
                                      return const MyHorizontalContainer();
                                    },
                                  ),
                                );
                              },
                              child: const Text('Ok'),
                            ),
                          ],
                        ),
                      );
                    } else {}
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
