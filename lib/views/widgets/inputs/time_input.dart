import 'package:anga/views/themes/themes.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CustomDateTimePicker extends StatefulWidget {
  const CustomDateTimePicker({super.key});

  @override
  CustomDateTimePickerState createState() => CustomDateTimePickerState();
}

class CustomDateTimePickerState extends State<CustomDateTimePicker> {
  TextEditingController controller = TextEditingController();
  DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40.0,
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      decoration: BoxDecoration(
        color: secondaryColor(),
        borderRadius: BorderRadius.circular(30.0),
      ),
      child: Row(
        children: [
          Icon(Icons.calendar_month, color: primaryForeGround()),
          const SizedBox(width: 8.0),
          Expanded(
            child: GestureDetector(
              onTap: () async {
                final DateTime? picked = await showDatePicker(
                  context: context,
                  initialDate: selectedDate,
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2101),
                );
                if (picked != null && picked != selectedDate) {
                  setState(() {
                    selectedDate = picked;
                    controller.text =
                        DateFormat('dd/MM/yyyy').format(selectedDate);
                  });
                }
              },
              child: AbsorbPointer(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(8.0, 0.0, 0.0, 12.0),
                  child: TextField(
                    controller: controller,
                    style: TextStyle(color: primaryForeGround()),
                    decoration: InputDecoration(
                      hintText: 'dd/mm/yyyy',
                      hintStyle: TextStyle(color: primaryForeGround()),
                      border: InputBorder.none,
                    ),
                    keyboardType: TextInputType.datetime,
                  ),
                ),
              ),
            ),
          ),
          const Icon(Icons.arrow_drop_down, color: Colors.white),
        ],
      ),
    );
  }
}
