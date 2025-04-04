import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class BusinessModel extends StatefulWidget {
  const BusinessModel({super.key});

  @override
  State<BusinessModel> createState() => _BusinessModelState(
  );
}

class _BusinessModelState extends State<BusinessModel> {
  double _progressValue = 0.4; // Initial progress value
  final TextEditingController _startupNameController = TextEditingController();
  final TextEditingController _businessModelController = TextEditingController();
  final TextEditingController _monthlyRevenueController = TextEditingController();
  final TextEditingController _activeUsersController = TextEditingController();
  String? _selectedIndustry;

  void _updateProgress() {
    double progress = 0.4;

    if (_startupNameController.text.isNotEmpty) progress += 0.2;
    if (_selectedIndustry != null) progress += 0.2;
    if (_businessModelController.text.isNotEmpty) progress += 0.2;
    if (_monthlyRevenueController.text.isNotEmpty ||
        _activeUsersController.text.isNotEmpty) progress += 0.2;

    setState(() {
      _progressValue = progress;
    });}

  @override
  Widget build(BuildContext context) {
    String? selectedValue;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          "Add Startup",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    child: LinearProgressIndicator(
                      value: _progressValue, // Dynamic progress value
                      backgroundColor: Colors.grey[300],
                      valueColor:
                      AlwaysStoppedAnimation<Color>(Colors.blueAccent),
                    ),
                  ),
                  SizedBox(width: 10),
                  Container(
                    padding:
                    EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.blueAccent,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                        "${(_progressValue * 100).toInt()}%", // Show progress %
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold)),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Step 2: Business Model",
                style: GoogleFonts.poppins(fontWeight: FontWeight.w500, color: Colors.grey),
              ),
            ),
            Container(
              color: Colors.white10,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                  Text(
                  "Business Model",
                  style: GoogleFonts.poppins(fontWeight: FontWeight.w500),
                ),
                SizedBox(height: 8),
                DropdownButtonFormField<String>(
                  value: selectedValue,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(borderSide: BorderSide.none),
                  ),
                  hint: Text("Select business model"),
                  items: [
                    "B2B - Business to Business",
                    "B2C - Business to Consumer",
                    "SaaS - Software as a Service",
                    "Marketplace"
                  ].map((String category) {
                    return DropdownMenuItem(
                      value: category,
                      child: Text(category),
                    );
                  }).toList(),
                  onChanged: (String? value) {
                    setState(() {
                      selectedValue = value;
                    });
                  },),

                    SizedBox(height: 16),
                    Center(
                      child: ElevatedButton(
                        onPressed: () {
                          // Navigate to the next screen (Replace 'NextScreen' with actual screen)
                          //   Navigator.push(
                          //       context,
                          //       MaterialPageRoute(
                          //           builder: (context) => NextScreen()));
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          foregroundColor: Colors.white,
                          minimumSize: Size(double.infinity, 50),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: Text(
                          "Next Step",
                          style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

