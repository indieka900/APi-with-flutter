// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:home_app/services/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../widgets/errorbox.dart';
import '../widgets/showinfo.dart';

class MyVerticalContainer extends StatefulWidget {
  const MyVerticalContainer({super.key});

  @override
  State<MyVerticalContainer> createState() => _MyVerticalContainerState();
}

class _MyVerticalContainerState extends State<MyVerticalContainer> {
  late Future<List<dynamic>> _data;
  late Future<List<dynamic>> data;

  @override
  void initState() {
    super.initState();
    _data = Services.fetchData();
    data = Services.fetchCompanies();
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
            return Animate(
              child: Container(
                margin: const EdgeInsets.only(bottom: 80, top: 0),
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    return ShowInfo(index: index, snap: snapshot)
                        .animate()
                        .fade(duration: const Duration(milliseconds: 1400))
                        .slideY(
                            begin: -5,
                            duration: const Duration(milliseconds: 1300))
                        .then()
                        .shakeY(duration: const Duration(milliseconds: 350))
                        .then();
                  },
                ),
              ),
            ).fadeIn();
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
