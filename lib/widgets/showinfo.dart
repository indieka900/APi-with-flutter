import 'package:flutter/material.dart';
import 'package:home_app/services/services.dart';

import '../chatGPT/chatgpt2.dart';

class ShowInfo extends StatelessWidget {
  const ShowInfo({
    Key? key,
    required this.index,
    required this.snap,
  }) : super(key: key);

  final int index;
  // ignore: prefer_typing_uninitialized_variables
  final snap;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(seconds: 1),
      curve: Curves.easeInOut,
      margin: const EdgeInsets.only(
        right: 10,
        top: 12,
        left: 10,
        bottom: 5,
      ),
      width: 200,
      decoration: BoxDecoration(
        //color: Colors.primaries[index % Colors.primaries.length],
        color: const Color.fromARGB(246, 8, 116, 66),
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
                    snap.data![index]['username'],
                    style: const TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w600,
                      color: Color.fromARGB(255, 7, 50, 53),
                    ),
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12.0,
                        ),
                        child: PhysicalModel(
                          color: const Color.fromARGB(255, 188, 217, 240),
                          shape: BoxShape.circle,
                          shadowColor: Colors.black,
                          elevation: 12,
                          child: IconButton(
                            onPressed: () {
                              delete(snap.data![index]['username']);
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
                              size: 20,
                            ),
                          ),
                        ),
                      ),
                      PhysicalModel(
                        color: const Color.fromARGB(255, 188, 217, 240),
                        shape: BoxShape.circle,
                        shadowColor: Colors.black,
                        elevation: 12,
                        child: IconButton(
                          onPressed: () {},
                          color: Colors.green[600],
                          icon: const Icon(
                            Icons.edit,
                            size: 20,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            SelectableText(
              snap.data![index]['bio'],
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
  }
}