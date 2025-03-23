import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Predict extends StatefulWidget {
  const Predict({super.key});

  @override
  State<Predict> createState() => _PredictState();
}

class _PredictState extends State<Predict> {
  final TextEditingController cementController = TextEditingController();
  final TextEditingController slagController = TextEditingController();
  final TextEditingController flyAshController = TextEditingController();
  final TextEditingController waterController = TextEditingController();
  final TextEditingController superplasticizerController = TextEditingController();
  final TextEditingController coarseAggregateController = TextEditingController();
  final TextEditingController fineAggregateController = TextEditingController();
  final TextEditingController ageController = TextEditingController();

  double? predictedStrength;
  Color iconColor = Colors.grey;
  IconData iconType = Icons.help_outline;

  Future<void> predictStrength() async {
    final url = Uri.parse('https://cementapi.onrender.com/predict'); 

    Map<String, dynamic> requestData = {
      "Cement": double.tryParse(cementController.text) ?? 0,
      "Blast Furnace Slag": double.tryParse(slagController.text) ?? 0,
      "Fly Ash": double.tryParse(flyAshController.text) ?? 0,
      "Water": double.tryParse(waterController.text) ?? 0,
      "Superplasticizer": double.tryParse(superplasticizerController.text) ?? 0,
      "Coarse Aggregate": double.tryParse(coarseAggregateController.text) ?? 0,
      "Fine Aggregate": double.tryParse(fineAggregateController.text) ?? 0,
      "Age (day)": int.tryParse(ageController.text) ?? 0
    };

    try {
      final response = await http.post(
        url,
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(requestData),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        double result = data['predicted_strength'];

        setState(() {
          predictedStrength = result;
          // Set icon and color based on prediction
          if (result > 50) {
            iconColor = Colors.green;
            iconType = Icons.sentiment_satisfied;
          } else if (result > 30) {
            iconColor = Colors.orange;
            iconType = Icons.sentiment_neutral;
          } else {
            iconColor = Colors.red;
            iconType = Icons.sentiment_dissatisfied;
          }
        });
      } else {
        throw Exception("Failed to get prediction");
      }
    } catch (e) {
      print("Error: $e");
      setState(() {
        predictedStrength = null;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset('assets/images/cemento.jpg', height: 40),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildInputField('Cement (Weight in KGs)', cementController),
              buildInputField('Blast Furnace Slag', slagController),
              buildInputField('Fly Ash', flyAshController),
              buildInputField('Water', waterController),
              buildInputField('Superplasticizer', superplasticizerController),
              buildInputField('Coarse Aggregate', coarseAggregateController),
              buildInputField('Fine Aggregate', fineAggregateController),
              buildInputField('Age (Days)', ageController),

              const SizedBox(height: 20),

              Center(
                child: ElevatedButton(
                  onPressed: predictStrength,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                  ),
                  child: const Text('Predict Strength'),
                ),
              ),

              const SizedBox(height: 20),

              if (predictedStrength != null) ...[
                Center(
                  child: Column(
                    children: [
                      Text(
                        'Predicted Strength: ${predictedStrength!.toStringAsFixed(2)}',
                        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 10),
                      Icon(iconType, color: iconColor, size: 50),
                    ],
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }

  Widget buildInputField(String label, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          SizedBox(
            width: 180,
            child: Text(label, style: const TextStyle(fontSize: 16)),
          ),
          Expanded(
            child: TextField(
              controller: controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
