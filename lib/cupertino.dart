import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CupertinoDatePickerPage extends StatefulWidget {
  const CupertinoDatePickerPage({Key? key}) : super(key: key);

  @override
  State<CupertinoDatePickerPage> createState() =>
      _CupertinoDatePickerPageState();
}

final TextEditingController _date = TextEditingController();

class _CupertinoDatePickerPageState extends State<CupertinoDatePickerPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GestureDetector(
          onTap: () {
            _showDatePicker(context);
          },
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  controller: _date,
                  readOnly: true,
                  enabled: false,
                  cursorColor: Colors.black,
                  style: const TextStyle(
                    color: Color(0xff000000),
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                    letterSpacing: -0.42,
                  ),
                  decoration: InputDecoration(
                    labelText: 'Doğum Tarihi',
                    labelStyle: const TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                    floatingLabelStyle: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 15,
                      color: Colors.grey.shade300,
                    ),
                    suffixIcon: const IconButton(
                      onPressed: null,
                      icon: Icon(Icons.calendar_today_outlined),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _showDatePicker(ctx) {
    showCupertinoModalPopup(
      context: ctx,
      builder: (_) => Container(
        height: 270,
        color: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 250,
                child: CupertinoDatePicker(
                  maximumYear: 2023,
                  mode: CupertinoDatePickerMode.date,
                  initialDateTime: DateTime.now(),
                  onDateTimeChanged: (value) {
                    _date.text = '${value.day.toString().padLeft(2, '0')}/'
                        '${value.month.toString().padLeft(2, '0')}/'
                        '${value.year.toString()}';
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
