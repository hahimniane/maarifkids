import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../utils/contants.dart';

// class Album {
//   final String name;
//   final List<File> media;
//
//   Album(this.name, this.media);
// }

// class MediaUploadPage extends StatefulWidget {
//   @override
//   _MediaUploadPageState createState() => _MediaUploadPageState();
// }
//
// class _MediaUploadPageState extends State<MediaUploadPage> {
//   List<File> selectedPhotos = [];
//   List<File> selectedVideos = [];
//   List<Album> albums = [];
//
//   final ImagePicker _imagePicker = ImagePicker();
//
//   Future<void> _pickMedia(ImageSource source) async {
//     final List<XFile> pickedMedia = await _imagePicker.pickMultipleMedia();
//
//     if (pickedMedia != null) {
//       final albumName = "My Album"; // Change this to a default album name or select from a list
//       final album = albums.firstWhere((a) => a.name == albumName, orElse: () {
//         final newAlbum = Album(albumName, []);
//         albums.add(newAlbum);
//         return newAlbum;
//       });
//
//       setState(() {
//         for(XFile media in pickedMedia){
//           if (media.path.endsWith('.mp4')) {
//             album.media.add(File(media.path));
//           } else {
//             album.media.add(File(media.path));
//           }
//         }
//
//
//       });
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Media Upload Page'),
//       ),
//       body: Column(
//         children: <Widget>[
//           Expanded(
//             child: ListView.builder(
//               itemCount: albums.length,
//               itemBuilder: (context, index) {
//                 final album = albums[index];
//                 return ListTile(
//                   title: Text(album.name),
//                   subtitle: Text(
//                       'Photos: ${album.media.where((f) => f.path.endsWith('.jpg')).length}, Videos: ${album.media.where((f) => f.path.endsWith('.mp4')).length}'),
//                   // Add an onTap action to view media within the album
//                 );
//               },
//             ),
//           ),
//           ElevatedButton(
//             onPressed: () => _pickMedia(ImageSource.gallery),
//             child: Text('Choose Photo/Video from Gallery'),
//           ),
//           ElevatedButton(
//             onPressed: () => _pickMedia(ImageSource.camera),
//             child: Text('Take Photo/Video'),
//           ),
//           TextButton(
//             onPressed: () {
//               final albumName = "My New Album"; // Change this to a default album name
//               final album = albums.firstWhere((a) => a.name == albumName, orElse: () {
//                 final newAlbum = Album(albumName, []);
//                 albums.add(newAlbum);
//                 return newAlbum;
//               });
//
//               setState(() {});
//             },
//             child: Text('Add an Album'),
//           ),
//         ],
//       ),
//     );
//   }
// }
