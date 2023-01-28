import 'package:flutter/material.dart';

class Vooma extends StatelessWidget {
  const Vooma({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        InkWell(
          onTap: () {},
          child: Container(
            height: 90,
            width: 85,
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              color: Colors.white,
              boxShadow: const [
                BoxShadow(
                  color: Colors.black12,
                  offset: Offset(2, 2.5),
                  blurRadius: 8,
                  spreadRadius: 0.9,
                ),
              ],
            ),
            child: Column(
              children: const [
                CircleAvatar(
                  backgroundColor: Color.fromARGB(248, 158, 3, 3),
                  //minRadius: 30,
                  child: Icon(Icons.payment
                      //size: 35,
                      ),
                ),
                SizedBox(
                  height: 2,
                ),
                Text(
                  'PAY BILL',
                  style: TextStyle(fontSize: 9),
                )
              ],
            ),
          ),
        ),
        InkWell(
          onTap: () {},
          child: Container(
            height: 90,
            width: 85,
            padding: const EdgeInsets.all(10),
            //margin: const EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              color: Colors.white,
              boxShadow: const [
                BoxShadow(
                  color: Colors.black12,
                  offset: Offset(2, 2.5),
                  blurRadius: 8,
                  spreadRadius: 0.9,
                ),
              ],
            ),
            child: Column(
              children: const [
                CircleAvatar(
                  backgroundColor: Color.fromARGB(248, 158, 3, 3),
                  //minRadius: 30,
                  child: Icon(
                    Icons.money,
                    //size: 35,
                  ),
                ),
                SizedBox(
                  height: 2,
                ),
                Text(
                  'BUY GOODS',
                  style: TextStyle(fontSize: 9),
                )
              ],
            ),
          ),
        ),
        InkWell(
          onTap: () {},
          child: Container(
            height: 90,
            width: 85,
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              color: Colors.white,
              boxShadow: const [
                BoxShadow(
                  color: Colors.black12,
                  offset: Offset(2, 2.5),
                  blurRadius: 8,
                  spreadRadius: 0.9,
                ),
              ],
            ),
            child: Column(
              children: const [
                CircleAvatar(
                  backgroundColor: Color.fromARGB(248, 158, 3, 3),
                  //minRadius: 30,
                  child: Icon(
                    Icons.school,
                    //size: 35,
                  ),
                ),
                SizedBox(
                  height: 2,
                ),
                Text(
                  'LIPA KARO',
                  style: TextStyle(fontSize: 9),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
