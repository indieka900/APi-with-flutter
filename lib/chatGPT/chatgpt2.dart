import 'package:flutter/material.dart';
import 'package:home_app/chatGPT/addform.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Services {
  static var url = Uri.http('localhost:8000', '/advocates/');
  static Future<List<dynamic>> fetchData() async {
    final response = await http.get(url);
    if (response.statusCode == 200) {
      var data = json.decode(response.body).reversed.toList();
      return data;
    } else {
      throw Exception('Failed to load data');
    }
  }

  static Future<http.Response> createResource(Map<String, String> data) async {
    final response = await http.post(url,
        headers: {"Content-Type": "application/json"}, body: jsonEncode(data));

    if (response.statusCode == 201) {
      return response;
    } else {
      throw Exception('Failed to create resource');
    }
  }
}

void delete(String username) async {
  var url = Uri.http('localhost:8000', '/advocates/$username/');
  try {
    final response = await http.delete(url);
    print(response.statusCode);
    if (response.statusCode == 200) {
      print('Data deleted successfully');
    } else {
      throw Exception('Failed to delete $username');
    }
  } catch (e) {
    print(e);
  }
}

class MyVerticalContainer extends StatefulWidget {
  const MyVerticalContainer({super.key});

  @override
  State<MyVerticalContainer> createState() => _MyVerticalContainerState();
}

class _MyVerticalContainerState extends State<MyVerticalContainer> {
  late Future<List<dynamic>> _data;

  @override
  void initState() {
    super.initState();
    _data = Services.fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('My Json Data'),
        centerTitle: true,
        elevation: 0,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) {
                return const PersonAdd();
              },
            ),
          );
        },
        child: const Icon(
          Icons.person_add,
        ),
      ),
      body: FutureBuilder<List<dynamic>>(
        future: _data,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Container(
              margin: const EdgeInsets.only(bottom: 10),
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.only(
                      right: 10,
                      top: 12,
                      left: 10,
                      bottom: 5,
                    ),
                    width: 200,
                    decoration: BoxDecoration(
                      color: Colors.primaries[index % Colors.primaries.length],
                      borderRadius: index % 2 == 0
                          ? const BorderRadius.only(
                              bottomRight: Radius.circular(32),
                            )
                          : const BorderRadius.only(
                              topLeft: Radius.circular(32),
                            ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(
                        left: 18.0,
                        right: 10,
                        top: 8.0,
                        bottom: 5,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SelectableText(
                                  snapshot.data![index]['username'],
                                  style: const TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.w600,
                                    color: Color.fromARGB(255, 7, 50, 53),
                                  ),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    color: const Color.fromARGB(
                                        255, 250, 248, 248),
                                    borderRadius: BorderRadius.circular(32),
                                  ),
                                  child: IconButton(
                                    onPressed: () {
                                      delete(snapshot.data![index]['username']);
                                      Navigator.of(context).push(
                                        MaterialPageRoute(
                                          builder: (context) {
                                            return const MyVerticalContainer();
                                          },
                                        ),
                                      );
                                    },
                                    color: const Color.fromARGB(255, 241, 5, 5),
                                    icon: const Icon(
                                      Icons.delete_forever,
                                      size: 30,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          SelectableText(
                            snapshot.data![index]['bio'],
                            style: const TextStyle(
                              fontSize: 15,
                              fontStyle: FontStyle.italic,
                              color: Color.fromARGB(255, 25, 238, 5),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: AnimatedContainer(
                duration: const Duration(seconds: 12),
                curve: Curves.easeInOut,
                height: 125,
                padding: const EdgeInsets.only(right: 10, top: 12, left: 18),
                margin: const EdgeInsets.symmetric(horizontal: 25),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(45),
                    topRight: Radius.circular(45),
                  ),
                  color: Color.fromARGB(255, 230, 129, 92),
                ),
                child: Center(
                  child: Text(
                    "${snapshot.error}",
                    style: const TextStyle(
                      color: Color.fromARGB(255, 3, 54, 18),
                      fontSize: 22,
                    ),
                  ),
                ),
              ),
            );
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
