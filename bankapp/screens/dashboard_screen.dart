// import 'package:assignment/bankapp/screens/bank_card_widget.dart';
// import 'package:assignment/bankapp/screens/transaction_list%20_tile.dart';
// import 'package:assignment/bankapp/widgets/bank_card_sec.dart';
// import 'package:assignment/bankapp/widgets/bank_card_third.dart';
// import 'package:flutter/material.dart';
import 'package:assignment/bankapp/widgets/bank_card_fifth.dart';
import 'package:assignment/bankapp/widgets/bank_card_fourth.dart';
import 'package:flutter/material.dart';
import 'package:assignment/bankapp/widgets/bank_card_widget.dart';
import 'package:assignment/bankapp/screens/transaction_list _tile.dart'; // 💡 Fixed your exact spacing name!
import 'package:assignment/bankapp/widgets/bank_card_sec.dart';          // 💡 Fixed directory to widgets folder!
import 'package:assignment/bankapp/widgets/bank_card_third.dart';        // 💡 Fixed directory to widgets folder!


class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final List<Widget> _cards = [
    const BankCardWidget(),
    const BankCardSec(),
    const BankCardThird(),
    const BankCardFourth(),
    const BankCardFifth(),
  ];


    final List<Map<String, dynamic>> transactionData = [
    {
      'name': 'Netflix subscription',
      'category': 'Entertainment',
      'isIncome': false,
      'amount': '-\$15.45',
      'imagePath': 'assets/images/netflix.png', // 🔧 MATCHED: Explicitly .png on disk
    },
    {
      'name': 'Spotify subscription',
      'category': 'Entertainment',
      'isIncome': false,
      'amount': '-\$25.45',
      'imagePath': 'assets/images/spotify.png', // 🔧 MATCHED: Explicitly .png on disk
    },
    {
      'name': 'Hulu subscription',
      'category': 'Entertainment',
      'isIncome': false,
      'amount': '-\$15.45',
      'imagePath': 'assets/images/hulu.jpg', // 🔧 MATCHED: Explicitly .jpg on disk
    },
    {
      'name': 'HBO Max subscription',
      'category': 'Entertainment',
      'isIncome': false,
      'amount': '-\$15.45',
      'imagePath': 'assets/images/hbomax.jpg', // 🔧 MATCHED: Explicitly .jpg on disk
    },
    {
      'name': 'Peacock subscription',
      'category': 'Entertainment',
      'isIncome': false,
      'amount': '-\$15.45',
      'imagePath': 'assets/images/Peacock TV.jpg', // 🔧 MATCHED: Capitalization & .jpg match
    },
    {
      'name': 'Prime Video subscription',
      'category': 'Entertainment',
      'isIncome': false,
      'amount': '-\$15.45',
      'imagePath': 'assets/images/primevideo.jpg', // 🔧 MATCHED: Explicitly .jpg on disk
    },
    {
      'name': 'Disney subscription',
      'category': 'Entertainment',
      'isIncome': false,
      'amount': '-\$15.45',
      'imagePath': 'assets/images/disney.jpg', // 🔧 MATCHED: Explicitly .jpg on disk
    },
    {
      'name': 'Augusta Golf Club',
      'category': 'Sports & Leisure',
      'isIncome': false,
      'amount': '-\$245.00',
      'imagePath': 'assets/images/golfclub.jpeg', // 🔧 MATCHED: Explicitly .jpeg on disk
    },
    {
      'name': 'Nobu Fine Dining',
      'category': 'Restaurant & Food',
      'isIncome': false,
      'amount': '-\$185.50',
      'imagePath': 'assets/images/nobu.jpeg', // 🔧 MATCHED: Explicitly .jpeg on disk
    },
    {
      'name': 'Starbucks Coffee',
      'category': 'Food & Drinks',
      'isIncome': false,
      'amount': '-\$6.80',
      'imagePath': 'assets/images/starbucks.jpeg', // 🔧 MATCHED: Explicitly .jpeg on disk
    },
    {
      'name': 'Uber Ride Cashless',
      'category': 'Transport',
      'isIncome': false,
      'amount': '-\$24.50',
      'imagePath': 'assets/images/uber.jpeg', // 🔧 MATCHED: Explicitly .jpeg on disk
    },
    {
      'name': 'Gym Membership',
      'category': 'Health & Fitness',
      'isIncome': false,
      'amount': '-\$45.00',
      'imagePath': 'assets/images/gym.jpeg', // 🔧 MATCHED: Explicitly .jpeg on disk
    },
    {
      'name': 'Amazon Marketplace',
      'category': 'Online Shopping',
      'isIncome': false,
      'amount': '-\$112.40',
      'imagePath': 'assets/images/amazon.jpeg', // 🔧 MATCHED: Explicitly .jpeg on disk
    },
    {
      'name': 'Airbnb Cashback',
      'category': 'Travel Refund',
      'isIncome': true,
      'amount': '+\$85.20',
      'imagePath': 'assets/images/airbnb.jpeg', // 🔧 MATCHED: Explicitly .jpeg on disk
    },
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, 
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () {}, 
          icon: const Icon(Icons.menu_rounded, color: Color(0xFF1F3870), size: 26),
        ),
        title: const Text(
          'My Wallet', 
          style: TextStyle(
            color: Color(0xFF1F3870),
            fontWeight: FontWeight.w800,
            fontSize: 22,
          ),
        ),
        centerTitle: false,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search_rounded, color: Color(0xFF1F3870), size: 24),
          ),
          IconButton(
            onPressed: () {}, 
            icon: const Icon(Icons.notifications_none_rounded, color: Color(0xFF1F3870), size: 24),
          ),
          const SizedBox(width: 8),
        ],
      ),
      // 🔧 FIX 1: Root container wrapped around SafeArea for dynamic size parsing
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start, 
              children: [
                // Horizontal Card Slider Layer
                SizedBox(
                  height: 240,
                  width: double.infinity, 
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: _cards.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 16.0),
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width * 0.85,
                          child: _cards[index],
                        ),
                      );
                    },
                  ),
                ),
                
                const SizedBox(height: 24),
                
                // Quick Actions Control Center Bar Layout
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround, 
                  children: [
                    _circles(Icons.add_circle_outline_rounded, Colors.white, 'Top Up'),
                    _circles(Icons.swap_horizontal_circle_outlined, Colors.white, 'Transfer'),
                    _circles(Icons.send_rounded, Colors.white, 'Send'),
                    _circles(Icons.grid_view_rounded, Colors.white, 'More'),
                  ],
                ),
                
                const SizedBox(height: 32),
                
                // Dynamic History Ledger Heading Panel Row
                // 🔧 FIX 2: Removed 'const' keyword signature directly from children declaration below
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween, 
                  children: const [
                    Text(
                      'Recent Transactions',
                      style: TextStyle(
                        color: Color(0xFF1F3870), 
                        fontSize: 22,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    Text(
                      'See All',
                      style: TextStyle(
                        color: Color(0xFF0E43B3), 
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                
                const SizedBox(height: 12),
                
                ListView.builder(
                  shrinkWrap: true, 
                  physics: const NeverScrollableScrollPhysics(), 
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// Reusable Circular Icon Quick Button Layout Generator Helper Blueprint Node 
Widget _circles(IconData icon, Color iconColor, String label) {
  return Column(
    mainAxisSize: MainAxisSize.min, 
    children: [
      Container(
        height: 66,
        width: 66,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xFF191970), Color(0xFF011F5B), Color(0xFF1A1F71)],
          ),
          shape: BoxShape.circle,
        ),
        child: Center(child: Icon(icon, color: iconColor, size: 24)),
      ),
      const SizedBox(height: 8), 
      Text(
        label,
        style: const TextStyle(
          color: Color(0xFF1F3870), 
          fontSize: 12,
          fontWeight: FontWeight.w600,
        ),
      ),
    ],
  );
}
