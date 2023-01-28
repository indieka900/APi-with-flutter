import 'package:flutter/material.dart';

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
                  height: 200,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: <Color>[
                        Color.fromARGB(255, 145, 209, 72),
                        Color.fromARGB(255, 74, 133, 7),
                        Color.fromARGB(255, 70, 52, 87),
                        Color.fromARGB(255, 45, 1, 70),
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

class Deals extends StatelessWidget {
  const Deals({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 170,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
            height: 100,
            width: 300,
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 27, 78, 37),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
            height: 150,
            width: 300,
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 143, 153, 145),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
            height: 100,
            width: 300,
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 143, 153, 145),
            ),
          ),
        ],
      ),
    );
  }
}

class Transact extends StatelessWidget {
  const Transact({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.only(top: 14.5, bottom: 10),
        width: 300,
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
          crossAxisAlignment: CrossAxisAlignment.start,
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
                        backgroundColor: Colors.lightGreen,
                        //minRadius: 30,
                        child: Icon(
                          Icons.person,
                          //size: 35,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 2,
                    ),
                    const Text(
                      'Money',
                      style: TextStyle(fontSize: 12),
                    )
                  ],
                ),
                Column(
                  children: [
                    InkWell(
                      onTap: () {},
                      child: const CircleAvatar(
                        backgroundColor: Colors.lightGreen,
                        //minRadius: 30,
                        child: Icon(
                          Icons.person,
                          //size: 35,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 2,
                    ),
                    const Text(
                      'Money',
                      style: TextStyle(fontSize: 12),
                    )
                  ],
                ),
                Column(
                  children: [
                    InkWell(
                      onTap: () {},
                      child: const CircleAvatar(
                        backgroundColor: Colors.lightGreen,
                        //minRadius: 30,
                        child: Icon(
                          Icons.person,
                          //size: 35,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 2,
                    ),
                    const Text(
                      'Money',
                      style: TextStyle(fontSize: 12),
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
                        backgroundColor: Colors.lightGreen,
                        //minRadius: 30,
                        child: Icon(
                          Icons.person,
                          //size: 35,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 2,
                    ),
                    const Text(
                      'Money',
                      style: TextStyle(fontSize: 12),
                    )
                  ],
                ),
                Column(
                  children: [
                    InkWell(
                      onTap: () {},
                      child: const CircleAvatar(
                        backgroundColor: Colors.lightGreen,
                        //minRadius: 30,
                        child: Icon(
                          Icons.person,
                          //size: 35,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 2,
                    ),
                    const Text(
                      'Money',
                      style: TextStyle(fontSize: 12),
                    )
                  ],
                ),
                Column(
                  children: [
                    InkWell(
                      onTap: () {},
                      child: const CircleAvatar(
                        backgroundColor: Colors.lightGreen,
                        //minRadius: 30,
                        child: Icon(
                          Icons.person,
                          //size: 35,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 2,
                    ),
                    const Text(
                      'Money',
                      style: TextStyle(fontSize: 12),
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
