import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../services/api_service.dart';
import 'result.dart'; // Import Result Page

class FindOutPage extends StatefulWidget {
  const FindOutPage({super.key});

  @override
  _FindOutPageState createState() => _FindOutPageState();
}

class _FindOutPageState extends State<FindOutPage> {
  File? _image;

  // Function to Pick Image from Gallery
  Future<void> _pickImageFromGallery() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      _processImage(File(pickedFile.path));
    }
  }

  // Function to Capture Image from Camera
  Future<void> _captureImageFromCamera() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      _processImage(File(pickedFile.path));
    }
  }

  // Function to Process Image and Send to API
  Future<void> _processImage(File imageFile) async {
    setState(() {
      _image = imageFile;
    });

    try {
      var result = await ApiService.uploadImage(imageFile);

      if (result != null && result.containsKey("confidence") && result.containsKey("prediction")) {
        String prediction = result["prediction"] ?? "Unknown";
        double confidence = double.tryParse(result["confidence"].toString()) ?? 0.0;

        print("✅ Navigating to ResultPage with: $prediction, $confidence");

        if (mounted) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ResultPage(
                prediction: prediction,
                confidence: confidence,
                imageFile: imageFile.existsSync() ? imageFile : File(''),
              ),
            ),
          );
        }
      } else {
        print("❌ Error: Invalid API response");
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Error: Invalid API response")),
        );
      }
    } catch (e) {
      print("❌ Exception: $e");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error: $e")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: PreferredSize(
  preferredSize: const Size.fromHeight(130), // AppBar height matching image height
  child: Container(
    color: Colors.blue, // Background color
    child: Stack(
      children: [
        // 🔹 Back Button
        Positioned(
          left: 10, // Adjust horizontal position
          top: 40, // Adjust vertical position
          child: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white, size: 30),
            onPressed: () {
              Navigator.pop(context); // Goes back to the previous screen
            },
          ),
        ),

        // 🔹 Centered Image
        Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 10), // Prevents cutoff at the top
            child: Image.asset(
              'assets/PaddyDoctor.png',
              height: 300, // Adjusted slightly to fit within bounds
              fit: BoxFit.contain, // Ensures it scales without cropping
            ),
          ),
        ),
      ],
    ),
  ),
),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _image != null
                ? Image.file(_image!, height: 50)
                : const Text(
                  "Scan or Upload an Image to Get Predictions",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  
                ),

            const SizedBox(height: 20),

            // Button for Gallery
            ElevatedButton.icon(
              onPressed: _pickImageFromGallery,
              icon: const Icon(Icons.image, color: Colors.white, size: 50,),
              label: const Text("Upload with Image", style: TextStyle(fontSize: 18, color: Colors.white)),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                minimumSize: const Size(250, 60), // Bigger size
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),

            const SizedBox(height: 10),

            // Button for Camera
            ElevatedButton.icon(
              onPressed: _captureImageFromCamera,
              icon: const Icon(Icons.camera_alt, color: Colors.white, size: 50,),
              label: const Text("Scan with Camera", style: TextStyle(fontSize: 18, color: Colors.white)),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                minimumSize: const Size(250, 60), // Bigger size
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
