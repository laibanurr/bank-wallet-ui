import 'package:flutter/material.dart';
class BankCardFifth extends StatelessWidget {
  const BankCardFifth({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24.0),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF0E43B3).withAlpha(76),
            blurRadius: 24,
            offset: const Offset(0, 12),
          ),
        ],
  gradient: LinearGradient(colors: [
  Color(0xFF62948C), 
  Color(0xFF1C5249), 
  Color(0xFF092924), 
]
)
      ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 32.0, horizontal: 28.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'MIBANK',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w900,
                  fontSize: 20,
                  letterSpacing: 1.2,
                ),
              ),
              const SizedBox(height: 22),
              const Text(
                'CARD NUMBER',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: 18,
                  letterSpacing: 1.1,
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                '••••  ••••  ••••  6767',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  letterSpacing: 3.5,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: .end,
                children: [
                  Expanded(child: Column(
                    mainAxisAlignment: .start,
                     children: [
                        Text(
                          'CARD HOLDER',
                          style: TextStyle(color: Colors.white70, fontSize: 9, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 4),
                        Text(
                          'ALEX MORGAN',
                          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 14),
                  )]),
              ),
              const Expanded(child: Column(
                mainAxisAlignment: .start,
                children: [
                Text(
                   'EXPIRES',
                          style: TextStyle(color: Colors.white70, fontSize: 9, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 4),
                        Text(
                          '12/28',
                          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 14),
                        ),
                      ],
                    ),
                  ),
                ],
              )
            ],
                ),
              ),
              );
  }
}
