import 'package:flutter/material.dart';
import 'package:home_app/chatGPT/addform.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Services {
  static var url = Uri.http('localhost:8000', '/advocates/');
  static Future<List<dynamic>> fetchData() async {
    final response = await http.get(url);
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      return data;
    } else {
      throw Exception('Failed to load data');
    }
  }

  static Future<http.Response> createResource(Map<String, String> data) async {
    final response = await http
        .post(url,
            headers: {"Content-Type": "application/json"},
            body: jsonEncode(data))
        .then((value) {});

    if (response.statusCode == 201) {
      return response;
    } else {
      throw Exception('Failed to create resource');
    }
  }
}

// class MyHorizontalContainer extends StatelessWidget {
//   const MyHorizontalContainer({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SingleChildScrollView(
//         scrollDirection: Axis.horizontal,
//         child: Container(
//           width: 1000,
//           height: 200,
//           color: Colors.blue,
//           child: Row(
//             children: [
//               Container(
//                 width: 200,
//                 height: 200,
//                 color: Colors.red,
//               ),
//               Container(
//                 width: 200,
//                 height: 200,
//                 color: Colors.green,
//               ),
//               Container(
//                 width: 200,
//                 height: 200,
//                 color: Colors.yellow,
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

class MyHorizontalContainer extends StatefulWidget {
  const MyHorizontalContainer({super.key});

  @override
  State<MyHorizontalContainer> createState() => _MyHorizontalContainerState();
}

class _MyHorizontalContainerState extends State<MyHorizontalContainer> {
  late Future<List<dynamic>> _data;

  @override
  void initState() {
    super.initState();
    _data = Services.fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            return SizedBox(
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.only(right: 10, top: 12, left: 10),
                    width: 200,
                    //height: 100,
                    decoration: BoxDecoration(
                      color: Colors.primaries[index % Colors.primaries.length],
                      borderRadius: index % 2 == 0
                          ? const BorderRadius.horizontal(
                              right: Radius.circular(20),
                            )
                          : const BorderRadius.horizontal(
                              left: Radius.circular(20),
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
                            child: Text(
                              snapshot.data![index]['username'],
                              style: const TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.w600,
                                color: Color.fromARGB(255, 7, 50, 53),
                              ),
                            ),
                          ),
                          Text(
                            snapshot.data![index]['company']['name'],
                            style: const TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w600,
                              //fontStyle: FontStyle.italic,
                              color: Color.fromARGB(255, 71, 238, 5),
                            ),
                          ),
                          Text(
                            snapshot.data![index]['bio'],
                            style: const TextStyle(
                              fontSize: 15,
                              //fontWeight: FontWeight.w600,
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
            return Text("${snapshot.error}");
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
