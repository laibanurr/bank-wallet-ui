import 'package:flutter/material.dart';

class TransactionTile extends StatelessWidget {
  final String name;
  final String category;
  final String imagePath;
  final bool isIncome;
  final String amount;

  const TransactionTile({
    super.key,
    required this.name,
    required this.category,
    required this.amount,
    required this.isIncome,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 6.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.0),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.white, Color(0xFFF4F7FD)],
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withAlpha(8),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: ListTile(
          contentPadding: EdgeInsets.symmetric(vertical: 4.0, horizontal: 16.0),

          leading: CircleAvatar(
            backgroundColor: Colors.white,
            radius: 22,
            backgroundImage: AssetImage(imagePath),
          ),

          title: Text(name ,
          style:  TextStyle(color:Color(0xFF1F3870) ,fontWeight: FontWeight.bold),),

          subtitle: Text(category,
          style: TextStyle(color: Color(0xFF8E9BB2)),),

          trailing: Text(
            amount,
            style: TextStyle(
              color: isIncome? const Color(0xFF2E7D32) : const Color(0xFF1F3870), 
              fontWeight: FontWeight.bold, 
              fontSize: 16,
            ),
          ),
      ),
      ),
    );
  }
}
