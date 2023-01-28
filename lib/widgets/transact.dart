import 'package:flutter/material.dart';

class Transact extends StatelessWidget {
  const Transact({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.only(top: 14.5, bottom: 10),
        margin: const EdgeInsets.symmetric(horizontal: 25),
        height: 230,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          color: Colors.white,
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              offset: Offset(2, 2.5),
              blurRadius: 7,
              spreadRadius: 0.9,
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  //mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    InkWell(
                      onTap: () {},
                      child: const CircleAvatar(
                        backgroundColor: Color.fromARGB(255, 205, 231, 176),
                        minRadius: 25,
                        child: Icon(
                          Icons.send_to_mobile,
                          color: Color.fromARGB(255, 77, 212, 59),
                          size: 25,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 2,
                    ),
                    const Text(
                      'SEND TO MOBILE',
                      style: TextStyle(fontSize: 9),
                    )
                  ],
                ),
                Column(
                  children: [
                    InkWell(
                      onTap: () {},
                      child: const CircleAvatar(
                        backgroundColor: Color.fromARGB(255, 205, 231, 176),
                        minRadius: 25,
                        child: Icon(
                          Icons.send,
                          //size: 35,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 2,
                    ),
                    const Text(
                      'BANK TRANSFER',
                      style: TextStyle(fontSize: 9),
                    )
                  ],
                ),
                Column(
                  children: [
                    InkWell(
                      onTap: () {},
                      child: const CircleAvatar(
                        backgroundColor: Color.fromARGB(255, 205, 231, 176),
                        minRadius: 25,
                        child: Icon(
                          Icons.call,
                          //size: 35,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 2,
                    ),
                    const Text(
                      'BUY AIRTIME',
                      style: TextStyle(fontSize: 9),
                    )
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 11,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  //mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    InkWell(
                      onTap: () {},
                      child: const CircleAvatar(
                        backgroundColor: Color.fromARGB(255, 205, 231, 176),
                        minRadius: 25,
                        child: Icon(
                          Icons.transform_rounded,
                          //size: 35,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 2,
                    ),
                    const Text(
                      'GLOBAL TRANSFER',
                      style: TextStyle(fontSize: 9),
                    )
                  ],
                ),
                Column(
                  children: [
                    InkWell(
                      onTap: () {},
                      child: const CircleAvatar(
                        backgroundColor: Color.fromARGB(255, 205, 231, 176),
                        minRadius: 25,
                        child: Icon(
                          Icons.attach_money,
                          //size: 35,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 2,
                    ),
                    const Text(
                      'WITHDRAW',
                      style: TextStyle(fontSize: 9),
                    )
                  ],
                ),
                Column(
                  children: [
                    InkWell(
                      onTap: () {},
                      child: const CircleAvatar(
                        backgroundColor: Color.fromARGB(255, 205, 231, 176),
                        minRadius: 25,
                        child: Icon(
                          Icons.credit_card,
                          //size: 35,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 2,
                    ),
                    const Text(
                      'LOAN CARD',
                      style: TextStyle(fontSize: 9),
                    )
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
