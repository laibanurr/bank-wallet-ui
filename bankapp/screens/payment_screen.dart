import 'package:assignment/bankapp/receipt_dialog.dart';
import 'package:assignment/bankapp/widgets/bank_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:assignment/bankapp/widgets/date_time_picker_dialog.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
 

  
     
  final List<String> screens = ['home', 'wallet', 'transition', 'profile'];
  final TextEditingController _cardNumber = TextEditingController();
  final TextEditingController _holderName = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _timeController = TextEditingController();
  int _currentIndex=0;

  // 📝 Required text bindings safely restored for your display boxes
  final String _preSetCardNumber = "4321  8899  0011  6767";
  final String _preSetHolderName = "ALEX MORGAN";

  @override void dispose(){
    _holderName.dispose();
    _dateController.dispose();
    _timeController.dispose();
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
            gradient: LinearGradient(
              colors: [
                Color(0xFF0E43B3), // Premium Top Blue
                Color(0xFF5C86E1), // Smooth Mid Tone
                Color(0xFFFFFFFF),
              ],
            ),
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

      body: SingleChildScrollView( // Added to ensure layout components don't vertical clip
        child: Column(
    
          children: [
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: SizedBox(
                height: 240,
                width: double.infinity,
                child: const BankCardWidget(),
              ),
            ),
            _buildSectionLabel('CARD NUMBER'),
            _buildDisplayBox(
              _preSetCardNumber,
              Icons.credit_card_rounded,
              inputFieldColor,
            ),
            const SizedBox(height: 16),
            _buildSectionLabel('CARD HOLDER NAME'),
            _buildDisplayBox(
              _preSetHolderName,
              Icons.person_outline_rounded,
              inputFieldColor,
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildSectionLabel('SCHEDULED DATE'),
                        GestureDetector(
                          onTap: () async {
                          
                            String? result = await DialoguePractHelpers.androidDatePicker(context);
                            if (result != null) {
                              setState(() {
                                _dateController.text = result;
                              });
                            }
                          },
                          child: _buildPickerContainer(
                            _dateController.text.isEmpty ? 'YYYY-MM-DD' : _dateController.text,
                            Icons.calendar_today_rounded,
                            _dateController.text.isEmpty,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildSectionLabel('SCHEDULED TIME'),
                        GestureDetector(
                          onTap: () async {
                            String? result = await DialoguePractHelpers.androidTimePicker(context);
                            if (result != null) {
                              setState(() {
                                _timeController.text = result;
                              });
                            }
                          },
                          child: _buildPickerContainer(
                            _timeController.text.isEmpty ? 'HH:MM' : _timeController.text,
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
            const SizedBox(height: 32),
            // Primary Confirm Payment trigger template
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF0E43B3),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                  ),
                  
                    onPressed: () {
  PaymentReceiptDialog.show(
    context: context,
    cardNumber: _preSetCardNumber,
    holderName: _preSetHolderName,
    date: _dateController.text.isEmpty ? 'Not Selected' : _dateController.text,
    time: _timeController.text.isEmpty ? 'Not Selected' : _timeController.text,
  );
},

                    // Triggers your confirmation module flow cleanly here
                  
                  child: const Text('Schedule Payment', style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
                ),
              ),
            ),
          ],
        ),
    ),

      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        selectedItemColor: const Color(0xFF0E43B3),
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

// ==========================================
// 🛠️ HELPER METRICS METHODS
// ==========================================

Widget _buildSectionLabel(String text) => Padding(
      padding: const EdgeInsets.only(bottom: 8.0, left: 16.0),
     child: Align(
      alignment: Alignment.centerLeft,
        child: Text(
          text,
        style: const TextStyle(
          color: Color(0xFF1F3870),
          fontWeight: FontWeight.w700,
          fontSize: 12,
          letterSpacing: 0.5,
        ),
     )),
    );

Widget _buildDisplayBox(String text, IconData icon, Color fill) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16.0),
    child: Container(
      width: double.infinity,
      height: 60,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        // color: fill.withAlpha(150),
        color: Color(0xFFE9EDF7).withAlpha(153),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        children: [
          Icon(icon, color: const Color(0xFF1F3870).withAlpha(150), size: 22),
          const SizedBox(width: 12),
          Text(
            text,
            style: const TextStyle(
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

Widget _buildPickerContainer(String text, IconData icon, bool isPlaceholder) =>
    Container(
      height: 56,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: const Color(0xFFF4F7FD),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: isPlaceholder ? Colors.transparent : const Color(0xFF0E43B3),
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
              color: isPlaceholder
                  ? const Color(0xFF8E9BB2)
                  : const Color(0xFF1F3870),
              fontSize: 14,
              fontWeight: isPlaceholder ? FontWeight.normal : FontWeight.bold,
            ),
          ),
        ],
      ),
    );
