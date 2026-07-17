import 'package:assignment/bankapp/receipt_dialog.dart';
import 'package:assignment/bankapp/widgets/bank_card_widget.dart';
import 'package:assignment/bankapp/widgets/date_time_picker_dialog.dart';
import 'package:flutter/material.dart';

class CheckOutScreen extends StatefulWidget {
  const CheckOutScreen({super.key});

  @override
  State<CheckOutScreen> createState() => _CheckOutScreenState();
}

class _CheckOutScreenState extends State<CheckOutScreen> {
  final List<String> screens = ['home', 'wallet', 'transition', 'profile'];
  final TextEditingController _cardNumber = TextEditingController();
  final TextEditingController _holderName = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _timeController = TextEditingController();
  int _currentIndex = 0;

  // 📝 Required text bindings safely restored for your display boxes
  final String _preSetCardNumber = "4321  8899  0011  6767";
  final String _preSetHolderName = "ALEX MORGAN";

  @override
  void dispose() {
    _holderName.dispose();
    _dateController.dispose();
    _timeController.dispose();
    _cardNumber.dispose();
    super.dispose();
  }
    @override
    Widget build(BuildContext context) {
      const Color inputFieldColor = Color(0xFFF4F7FD);

      return Scaffold(
        appBar: AppBar(
          foregroundColor: Colors.white,
          elevation: 6,
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              // gradient: LinearGradient(
              //   colors: [
              //     Color(0xFF0E43B3), // Premium Top Blue
              //     Color(0xFF5C86E1), // Smooth Mid Tone
              //     Color(0xFFFFFFFF),
              //   ],
              // ),

              //2nd
//                 gradient: LinearGradient(colors: [
//   Color(0xFF0A1931), // Dark Steel Base
//    Color(0xFF1E3163), // Royal Slate
//    Color(0xFF492F75), // Deep Amethyst Sunset
// ]
// )

//3rd
 gradient: LinearGradient(colors: [
   Color(0xFF011F5B), // Core Theme Navy
  Color(0xFF6F8CC7), // Soft Muted Blue
  Color(0xFFE9EDF7), // Crisp Ice White
]
),
             


// gradient: LinearGradient(colors: [
//   Color(0xFF0A1931), // Dark Steel Base
//   Color(0xFF1E3163), // Royal Slate
//   Color(0xFF492F75), // Deep Amethyst Sunset
// ]
// ),
            ),
            height: 190,
          ),
          leading: const Icon(Icons.arrow_back_ios),
          title: const Text(
            'Add a card',
            style: TextStyle(
              fontFamily: 'Satoshi', // Fixed font fallback identifier
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),

        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: SizedBox(
                height: 240,
                width: double.infinity,
                child: const BankCardWidget(),
              ),
            ),
            sectionLabel('CARD NUMBER'),
            _fixedField(
              _preSetCardNumber,
              Icons.credit_card_rounded,
              inputFieldColor,
            ),

            SizedBox(height: 16),
            sectionLabel(' CARD HOLDER NAME '),
            _fixedField(
              _preSetHolderName,
              Icons.person_outline_rounded,
              inputFieldColor,
            ),
            SizedBox(height: 16),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: .start,
                      children: [
                        sectionLabel('SCHEDULED DATE'),
                        GestureDetector(
                          onTap: () async {
                            String? result =
                                await DialoguePractHelpers.androidDatePicker(
                                  context,
                                );
                            if (result != null) {
                              setState(() {
                                _dateController.text = result;
                              });
                            }
                          },
                          child: _pickerContainer(
                            _dateController.text.isEmpty
                                ? 'YYYY-MM-DD'
                                : _dateController.text,
                            Icons.calendar_today_rounded,
                            _dateController.text.isEmpty,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 16.0),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: .start,
                      children: [
                        sectionLabel('SCHEDULED TIME'),
                        GestureDetector(
                          onTap: () async {
                            String? result =
                                await DialoguePractHelpers.androidTimePicker(
                                  context,
                                );

                            setState(() {
                              if (result != null) {
                                _timeController.text = result;
                              }
                            });
                          },
                          child: _pickerContainer(
                            _timeController.text.isEmpty
                                ? 'HH:MM'
                                : _timeController.text,
                            Icons.access_time_rounded,
                            _timeController.text.isEmpty,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 32),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    
                    // backgroundColor: const Color(0xFF0E43B3),
                    backgroundColor: Color(0xFF011F5B),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),

                  onPressed: () {
                    PaymentReceiptDialog.show(
                      context: context,
                      cardNumber: _preSetCardNumber,
                      holderName: _preSetHolderName,
                      date: _dateController.text.isEmpty
                          ? 'NOT SELECTED'
                          : _dateController.text,
                      time: _timeController.text.isEmpty
                          ? 'NOT SELECTED'
                          : _timeController.text,
                    );
                  },
                  child: Text(
                    'Schedule Payment',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        // selectedItemColor: const Color(0xFF0E43B3),
        selectedItemColor: Color(0xFF011F5B),
        unselectedItemColor: const Color(0xFF333E4F),
        elevation: 6,
        selectedLabelStyle: const TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: 11,
        ),
        currentIndex: _currentIndex,
        onTap: (value) {
          setState(() {
            _currentIndex = value;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_rounded),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.credit_card_rounded),
            label: 'Wallet',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.receipt_long_outlined),
            label: 'Activity',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_rounded),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
      

  Widget sectionLabel(String text) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8.0, left: 16.0),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          text,
          style: TextStyle(
            color: Color(0xFF1F3870),
            fontWeight: FontWeight.w700,
            fontSize: 12,
            letterSpacing: 0.5,
          ),
        ),
      ),
    );
  }

  Widget _fixedField(String text, IconData icon, Color fillColor) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        width: double.infinity,
        height: 60,
        decoration: BoxDecoration(
          color: Color(0xFFE9EDF7).withAlpha(163),
          borderRadius: BorderRadius.circular(14.0),
        ),
        child: Row(
          children: [
            Icon(icon, color: const Color(0xFF1F3870).withAlpha(100), size: 22),
            SizedBox(width: 12),
            Text(
              text,
              style: TextStyle(
                color: Color(0xFF1F3870),
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _pickerContainer(String text, IconData icon, bool isHint) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      height: 56,
      decoration: BoxDecoration(
        color: Color(0xFFF4F7FD),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: isHint ? Colors.transparent : const Color(0xFF0E43B3),
          width: 1.5,
        ),
      ),
      child: Row(
        children: [
          Icon(icon, color: const Color(0xFF1F3870), size: 22),
          const SizedBox(width: 12),
          Text(
            text,
            style: TextStyle(
              color: isHint ? const Color(0xFF8E9BB2) : const Color(0xFF1F3870),
              fontSize: 14,
              fontWeight: isHint ? FontWeight.normal : FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
  

