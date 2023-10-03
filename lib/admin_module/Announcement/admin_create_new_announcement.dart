import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

import '../../utils/contants.dart';
import '../../utils/pdf_viewer_page.dart';

class CreateNewAnnouncement extends StatefulWidget {
  CreateNewAnnouncement({
    super.key,
  });

  @override
  State<CreateNewAnnouncement> createState() => _CreateNewAnnouncementState();
}

class _CreateNewAnnouncementState extends State<CreateNewAnnouncement> {
  List<File> selectedFiles = [];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: adminAppColor,
                      )),
                  child: TextButton(
                      onPressed: () {
                        //TODO: make sure that the user is not empty.
                        //TODO: make sure that the subject is not empty
                        //TODO: make sure that the message is not empty
                        //TODO: check if there is any attachement attached.
                      },
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.arrow_forward_ios_rounded,
                                size: 10,
                                color: adminAppColor,
                              ),
                            ],
                          ),
                          Text(
                            'Send',
                            style: TextStyle(color: adminAppColor, fontSize: 10),
                          ),
                        ],
                      )),
                ),
              ),
              SizedBox(
                width: 15,
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Container(
                          width: 60,
                          height: 30,
                          decoration: BoxDecoration(
                              color: adminAppColor,
                              borderRadius: BorderRadius.circular(8)),
                          child: Center(
                              child: Text(
                            'To',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),
                          ))),
                      Container(
                        width: 210,
                        child: TextField(
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                          width: 60,
                          height: 30,
                          decoration: BoxDecoration(
                              color: adminAppColor,
                              borderRadius: BorderRadius.circular(8)),
                          child: Center(
                              child: Text(
                            'Subject',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),
                          ))),
                      Container(
                          width: 210,
                          child: TextField(
                            textAlign: TextAlign.center,
                          ))
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
        Expanded(
          child: Center(
              child: Container(
                  decoration: BoxDecoration(
                      color: Color(0xffFDF1E2),
                      borderRadius: BorderRadius.circular(9)),
                  height: MediaQuery.of(context).size.height * 0.40,
                  width: MediaQuery.of(context).size.width * 0.95,
                  child: TextField(
                    expands: true,
                    decoration: InputDecoration(
                      labelText: 'Enter Message',
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.multiline,
                    // textInputAction: TextInputAction.,
                    minLines: null, // <-- SEE HERE
                    maxLines: null, // <-- SEE HERE
                  ))),
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: TextButton(
            style: TextButton.styleFrom(),
            onPressed: () async {
              FilePickerResult? result = await FilePicker.platform.pickFiles(
                allowMultiple: true,
                // allowedExtensions: ['pdf'],
              );

              if (result != null) {
                selectedFiles =
                    result.paths.map((path) => File(path!)).toList();
                setState(() {}); // Update the UI to reflect the selected files
              } else {
                print('user cancelled the picker');
                // User canceled the picker
              }
            },
            child: Row(
              children: [
                Image(
                  height: 30,
                  width: 30,
                  image:
                      AssetImage('images/admin_images/attachedFilesIcon.png'),
                ),
                Text(
                  'Attached Files',
                  style: TextStyle(
                      color: adminAppColor,
                      decoration: TextDecoration.underline,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
        Align(
            alignment: Alignment.centerLeft,
            child: selectedFiles.isNotEmpty
                ? Row(
                    children: selectedFiles.map((file) {
                      return GestureDetector(
                        onTap: () {
                          print('clicked');
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SyncVisionPdfViewer(
                                pdfSource: file,
                              ),
                            ),
                          );
                        },
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.0),
                          child: Image.asset(
                            'images/admin_images/pdfIcon.png',
                            height: 30,
                            width: 30,
                          ),
                        ),
                      );
                    }).toList(),
                  )
                : Container()
            // Padding(
            //   padding: const EdgeInsets.only(left: 13.0),
            //   child: Image(
            //     height: 30,
            //     width: 30,
            //     image: AssetImage('images/admin_images/pdfIcon.png'),
            //   ),
            // ),
            )
      ],
    );
  }
}
