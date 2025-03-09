import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:solution_chanllenge/Frontend/Screen/Add/Add%20Screens/business_model.dart';
import 'package:solution_chanllenge/Frontend/Screen/Add/Add%20Widgets/upload_image.dart';

class AddStartupScreen extends StatefulWidget {
  @override
  _AddStartupScreenState createState() => _AddStartupScreenState();
}

class _AddStartupScreenState extends State<AddStartupScreen> {
  double _progressValue = 0.2; // Initial progress value
  final TextEditingController _startupNameController = TextEditingController();
  final TextEditingController _businessModelController = TextEditingController();
  final TextEditingController _monthlyRevenueController = TextEditingController();
  final TextEditingController _activeUsersController = TextEditingController();
  String? _selectedIndustry;

  void _updateProgress() {
    double progress = 0.2; // Base progress for starting the form

    if (_startupNameController.text.isNotEmpty) progress += 0.2;
    if (_selectedIndustry != null) progress += 0.2;
    if (_businessModelController.text.isNotEmpty) progress += 0.2;
    if (_monthlyRevenueController.text.isNotEmpty ||
        _activeUsersController.text.isNotEmpty) progress += 0.2;

    setState(() {
      _progressValue = progress;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () {}, // Define back action
          ),
          title: Text("Add Startup",
              style:
              TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Step Indicator
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: LinearProgressIndicator(
                            value: _progressValue, // Dynamic progress value
                            backgroundColor: Colors.grey[300],
                            valueColor:
                            AlwaysStoppedAnimation<Color>(Colors.pink),
                          ),
                        ),
                        SizedBox(width: 10),
                        Container(
                          padding:
                          EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                          decoration: BoxDecoration(
                            color: Colors.pink,
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
                  SizedBox(height: 16),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Step 1: Basic Information",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.grey)),
                  ),

                  Container(
                    color: Colors.white10,
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          UploadImage(),
                          SizedBox(height: 8),
                          Center(
                              child: Text("Upload startup logo",
                                  style: TextStyle(color: Colors.grey))),

                          SizedBox(height: 24),
                          Text("Startup Name *",
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          SizedBox(height: 8),
                          TextField(
                            controller: _startupNameController,
                            onChanged: (value) => _updateProgress(),
                            decoration: InputDecoration(
                              hintText: "Enter your startup name",
                              filled: true,
                              fillColor: Colors.white,
                              border: OutlineInputBorder(
                                  borderSide: BorderSide.none),
                            ),
                          ),
                          SizedBox(height: 16),

                          // Industry Dropdown
                          Text("Industry *",
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          SizedBox(height: 8),
                          DropdownButtonFormField<String>(
                            alignment: Alignment.center,
                            decoration: InputDecoration(
                              hintText: "Select your Industry",
                              filled: true,
                              fillColor: Colors.white,
                              border: OutlineInputBorder(
                                  borderSide: BorderSide.none),
                            ),
                            items: ["Tech", "Finance", "Healthcare", "Other"]
                                .map((String category) {
                              return DropdownMenuItem(
                                  value: category, child: Text(category));
                            }).toList(),
                            onChanged: (value) {
                              _selectedIndustry = value;
                              _updateProgress();
                            },
                          ),
                          SizedBox(height: 16),

                          // Business Model Input
                          Text("Business Model *",
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          SizedBox(height: 8),
                          TextField(
                            controller: _businessModelController,
                            onChanged: (value) => _updateProgress(),
                            maxLines: 3,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              hintText: "Describe your business model",
                              border: OutlineInputBorder(
                                  borderSide: BorderSide.none),
                            ),
                          ),
                          SizedBox(height: 16),

                          // Market Traction Section
                          Text("Market Traction",
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          SizedBox(height: 8),
                          Row(
                            children: [
                              Expanded(
                                child: TextField(
                                  controller: _monthlyRevenueController,
                                  onChanged: (value) => _updateProgress(),
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Colors.white,
                                    hintText: "Monthly Revenue",
                                    border: OutlineInputBorder(
                                        borderSide: BorderSide.none),
                                  ),
                                ),
                              ),
                              SizedBox(width: 10),
                              Expanded(
                                child: TextField(
                                  controller: _activeUsersController,
                                  onChanged: (value) => _updateProgress(),
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Colors.white,
                                    hintText: "Active Users",
                                    border: OutlineInputBorder(
                                        borderSide: BorderSide.none),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 32),

                          // Next Step Button
                          Center(
                              child: ElevatedButton(
                                onPressed: () {
                                 Get.to( BusinessModel());
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                  Colors.blue, // Button background color
                                  foregroundColor: Colors.white, // Text color
                                  minimumSize:
                                  Size(double.infinity, 50), // Full width
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                                child: Text(
                                  "Next Step",
                                  style: TextStyle(
                                      fontSize: 16, fontWeight: FontWeight.bold),
                                ),
                              )),
                        ],
                      ),
                    ),
                  )
                ])));
  }
}
