import 'package:flutter/material.dart';

class Deals extends StatelessWidget {
  const Deals({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 190,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          Stack(
            children: [
              Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                height: 178,
                width: 290,
                decoration: BoxDecoration(
                  //color: const Color.fromARGB(255, 27, 78, 37),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.asset(
                    'assets/449907.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const Positioned(
                top: 23,
                left: 20,
                child: Text(
                  'KCB LOGO',
                  style: TextStyle(
                    backgroundColor: Colors.greenAccent,
                  ),
                ),
              ),
              const Positioned(
                top: 120,
                left: 35,
                child: Text(
                  'Buy airtime in across ANY network',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                  ),
                ),
              )
            ],
          ),
          Stack(
            children: [
              Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                height: 178,
                width: 290,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.asset(
                    'assets/454132.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const Positioned(
                top: 23,
                left: 20,
                child: Text(
                  'KCB LOGO',
                  style: TextStyle(
                    backgroundColor: Colors.greenAccent,
                  ),
                ),
              ),
              const Positioned(
                top: 120,
                left: 35,
                child: Text(
                  'Send and recieve money using Western Union',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
              )
            ],
          ),
          Stack(
            children: [
              Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                height: 178,
                width: 290,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.asset(
                    'assets/001.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const Positioned(
                top: 23,
                left: 20,
                child: Text(
                  'KCB LOGO',
                  style: TextStyle(
                    backgroundColor: Colors.greenAccent,
                  ),
                ),
              ),
              const Positioned(
                top: 120,
                left: 35,
                child: Text(
                  'Pay for utility billls conviniently',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
              )
            ],
          ),
          Stack(
            children: [
              Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                height: 178,
                width: 290,
                decoration: BoxDecoration(
                  //
                  borderRadius: BorderRadius.circular(16),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.asset(
                    'assets/flower.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const Positioned(
                top: 23,
                left: 20,
                child: Text(
                  'KCB LOGO',
                  style: TextStyle(
                    backgroundColor: Colors.greenAccent,
                  ),
                ),
              ),
              const Positioned(
                top: 120,
                left: 35,
                child: Text(
                  'Transfers at your fingertips',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
              )
            ],
          ),
          Stack(
            children: [
              Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                height: 178,
                width: 290,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.asset(
                    'assets/download10.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const Positioned(
                top: 23,
                left: 20,
                child: Text(
                  'KCB LOGO',
                  style: TextStyle(
                    backgroundColor: Colors.greenAccent,
                  ),
                ),
              ),
              const Positioned(
                top: 120,
                left: 35,
                child: Text(
                  'Redeem points for cash & airtime',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
