import 'package:assignment/bankapp/widgets/bank_card_widget.dart';
import 'package:assignment/bankapp/screens/transaction_list%20_tile.dart';
import 'package:assignment/bankapp/widgets/bank_card_sec.dart';
import 'package:assignment/bankapp/widgets/bank_card_third.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final List<Widget> _cards = [
    BankCardWidget(),
    BankCardSec(),
    BankCardThird(),
  ];
  final List<Map<String, dynamic>> transactionData = [
    {
      'name': 'Netflix subscription',
      'category': 'Entertainment',
      'isIncome': false,
      'amount': '-\$15.45',
      'imagePath': 'assets/images/netflix.png',
    },
    {
      'name': 'Spotify subscription',
      'category': 'Entertainment',
      'isIncome': false,
      'amount': '-\$25.45',
      'imagePath': 'assets/images/spotify.jpg',
    },
    {
      'name': 'Hulu subscription',
      'category': 'Entertainment',
      'isIncome': false,
      'amount': '-\$15.45',
      'imagePath': 'assets/images/hulu.jpg',
    },
    {
      'name': 'HBO Max subscription',
      'category': 'Entertainment',
      'isIncome': false,
      'amount': '-\$15.45',
      'imagePath': 'assets/images/hbomax.jpg',
    },
    {
      'name': 'Peacock subscription',
      'category': 'Entertainment',
      'isIncome': false,
      'amount': '-\$15.45',
      'imagePath': 'assets/images/Peacock TV',
    },
    {
      'name': 'Prime Video subscription',
      'category': 'Entertainment',
      'isIncome': false,
      'amount': '-\$15.45',
      'imagePath': 'assets/images/primevideo.jpg',
    },
    {
      'name': 'Disney subscription',
      'category': 'Entertainment',
      'isIncome': false,
      'amount': '-\$15.45',
      'imagePath': 'assets/images/disney.jpg',
    },
    {
      'name': 'Netflix subscription',
      'category': 'Entertainment',
      'isIncome': false,
      'amount': '-\$15.45',
      'imagePath': 'assets/images/netflix.png',
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE7E7E7),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(28.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text(
                        'Good Morning,',
                        style: TextStyle(
                          color: Colors.black87,
                          fontSize: 24,
                          letterSpacing: 0.5,
                        ),
                      ),
                      const Text(
                        'ALEX MORGAN',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 0.5,
                        ),
                      ),
                    ],
                  ),
                  CircleAvatar(
                    radius: 40,
                    backgroundImage: NetworkImage(
                      'https://images.unsplash.com/photo-1783675951657-17a0e9678b5c?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxmZWF0dXJlZC1waG90b3MtZmVlZHw4MXx8fGVufDB8fHx8fA%3D%3D',
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              SizedBox(
                height: 240,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: _cards.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.only(right: 16.0),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.85,
                        child: _cards[index],
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                    child: _circles(
                      Icons.add_circle_outline_rounded,
                      Colors.white,
                      'Top Up',
                    ),
                  ),
                  Expanded(
                    child: _circles(
                      Icons.swap_horizontal_circle_outlined,
                      Colors.white,
                      'Transfer',
                    ),
                  ),
                  Expanded(
                    child: _circles(Icons.send_rounded, Colors.white, 'Send'),
                  ),
                  Expanded(
                    child: _circles(
                      Icons.grid_view_rounded,
                      Colors.white,
                      ' More',
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: .spaceBetween,
                children: [
                  Text(
                    'Recent Transactions',
                    style: const TextStyle(
                      color: Color(0xFF1F3870), // Dark Navy
                      fontSize: 24,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  Text(
                    'See All...',
                    style: const TextStyle(
                      color: Color(0xFF1F3870), // Dark Navy
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Expanded(
                child: ListView.builder(
                  itemCount: transactionData.length,

                  itemBuilder: (context, index) {
                    final item = transactionData[index];
                    return TransactionTile(
                      name: item['name'] as String,
                      category: item['category'] as String,
                      amount: item['amount'] as String,
                      isIncome: item['isIncome'] as bool,
                      imagePath: item['imagePath'] as String,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _circles(IconData icon, Color iconColor, String label) {
  return Column(
    mainAxisSize: MainAxisSize.min, // Hugs the contents tightly
    children: [
      // The Circle Container
      Container(
        height: 68,
        width: 68,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xFF191970), Color(0xFF011F5B), Color(0xFF1A1F71)],
          ),
          shape: BoxShape.circle,
        ),
        child: Center(child: Icon(icon, color: iconColor, size: 26)),
      ),

      const SizedBox(height: 8), // Gap between the circle and text label
      // The Label Text element matching our UI theme
      Text(
        label,
        style: const TextStyle(
          color: Color(0xFF1F3870), // Dark Navy
          fontSize: 14,
          fontWeight: FontWeight.w600,
        ),
      ),
    ],
  );
}
