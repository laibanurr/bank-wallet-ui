import 'package:flutter/material.dart';

class PaymentReceiptDialog {
  static void show({
    required BuildContext context,
    required String cardNumber,
    required String holderName,
    required String date,
    required String time,
  }) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24.0),
          ),
          elevation: 14,
          backgroundColor: Colors.white,
          child: Container(
            padding: EdgeInsets.all(24.0),
            child: Column(
              mainAxisSize: .min,
              children: [

                CircleAvatar(
                  radius: 30,
                  // backgroundColor: Color(0xFF0E43B3).withAlpha(20),
                  backgroundColor: Color(0xFF011F5B).withAlpha(20),
                //   child: Padding(
                //     padding: EdgeInsets.all(14.0),
                //     child:Image.asset('assets/images/checklist.png',fit: BoxFit.contain,),
                // )),
              child:Image.asset('assets/images/dialogchecklist.png',fit: BoxFit.contain,),


                // Container(
                //   padding: EdgeInsets.all(16.0),
                //   decoration: BoxDecoration(
                //     color: Colors.white,
                //     shape: BoxShape.circle,
                //   ),
                //   child: Icon(
                //     Icons.check_circle_rounded,
                //     color: Color(0xFF0E43B3),
                //     size: 54,
                //   ),
                // ),
                ),
                SizedBox(height: 20),
                Text(
                  'Payment Scheduled',
                  style: TextStyle(
                    color: Color(0xFF1F3870),
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'Your transaction has been reserved',
                  style: TextStyle(color: Color(0xFF8E9BB2), fontSize: 13),
                  textAlign: TextAlign.center,
                ),
                Container(
                  padding: EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: Color(0xFFF4F7FD),
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  child: Column(children: [
                    _receiptRow('Card Number', ' 4321 8866 0011 6767'),
                    Divider(color: Colors.black, height: 16,),
                    _receiptRow('Holder Name ', 'ALEX MORGAN'),
                    Divider(color: Colors.black, height: 16,),
                    _receiptRow("Date", date),
                    Divider(color: Colors.black, height: 16,),
                     _receiptRow('Time', time),
                    Divider(color: Colors.black, height: 16,),


                  ],
                ),
                ),
                SizedBox(height: 28,),
                SizedBox(width: double.infinity,
                height: 52,
                child: ElevatedButton(
                   style: ElevatedButton.styleFrom(
                      //  backgroundColor: const Color(0xFF0E43B3),
                      backgroundColor: Color(0xFF011F5B),
                      // backgroundColor: Color(0xFF011F5B),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                      elevation: 0,
                    ),
                  
                  onPressed: ()=> Navigator.pop(context), child:Text('Done',
                   style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
                         )),
                ) 
              ],
            ),
          ),
        );
      },
    );
  }
}

Widget _receiptRow(String label, String value) {
  return Row(
    mainAxisAlignment: .spaceBetween,
    children: [
      Text(
        label,
        style: TextStyle(
          color: Color(0xFF8E9BB2), // Slate Gray
          fontSize: 13,
          fontWeight: FontWeight.w500,
        ),
      ),
      Text(value,
      style: TextStyle(
         color: Color(0xFF1F3870), // Crisp Bold Navy
            fontSize: 13,
            fontWeight: FontWeight.bold,
          ),
      ),
    ],
  );
}
