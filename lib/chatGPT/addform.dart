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
  Map<String, dynamic>? _selectedCompany;

  final formKey = GlobalKey<FormState>();

  final _namecontroller = TextEditingController();

  final _biocontroller = TextEditingController();

  // void _handleItemSelected(String value) {
  //   setState(() {
  //     _selectedValue = value;
  //   });
  // }

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
              height: 15,
            ),
            Row(
              children: [
                const Text('Company:'),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: DropdownButtonExample(
                    onItemSelected: (company) {
                      setState(() {
                        _selectedCompany = company;
                      });
                    },
                  ),
                ),
              ],
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
                      "company": {
                        "id": _selectedCompany?['id'].toString(),
                        "employee_count": _selectedCompany?['employee_count'],
                        "name": _selectedCompany?['name'],
                        "bio": _selectedCompany?['bio']
                      }
                    };
                    Uri uri = Uri.http(
                      '127.0.0.1:8000',
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
                                Navigator.of(context)
                                    .pushReplacementNamed('/api');
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

class DropdownButtonExample extends StatefulWidget {
  final Function(Map<String, dynamic>?) onItemSelected;
  const DropdownButtonExample({Key? key, required this.onItemSelected});

  @override
  State<DropdownButtonExample> createState() => _DropdownButtonExampleState();
}

class _DropdownButtonExampleState extends State<DropdownButtonExample> {
  late Future<List<dynamic>> data;
  String dropdownValue = '';
  List<dynamic> _companies = [];
  Map<String, dynamic>? _selectedCompany;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    List<dynamic> companies = await Services.fetchCompanies();
    setState(() {
      _companies = companies;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      value: _selectedCompany,
      items: _companies.map((company) {
        return DropdownMenuItem(
          value: company,
          child: Text(company['name']),
        );
      }).toList(),
      onChanged: (value) {
        setState(() {
          _selectedCompany = value as Map<String, dynamic>?;
          widget.onItemSelected(_selectedCompany);
        });
      },
    );
  }
}
