import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'package:http/http.dart' as http;

class SellerScreen extends StatefulWidget {
  const SellerScreen({super.key});

  @override
  State<SellerScreen> createState() => _SellerScreenState();
}

class _SellerScreenState extends State<SellerScreen> {
  File? _image;

  final picker = ImagePicker();

  Future<void> _pickImage(ImageSource source) async {
    final pickedFile = await picker.pickImage(source: source);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  bool loading = false;

  Future<void> uploadImages() async {
    if (_image == null) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Please select both images')));
      return;
    }

    log(_image.toString());

    final uri = Uri.parse('https://your-api.com/upload');
    var request = http.MultipartRequest('POST', uri);

    request.files.add(await http.MultipartFile.fromPath('image', _image!.path));

    try {
      final response = await request.send();
      if (response.statusCode == 200) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Upload successful')));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Upload failed: ${response.statusCode}')),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Error: $e')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Seller Suggestion"), centerTitle: true),
      body: Center(
        child:
            loading
                ? CircularProgressIndicator()
                : Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    children: [
                      const SizedBox(height: 32),

                      Container(
                        height: 200,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(20),
                        ),

                        child:
                            _image != null
                                ? Image.file(_image!, fit: BoxFit.contain)
                                : Icon(Icons.no_accounts),
                      ),
                      SizedBox(height: 20),

                      Column(
                        children: [
                          ElevatedButton(
                            onPressed: () => _pickImage(ImageSource.camera),
                            child: Text('Take Photo'),
                          ),

                          SizedBox(height: 12),

                          ElevatedButton(
                            onPressed: () => _pickImage(ImageSource.gallery),
                            child: Text('Pick from Gallery'),
                          ),
                          const SizedBox(height: 32),
                          ElevatedButton(
                            onPressed: () => uploadImages(),
                            style: ButtonStyle(
                              backgroundColor: WidgetStatePropertyAll(
                                Colors.black,
                              ),
                              foregroundColor: WidgetStatePropertyAll(
                                Colors.white,
                              ),
                              maximumSize: WidgetStatePropertyAll(
                                Size(double.infinity, 40),
                              ),
                              minimumSize: WidgetStatePropertyAll(
                                Size(double.infinity, 40),
                              ),
                            ),
                            child: Text('Submit'),
                          ),
                        ],
                      ),

                      //
                      // Column(
                      //   crossAxisAlignment: CrossAxisAlignment.start,
                      //   children: [
                      //     Text(
                      //       "Title: ",
                      //       style: TextStyle(fontWeight: FontWeight.bold),
                      //     ),
                      //     Text(
                      //       "Description: ",
                      //       style: TextStyle(fontWeight: FontWeight.bold),
                      //     ),
                      //     Text(
                      //       "Keywords: ",
                      //       style: TextStyle(fontWeight: FontWeight.bold),
                      //     ),
                      //     Text(
                      //       "Targeted Audiance: ",
                      //       style: TextStyle(fontWeight: FontWeight.bold),
                      //     ),
                      //   ],
                      // ),
                    ],
                  ),
                ),
      ),
    );
  }
}
