import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:ai_project/user_detail.dart';
import 'package:ai_project/verify_model.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'package:http/http.dart' as http;

class VerificationScreen extends StatefulWidget {
  const VerificationScreen({super.key});

  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  File? _imageUser;
  File? _imageId;
  File? _imageIdBack;

  final picker = ImagePicker();

  Future<void> _pickImageUser(ImageSource source) async {
    final pickedFile = await picker.pickImage(source: source);

    if (pickedFile != null) {
      setState(() {
        _imageUser = File(pickedFile.path);
      });
    }
  }

  Future<void> _pickImageId(ImageSource source) async {
    final pickedFile = await picker.pickImage(source: source);

    if (pickedFile != null) {
      setState(() {
        _imageId = File(pickedFile.path);
      });
    }
  }

  Future<void> _pickImageIdBack(ImageSource source) async {
    final pickedFile = await picker.pickImage(source: source);

    if (pickedFile != null) {
      setState(() {
        _imageIdBack = File(pickedFile.path);
      });
    }
  }

  bool loading = false;

  // String? _error;

  Future<void> uploadImages() async {
    if (_imageUser == null || _imageId == null || _imageIdBack == null) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Please select both images')));
      return;
    }

    log(_imageUser.toString());
    log(_imageId.toString());
    log(_imageIdBack.toString());

    setState(() {
      loading = true;
    });

    final uri = Uri.parse('http://192.168.8.46:3000/verify');
    var request = http.MultipartRequest('POST', uri);

    request.files.add(
      await http.MultipartFile.fromPath('face', _imageUser!.path),
    );

    request.files.add(
      await http.MultipartFile.fromPath('idCard', _imageId!.path),
    );

    request.files.add(
      await http.MultipartFile.fromPath('backCard', _imageIdBack!.path),
    );

    try {
      final response = await request.send();

      if (response.statusCode == 200) {
        setState(() {
          loading = false;
        });

        var responseData = await http.Response.fromStream(
          response,
        ).timeout(const Duration(seconds: 50));

        var decodeedResponseData = jsonDecode(responseData.body);

        VerifyModel verifyModel = VerifyModel.fromJson(
          decodeedResponseData["data"],
        );

        log("responseeeee.bodyy: ${responseData.body.toString()}");

        log("responseeeee: ${verifyModel.toJson()}");

        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => UserDetail(verifyModel: verifyModel),
          ),
        );

        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Upload successful')));
      } else {
        setState(() {
          loading = false;
        });

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Upload failed: ${response.statusCode}')),
        );
      }
    } catch (e) {
      setState(() {
        loading = false;
      });

      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Error: $e')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Verification"), centerTitle: true),
      body:
          loading
              ? Center(child: CircularProgressIndicator())
              : ListView(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                children: [
                  Text(
                    "User Image",
                    style: TextStyle(fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 12),
                  CircleAvatar(
                    radius: 50,
                    backgroundImage:
                        _imageUser != null ? FileImage(_imageUser!) : null,
                    child:
                        _imageUser != null
                            ? const SizedBox()
                            : Icon(Icons.no_accounts),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () => _pickImageUser(ImageSource.camera),
                    child: Text('Take Photo'),
                  ),

                  // SizedBox(height: 12),

                  // ElevatedButton(
                  //   onPressed: () => _pickImageUser(ImageSource.gallery),
                  //   child: Text('Pick from Gallery'),
                  // ),
                  const SizedBox(height: 32),

                  Text(
                    "ID Card Front Image",
                    style: TextStyle(fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 12),

                  Container(
                    height: 200,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(20),
                    ),

                    child:
                        _imageId != null
                            ? Image.file(_imageId!, fit: BoxFit.contain)
                            : Icon(Icons.no_accounts),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () => _pickImageId(ImageSource.camera),
                    child: Text('Take Photo'),
                  ),

                  SizedBox(height: 12),

                  ElevatedButton(
                    onPressed: () => _pickImageId(ImageSource.gallery),
                    child: Text('Pick from Gallery'),
                  ),

                  const SizedBox(height: 32),

                  Text(
                    "ID Card Back Image",
                    style: TextStyle(fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 12),
                  Container(
                    height: 200,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(20),
                    ),

                    child:
                        _imageIdBack != null
                            ? Image.file(_imageIdBack!, fit: BoxFit.contain)
                            : Icon(Icons.no_accounts),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () => _pickImageIdBack(ImageSource.camera),
                    child: Text('Take Photo'),
                  ),

                  SizedBox(height: 12),

                  ElevatedButton(
                    onPressed: () => _pickImageIdBack(ImageSource.gallery),
                    child: Text('Pick from Gallery'),
                  ),

                  const SizedBox(height: 32),

                  ElevatedButton(
                    onPressed: () => uploadImages(),
                    style: ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(Colors.black),
                      foregroundColor: WidgetStatePropertyAll(Colors.white),
                      maximumSize: WidgetStatePropertyAll(
                        Size(double.infinity, 40),
                      ),
                      minimumSize: WidgetStatePropertyAll(
                        Size(double.infinity, 40),
                      ),
                    ),
                    child: Text('Submit'),
                  ),

                  const SizedBox(height: 32),
                ],
              ),
    );
  }
}
