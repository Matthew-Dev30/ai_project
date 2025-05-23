import 'package:ai_project/verify_model.dart';
import 'package:flutter/material.dart';

class UserDetail extends StatefulWidget {
  const UserDetail({super.key, required this.verifyModel});

  final VerifyModel verifyModel;

  @override
  State<UserDetail> createState() => _UserDetailState();
}

class _UserDetailState extends State<UserDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("User Detail"), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 16),
              width: double.infinity,
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(width: 1, color: Colors.grey),
              ),
              child: Text.rich(
                TextSpan(
                  text: "Name: ",
                  style: TextStyle(fontWeight: FontWeight.bold),
                  children: [
                    TextSpan(
                      text: widget.verifyModel.fieldName,
                      style: TextStyle(fontWeight: FontWeight.normal),
                    ),
                  ],
                ),
              ),
            ),

            Container(
              margin: EdgeInsets.only(bottom: 16),
              width: double.infinity,
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(width: 1, color: Colors.grey),
              ),
              child: Text.rich(
                TextSpan(
                  text: "DOB: ",
                  style: TextStyle(fontWeight: FontWeight.bold),
                  children: [
                    TextSpan(
                      text: widget.verifyModel.dateOfBirth,
                      style: TextStyle(fontWeight: FontWeight.normal),
                    ),
                  ],
                ),
              ),
            ),

            Container(
              margin: EdgeInsets.only(bottom: 16),
              width: double.infinity,
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(width: 1, color: Colors.grey),
              ),
              child: Text.rich(
                TextSpan(
                  text: "ID Number: ",
                  style: TextStyle(fontWeight: FontWeight.bold),
                  children: [
                    TextSpan(
                      text: widget.verifyModel.idNumber,
                      style: TextStyle(fontWeight: FontWeight.normal),
                    ),
                  ],
                ),
              ),
            ),

            Container(
              margin: EdgeInsets.only(bottom: 16),
              width: double.infinity,
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(width: 1, color: Colors.grey),
              ),
              child: Text.rich(
                TextSpan(
                  text: "Country: ",
                  style: TextStyle(fontWeight: FontWeight.bold),
                  children: [
                    TextSpan(
                      text: widget.verifyModel.country,
                      style: TextStyle(fontWeight: FontWeight.normal),
                    ),
                  ],
                ),
              ),
            ),

            Container(
              margin: EdgeInsets.only(bottom: 16),
              width: double.infinity,
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(width: 1, color: Colors.grey),
              ),
              child: Text.rich(
                TextSpan(
                  text: "Gender: ",
                  style: TextStyle(fontWeight: FontWeight.bold),
                  children: [
                    TextSpan(
                      text: widget.verifyModel.gender,
                      style: TextStyle(fontWeight: FontWeight.normal),
                    ),
                  ],
                ),
              ),
            ),

            Container(
              margin: EdgeInsets.only(bottom: 16),
              width: double.infinity,
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(width: 1, color: Colors.grey),
              ),
              child: Text.rich(
                TextSpan(
                  text: "Similarity: ",
                  style: TextStyle(fontWeight: FontWeight.bold),
                  children: [
                    TextSpan(
                      text: "${widget.verifyModel.similarity}%",
                      style: TextStyle(fontWeight: FontWeight.normal),
                    ),
                  ],
                ),
              ),
            ),

            Container(
              margin: EdgeInsets.only(bottom: 16),
              width: double.infinity,
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(width: 1, color: Colors.grey),
              ),
              child: Text.rich(
                TextSpan(
                  text: "Is Face Match: ",
                  style: TextStyle(fontWeight: FontWeight.bold),
                  children: [
                    TextSpan(
                      text:
                          (widget.verifyModel.faceMatch ?? false)
                              ? "Face matched"
                              : "Face not matched",
                      style: TextStyle(fontWeight: FontWeight.normal),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
