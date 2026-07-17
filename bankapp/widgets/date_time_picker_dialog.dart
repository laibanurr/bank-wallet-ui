
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DialoguePractHelpers {
  
  static Future<String?> androidTimePicker(BuildContext context) async {
    TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (pickedTime != null) {
      return pickedTime.format(context); 
    }
    return null;
  }

  
  static Future<String?> androidDatePicker(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2030),
    );
    if (pickedDate != null) {
      
      return "${pickedDate.year}-${pickedDate.month.toString().padLeft(2, '0')}-${pickedDate.day.toString().padLeft(2, '0')}";
    }
    return null;
  }

  
  static void showIosPicker({
    required BuildContext context,
    required Function(DateTime) onDateTimeChanged, 
  }) {
    showCupertinoModalPopup(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 250,
          color: CupertinoColors.systemBackground,
          child: SafeArea(
            top: false,
            child: CupertinoDatePicker(
              initialDateTime: DateTime.now(),
              mode: CupertinoDatePickerMode.dateAndTime,
              use24hFormat: false,
              onDateTimeChanged: onDateTimeChanged, 
            ),
          ),
        );
      },
    );
  }
}

class DialoguePract extends StatelessWidget {
  const DialoguePract({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}

