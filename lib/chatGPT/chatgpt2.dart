// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:home_app/chatGPT/addform.dart';
import 'package:home_app/services/services.dart';

import '../widgets/errorbox.dart';
import '../widgets/showinfo.dart';

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
        backgroundColor: const Color.fromARGB(246, 69, 190, 134),
        title: const Text(
          'My Json Data',
          style: TextStyle(
            fontSize: 27,
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.w700,
          ),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed('/create');
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
              margin: const EdgeInsets.only(bottom: 80, top: 0),
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return ShowInfo(index: index, snap: snapshot);
                },
              ),
            );
          } else if (snapshot.hasError) {
            return ErrorBox(
              message: snapshot.error.toString(),
            );
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
