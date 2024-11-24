import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:google_mlkit_image_labeling/google_mlkit_image_labeling.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(); // Initialize Firebase
  runApp(const ImageAnalyzerApp());
}

class ImageAnalyzerApp extends StatelessWidget {
  const ImageAnalyzerApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Image Analyzer',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const ImageAnalyzerScreen(),
    );
  }
}

class ImageAnalyzerScreen extends StatefulWidget {
  const ImageAnalyzerScreen({Key? key}) : super(key: key);

  @override
  _ImageAnalyzerScreenState createState() => _ImageAnalyzerScreenState();
}

class _ImageAnalyzerScreenState extends State<ImageAnalyzerScreen> {
  File? _imageFile;
  List<String> _detectedLabels = [];
  final ImagePicker _imagePicker = ImagePicker();

  Future<void> _selectImage(ImageSource source) async {
    final pickedFile = await _imagePicker.pickImage(source: source);
    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
        _detectedLabels.clear(); // Clear previous results
      });
      await _processImageLabels();
    }
  }

  Future<void> _processImageLabels() async {
    if (_imageFile == null) return;

    final inputImage = InputImage.fromFile(_imageFile!);
    final labelerOptions = ImageLabelerOptions(confidenceThreshold: 0.6);
    final imageLabeler = ImageLabeler(options: labelerOptions);

    try {
      final labels = await imageLabeler.processImage(inputImage);

      setState(() {
        _detectedLabels = labels
            .map((label) =>
                '${label.label} (${(label.confidence * 100).toStringAsFixed(1)}%)')
            .toList();
      });
    } catch (e) {
      print('Error processing image: $e');
    } finally {
      imageLabeler.close();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Image Analyzer')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _imagePreview(),
            const SizedBox(height: 16),
            _actionButtons(),
            const SizedBox(height: 16),
            _labelResults(),
          ],
        ),
      ),
    );
  }

  Widget _imagePreview() {
    return Container(
      height: 200,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.grey[300],
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: _imageFile != null
          ? ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.file(
                _imageFile!,
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            )
          : const Center(child: Text('No Image Selected')),
    );
  }

  Widget _actionButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ElevatedButton.icon(
          onPressed: () => _selectImage(ImageSource.camera),
          icon: const Icon(Icons.camera_alt),
          label: const Text('Camera'),
        ),
        ElevatedButton.icon(
          onPressed: () => _selectImage(ImageSource.gallery),
          icon: const Icon(Icons.photo_library),
          label: const Text('Gallery'),
        ),
      ],
    );
  }

  Widget _labelResults() {
    return Expanded(
      child: _detectedLabels.isNotEmpty
          ? ListView.builder(
              itemCount: _detectedLabels.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: const Icon(Icons.label_outline),
                  title: Text(_detectedLabels[index]),
                );
              },
            )
          : const Center(child: Text('No Labels Detected')),
    );
  }
}
