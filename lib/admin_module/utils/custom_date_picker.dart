import 'package:flutter/material.dart';
class DateSelectionWidget extends StatefulWidget {
  const DateSelectionWidget({super.key});

  @override
  _DateSelectionWidgetState createState() => _DateSelectionWidgetState();
}

class _DateSelectionWidgetState extends State<DateSelectionWidget> {
  DateTime? _selectedDate = DateTime.now();

  final List<String> _dates = [
    '2022-2023',
    '2021-2022',
    '2020-2021',
    // Add more dates here as needed
  ];

  @override
  Widget build(BuildContext context) {
    // _selectedDate=_dates.first;
    return GestureDetector(
      onTap: _showDatePicker,
      child: Container(
        width: MediaQuery.of(context).size.width * 0.48,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          // border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(5),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: Icon(
                Icons.calendar_today,
                color: Theme.of(context).primaryColor,
              ),
            ),
            const SizedBox(width: 5),
            Text(
              _selectedDate != null
                  ? '${_selectedDate?.year}-${_selectedDate!.year + 1}'
                  : 'Select Date',
              style: TextStyle(
                  fontSize: 16,
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(width: 5),
            Icon(
              Icons.arrow_drop_down,
              color:  Theme.of(context).primaryColor,
            ),
          ],
        ),
      ),
    );
  }

  void _showDatePicker() async {
    var selectedDate = await showDialog<DateTime>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Select a Date'),
          content: SingleChildScrollView(
            child: Column(
              children: _dates.map((date) {
                return ListTile(
                  title: Text(
                    date,
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  onTap: () {
                    Navigator.of(context)
                        .pop(DateTime(int.parse(date.substring(0, 4))));
                  },
                );
              }).toList(),
            ),
          ),
        );
      },
    );

    if (selectedDate != null) {
      setState(() {
        _selectedDate = selectedDate;
      });
    }
  }

  // This method will return a List of two images based on the selected date
  List<String>? getImagesForSelectedDate() {
    if (_selectedDate == null) {
      print('is null');
      return null; // Return null if no date is selected
    } else {
      print('adding logic here');
      // Add your logic here to fetch the images for the selected date
      // and return a List of two image URLs or paths.
      // For now, we'll return a placeholder List.
      return ['image_url_1', 'image_url_2'];
    }
  }

  @override
  void initState() {
    super.initState();
  }
}