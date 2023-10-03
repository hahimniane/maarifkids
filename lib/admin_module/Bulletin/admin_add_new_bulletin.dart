// import 'package:flutter/material.dart';
// class AdminAddNewBulletinPage extends StatelessWidget {
//   const AdminAddNewBulletinPage({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return const Placeholder();
//   }
// }
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

import '../../utils/contants.dart';
import '../../utils/custom_nav_bar.dart';
import '../../menu_page.dart';
import '../../utils/search_functionality.dart';

class AdminAddNewBulletinPage extends StatefulWidget {
  AdminAddNewBulletinPage({super.key});

  @override
  State<AdminAddNewBulletinPage> createState() =>
      _AdminAddNewBulletinPageState();
}

class _AdminAddNewBulletinPageState extends State<AdminAddNewBulletinPage> {
  final TextEditingController gradeController = TextEditingController();

  final TextEditingController dateController = TextEditingController();

  File? selectedPdf;

  File? selectedCoverImage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
        title: progressTrackingString,
        context: context,
        isFromSearch: false,
        isAdminColor: true,
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
                        // Navigator.push(context, MaterialPageRoute(builder: (context)=>));
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
                                Icons.send,
                                size: 20,
                                color: adminAppColor,
                              ),
                            ],
                          ),
                          Text(
                            'Publish',
                            style: TextStyle(
                                color: adminAppColor,
                                fontSize: 10,
                                fontWeight: FontWeight.bold),
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
                              'title',
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
                              'Date',
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
                    // Row(
                    //   children: [
                    //     Container(
                    //         width: 60,
                    //         height: 30,
                    //         decoration: BoxDecoration(
                    //             color: adminAppColor,
                    //             borderRadius: BorderRadius.circular(8)),
                    //         child: Center(
                    //             child: Text(
                    //               'Date',
                    //               style: TextStyle(
                    //                 fontWeight: FontWeight.w500,
                    //                 color: Colors.white,
                    //               ),
                    //             ))),
                    //     Container(
                    //         width: 210,
                    //         child: TextField(
                    //           textAlign: TextAlign.center,
                    //         ))
                    //   ],
                    // ),
                  ],
                )
              ],
            ),
          ),
          // DateSelectionWidget(),
          SizedBox(
            height: 10,
          ),
          GestureDetector(
            onTap: () async {
              FilePickerResult? result = await FilePicker.platform.pickFiles(
                allowMultiple: false,
                // allowedExtensions: ['pdf'],
              );

              if (result != null) {
                selectedPdf = File(result.files[0].path!);
                setState(() {}); // Update the UI to reflect the selected files
              } else {
                print('user cancelled the picker');
                // User canceled the picker
              }
            },
            child: Card(
              child: Container(
                decoration: BoxDecoration(
                    color: adminAppColor,
                    borderRadius: BorderRadius.circular(12)),
                height: 100,
                width: MediaQuery.of(context).size.width * 0.5,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Card(
                      elevation: 0,
                      child: Container(
                          height: 30,
                          width: 100,
                          child: Center(
                              child: Text(
                            selectedPdf != null ? 'File uploaded' : 'Add PDF',
                            style: TextStyle(
                              color: adminAppColor,
                            ),
                          ))),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.picture_as_pdf_sharp,
                          color: Colors.white,
                        ),
                        Icon(
                          Icons.keyboard_double_arrow_up,
                          color: Colors.white,
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          GestureDetector(
            onTap: () async {
              FilePickerResult? result = await FilePicker.platform.pickFiles(
                allowMultiple: false,
                // allowedExtensions: ['pdf'],
              );

              if (result != null) {
                selectedCoverImage = File(result.files[0].path!);
                setState(() {}); // Update the UI to reflect the selected files
              } else {
                print('user cancelled the picker');
                // User canceled the picker
              }
            },
            child: Card(
              child: Container(
                decoration: BoxDecoration(
                    color: adminAppColor,
                    borderRadius: BorderRadius.circular(12)),
                height: 100,
                width: MediaQuery.of(context).size.width * 0.5,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Card(
                      elevation: 0,
                      child: Container(
                          height: 30,
                          width: 100,
                          child: Center(
                              child: Text(
                            'Cover Image',
                            style: TextStyle(
                              color: adminAppColor,
                            ),
                          ))),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          size: 30,
                          Icons.photo,
                          color: Colors.white,
                        ),
                        Icon(
                          size: 30,
                          Icons.keyboard_double_arrow_up,
                          color: Colors.white,
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
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
