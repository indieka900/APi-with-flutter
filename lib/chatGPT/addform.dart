import 'package:flutter/material.dart';
import 'package:home_app/chatGPT/addperson.dart';
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

  final _biocontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
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
            const SizedBox(
              height: 25,
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () async {
                  final data = {
                    "username": _namecontroller.text,
                    "bio": _biocontroller.text,
                  };
                  var url = Uri.http('localhost:8000', '/advocates/');
                  final response = await http.post(
                    url,
                    body: json.encode(data),
                    headers: {"Content-Type": "application/json"},
                  );
                  if (response.statusCode == 201) {
                    showDialog(
                      context: context,
                      builder: (_) => AlertDialog(
                        title: const Text('title'),
                        content: const Text('err'),
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
                  } else {}
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



// class CreateScreen extends StatefulWidget {
//   const CreateScreen({super.key});

//   @override
//   // ignore: library_private_types_in_public_api
//   _CreateScreenState createState() => _CreateScreenState();
// }

// class _CreateScreenState extends State<CreateScreen> {
//   final _nameController = TextEditingController();
//   final _bioController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Create"),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Column(
//           children: <Widget>[
//             TextField(
//               controller: _nameController,
//               decoration: const InputDecoration(labelText: "Username"),
//             ),
//             TextField(
//               controller: _bioController,
//               decoration: const InputDecoration(labelText: "Bio"),
//             ),
//             ElevatedButton(
//               onPressed: () async {
//                 final data = {
//                   "username": _nameController.text,
//                   "bio": _bioController.text,
//                 };
//                 var url = Uri.http('localhost:8000', '/advocates/');
//                 final response = await http.post(
//                   url,
//                   body: json.encode(data),
//                   headers: {"Content-Type": "application/json"},
//                 );
//                 if (response.statusCode == 201) {
//                   // handle success
//                 } else {
//                   // handle error
//                 }
//               },
//               child: const Text("Create"),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
