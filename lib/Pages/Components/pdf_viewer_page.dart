// import 'dart:typed_data';
//
// import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_pdfview/flutter_pdfview.dart';
// import 'package:maarifkids/contants.dart';
// import 'package:path_provider/path_provider.dart';
// import 'dart:io';
//
// import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
//
// class SyncVisionPdfViewer extends StatelessWidget {
//   const SyncVisionPdfViewer({Key? key}) : super(key: key);
//
//   Future<String> getDownloadPath() async {
//     final appDocDir = await getApplicationDocumentsDirectory();
//     return '${appDocDir.path}/fabi_ticket.pdf';
//   }
//
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('PDF Viewer'),
//         actions: <Widget>[
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: IconButton(
//               color: MainColor,
//               icon: Icon(Icons.download),
//               onPressed: () async {
//                 try {
//                   final String downloadPath = await getDownloadPath();
//                   final Dio dio = Dio();
//
//                   await dio.download(
//                     'https://example.com/path/to/fabi_ticket.pdf', // Replace with the actual URL of the PDF file
//                     downloadPath,
//                     onReceiveProgress: (receivedBytes, totalBytes) {
//                       // Update the download progress if needed
//                     },
//                   );
//
//                   // Open the downloaded PDF file
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) =>
//                           PDFViewerPage(pdfPath: downloadPath),
//                     ),
//                   );
//                 } catch (e) {
//                   // Handle any errors that occur during the download process
//                   print('Error downloading PDF: $e');
//                 }
//               },
//             ),
//           )
//         ],
//       ),
//       body: SfPdfViewer.network(
//           'https://firebasestorage.googleapis.com/v0/b/maarif-567b8.appspot.com/o/School%20Health%20Information%20Form.pdf?alt=media&token=3e23d985-79cd-4bf3-863d-69945257b082&_gl=1*1weoa31*_ga*Mjg1MTAxOTg3LjE2ODIyNDk0MzA.*_ga_CW55HF8NVT*MTY4NjY1MjM1Mi4zMS4xLjE2ODY2NTI0NDYuMC4wLjA.'),
//     );
//   }
// }
//
// class PDFViewerPage extends StatelessWidget {
//   final String pdfPath;
//
//   const PDFViewerPage({Key? key, required this.pdfPath}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('PDF Viewer'),
//       ),
//       body: SfPdfViewer.file(File(pdfPath)),
//     );
//   }
// }
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

import '../../contants.dart';
import '../../contants.dart';
import '../../contants.dart';

class SyncVisionPdfViewer extends StatefulWidget {
  final String pdfUrl;

  const SyncVisionPdfViewer({Key? key, required this.pdfUrl}) : super(key: key);

  @override
  _SyncVisionPdfViewerState createState() => _SyncVisionPdfViewerState();
}

class _SyncVisionPdfViewerState extends State<SyncVisionPdfViewer> {
  bool _downloading = false;
  late String _downloadPath = '';

  @override
  void initState() {
    super.initState();
    _initDownloadPath();
  }

  Future<void> _initDownloadPath() async {
    final directory = await getApplicationDocumentsDirectory();
    setState(() {
      _downloadPath = directory.path;
    });
  }

  Future<void> _downloadPDF() async {
    setState(() {
      _downloading = true;
    });

    final dio = Dio();

    try {
      final response = await dio.download(
        widget.pdfUrl,
        '$_downloadPath/my_pdf.pdf',
        onReceiveProgress: (receivedBytes, totalBytes) {
          if (totalBytes != -1) {
            final progress =
                (receivedBytes / totalBytes * 100).toStringAsFixed(0);
            print('Download progress: $progress%');
          }
        },
      );

      if (response.statusCode == 200) {
        print('PDF downloaded successfully');
        _openDownloadedPDF();
      } else {
        print('Failed to download PDF');
      }
    } catch (e) {
      print('Error downloading PDF: $e');
    }

    setState(() {
      _downloading = false;
    });
  }

  void _openDownloadedPDF() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Scaffold(
          appBar: AppBar(
            actions: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: IconButton(
                  color: MainColor,
                  icon: Icon(
                    Icons.download,
                    color: MainColor,
                  ),
                  onPressed: () async {
                    // Code for downloading the PDF file
                  },
                ),
              )
            ],
            title: Text('Downloaded PDF'),
          ),
          body: SfPdfViewer.file(File('$_downloadPath/my_pdf.pdf')),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PDF Viewer'),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              color: MainColor,
              icon: Icon(Icons.download),
              onPressed: () {
                print('clicked');
                FileStorage.writeCounter(
                    myList.toString(), "geeksforgeeks.txt");
              },
              // onPressed: _downloading ? null : _downloadPDF,
            ),
          ),
        ],
      ),
      body: _downloading
          ? Center(child: CircularProgressIndicator())
          : SfPdfViewer.network(
              widget.pdfUrl,
            ),
    );
  }
}

// To save the file in the device
class FileStorage {
  static Future<String> getExternalDocumentPath() async {
    // To check whether permission is given for this app or not.
    var status = await Permission.storage.status;
    if (!status.isGranted) {
      // If not we will ask for permission first
      await Permission.storage.request();
    }
    Directory _directory = Directory("");
    if (Platform.isAndroid) {
      // Redirects it to download folder in android
      _directory = Directory("/storage/emulated/0/Download");
    } else {
      _directory = await getApplicationSupportDirectory();
    }

    final exPath = _directory.path;
    print("Saved Path: $exPath");
    await Directory(exPath).create(recursive: true);
    return exPath;
  }

  static Future<String> get _localPath async {
    // final directory = await getApplicationDocumentsDirectory();
    // return directory.path;
    // To get the external path from device of download folder
    final String directory = await getExternalDocumentPath();
    return directory;
  }

  static Future<File> writeCounter(String bytes, String name) async {
    print('Entered');
    final path = await _localPath;
    // Create a file for the path of
    // device and file name with extension
    File file = File('$path/$name');
    ;
    print("Save file");

    // Write the data in the file you have created
    return file.writeAsString(bytes);
  }
}

const myList = {"name": "GeeksForGeeks"};
