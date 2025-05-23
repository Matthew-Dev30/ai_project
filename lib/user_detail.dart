import 'package:ai_project/verify_model.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

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
              child: Row(
                children: [
                  Icon(Icons.account_circle_sharp),
                  SizedBox(width: 4),
                  Text.rich(
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
                ],
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
              child: Row(
                children: [
                  Icon(Icons.calendar_month),
                  SizedBox(width: 4),
                  Text.rich(
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
                ],
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
              child: Row(
                children: [
                  Icon(Icons.insert_drive_file_rounded),
                  SizedBox(width: 4),
                  Text.rich(
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
                ],
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
              child: Row(
                children: [
                  Icon(Icons.date_range),
                  SizedBox(width: 4),
                  Text.rich(
                    TextSpan(
                      text: "ID Expiry: ",
                      style: TextStyle(fontWeight: FontWeight.bold),
                      children: [
                        TextSpan(
                          text: widget.verifyModel.expiry,
                          style: TextStyle(fontWeight: FontWeight.normal),
                        ),
                      ],
                    ),
                  ),
                ],
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
              child: Row(
                children: [
                  Icon(Icons.flag),
                  SizedBox(width: 4),
                  Text.rich(
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
                ],
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
              child: Row(
                children: [
                  Icon(Icons.male),
                  SizedBox(width: 4),
                  Text.rich(
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
                ],
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
              child: Row(
                children: [
                  Icon(Icons.percent),
                  SizedBox(width: 4),
                  Text.rich(
                    TextSpan(
                      text: "Similarity: ",
                      style: TextStyle(fontWeight: FontWeight.bold),
                      children: [
                        TextSpan(
                          text:
                              "${widget.verifyModel.similarity?.toStringAsFixed(2)}%",
                          style: TextStyle(fontWeight: FontWeight.normal),
                        ),
                      ],
                    ),
                  ),
                ],
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
              child: Row(
                children: [
                  Icon(Icons.face),
                  SizedBox(width: 4),
                  Text.rich(
                    TextSpan(
                      text: "Is Face Match: ",
                      style: TextStyle(fontWeight: FontWeight.bold),
                      children: [
                        TextSpan(
                          text:
                              (widget.verifyModel.faceMatch ?? false)
                                  ? "Face matched"
                                  : "Face not matched",
                          style: TextStyle(
                            fontWeight: FontWeight.normal,
                            color:
                                (widget.verifyModel.faceMatch ?? false)
                                    ? Colors.green
                                    : Colors.red,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
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
              child: Row(
                children: [
                  Icon(Icons.location_on),
                  SizedBox(width: 4),
                  Text.rich(
                    TextSpan(
                      text: "Adderess: ",
                      style: TextStyle(fontWeight: FontWeight.bold),
                      children: [
                        TextSpan(
                          text: widget.verifyModel.address,
                          style: TextStyle(fontWeight: FontWeight.normal),
                        ),
                      ],
                    ),
                  ),
                ],
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
              child: Row(
                children: [
                  Icon(Icons.location_searching_rounded),
                  SizedBox(width: 4),
                  Text.rich(
                    TextSpan(
                      text: "Cordinates: ",
                      style: TextStyle(fontWeight: FontWeight.bold),
                      children: [
                        TextSpan(
                          text:
                              "${widget.verifyModel.longitude}, ${widget.verifyModel.latitude}",
                          style: TextStyle(fontWeight: FontWeight.normal),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            Center(
              child: TextButton(
                onPressed: () async {
                  final String googleMapsUrl =
                      'https://www.google.com/maps/search/?api=1&query=${widget.verifyModel.latitude},${widget.verifyModel.longitude}';

                  if (!await launchUrl(Uri.parse(googleMapsUrl))) {
                    throw Exception('Could not launch $googleMapsUrl');
                  }
                },

                child: Text(
                  "Show on Google Maps",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.underline,
                    decorationColor: Colors.blue,
                    color: Colors.blue,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
