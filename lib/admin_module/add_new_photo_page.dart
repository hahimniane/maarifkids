import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

import '../Pages/Components/custom_nav_bar.dart';
import '../Pages/Components/pdf_viewer_page.dart';
import '../Pages/menu_page.dart';
import '../contants.dart';
import '../test_page.dart';
class AddNewPhotoPage extends StatefulWidget {
  const AddNewPhotoPage({super.key});

  @override
  State<AddNewPhotoPage> createState() => _AddNewPhotoPageState();
}
List<File> selectedFiles = [];
class _AddNewPhotoPageState extends State<AddNewPhotoPage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: buildAppBar(title: 'Gallery', context: context, isFromSearch: false,isAdminColor: true,

      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Container(
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
                        Container(width: 210, child: TextField(
                          textAlign: TextAlign.center,
                        ),),
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
                                  'Date',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white,
                                  ),
                                ))),
                        Container(width: 210, child: TextField(  textAlign: TextAlign.center,))
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
                        Container(width: 210, child: TextField(  textAlign: TextAlign.center,))
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => AddNewPhotoPage()));
            },
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.80,
              height: MediaQuery.of(context).size.height * 0.20,
              child: Padding(
                padding: const EdgeInsets.all(2.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(36),
                  child: Card(
                    elevation: 4,
                    color: adminAppColor,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [

                        Text(
                          textAlign: TextAlign.center,
                          'UPLOAD',
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.w700),
                        ),
                        Icon(
                          Icons.photo_library,
                          color: Colors.white,
                          size: 80,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          // Expanded(
          //   child: Center(
          //       child: Container(
          //           decoration: BoxDecoration(
          //               color: Color(0xffFDF1E2),
          //               borderRadius: BorderRadius.circular(9)),
          //           height: MediaQuery.of(context).size.height * 0.40,
          //           width: MediaQuery.of(context).size.width * 0.95,
          //           child: TextField(
          //
          //             expands: true,
          //             decoration: InputDecoration(
          //
          //               labelText: 'Enter Message',
          //               border: OutlineInputBorder(),
          //             ),
          //             keyboardType: TextInputType.multiline,
          //             // textInputAction: TextInputAction.,
          //             minLines: null, // <-- SEE HERE
          //             maxLines: null, // <-- SEE HERE
          //           ))),
          // ),
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
              child: Column(
                children: [
                  Icon(
                    // height: 30,
                    // width: 30,

                   Icons.camera_alt_rounded,
                    color: adminAppColor,
                  ),
                  Text(
                    'Add Album',
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
      ),
      bottomNavigationBar: CustomNavigationBar(
        currentIndex: 0,
        onTap: (int value) {
          if (value == 0) {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => MenuPage()));
          } else if (value == 1) {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => SearchFieldSample()));
          }
        },
      ),
    );
  }
}
