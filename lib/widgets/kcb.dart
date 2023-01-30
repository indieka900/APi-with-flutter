import 'package:flutter/material.dart';
import 'package:home_app/widgets/deals.dart';
import 'package:home_app/widgets/transact.dart';
import 'package:home_app/widgets/vooma.dart';

class Kcbdraft extends StatefulWidget {
  const Kcbdraft({super.key});

  @override
  State<Kcbdraft> createState() => _KcbdraftState();
}

class _KcbdraftState extends State<Kcbdraft> {
  final String name = "Joseph o";
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 247, 244, 246),
      drawer: const Drawer(),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color.fromARGB(255, 145, 209, 72),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: 230,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: <Color>[
                        Color.fromARGB(255, 145, 209, 72),
                        Color.fromARGB(255, 74, 133, 7),
                        Color.fromARGB(255, 61, 95, 95),
                        //Color.fromARGB(255, 70, 52, 87),
                        Color.fromARGB(255, 4, 58, 58),
                      ],
                    ),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(70),
                      bottomRight: Radius.circular(70),
                    ),
                    //color: Color.fromARGB(255, 97, 187, 37),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(left: 10),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Good morning,',
                          style: TextStyle(
                            color: Color.fromARGB(255, 22, 240, 14),
                          ),
                        ),
                        Text(
                          "${name.toUpperCase()}.",
                          style: const TextStyle(
                            color: Color.fromARGB(255, 252, 251, 251),
                            //fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const Transact(),
                        const SizedBox(height: 30),
                        const Text("VOOMA PAY"),
                        const SizedBox(height: 30),
                        const Vooma(),
                        const SizedBox(height: 30),
                        const Text("DEALS"),
                        const Deals()
                      ],
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0,
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        iconSize: 28,
        unselectedFontSize: 10,
        //backgroundColor: const Color.fromARGB(255, 53, 211, 145),
        items: [
          BottomNavigationBarItem(
            backgroundColor: Colors.green,
            icon: InkWell(
              onTap: () {},
              child: const Icon(Icons.home),
            ),
            label: "HOME",
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.greenAccent,
            icon: InkWell(
              onTap: () {},
              child: const Icon(Icons.savings),
            ),
            label: 'SAVINGS',
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.lightGreen,
            icon: InkWell(
              onTap: () {
                Navigator.pushNamed(context, '/api');
              },
              child: const Icon(Icons.clean_hands),
            ),
            label: 'LOANS',
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.lightGreen,
            icon: InkWell(
              onTap: () {
                Navigator.pushNamed(context, '/whatsApp');
              },
              child: const Icon(Icons.wallet_giftcard),
            ),
            label: 'ACCOUNT',
          ),
        ],
        onTap: (value) {
          setState(() {
            _currentIndex = value;
          });
        },
      ),
    );
  }
}

