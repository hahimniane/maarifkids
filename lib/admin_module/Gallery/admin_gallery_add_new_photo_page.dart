import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../contants.dart';
import '../../utils/custom_nav_bar.dart';
import '../../menu_page.dart';
import '../../test_page.dart';
import '../exercise.dart';

class Album {
  String name;
  List<File> media = [];

  Album(this.name);
}

class AddNewPhotoPage extends StatefulWidget {
  @override
  _AddNewPhotoPageState createState() => _AddNewPhotoPageState();
}

class _AddNewPhotoPageState extends State<AddNewPhotoPage> {
  List<File> selectedPhotos = [];
  List<File> selectedVideos = [];
  List<Album> albums = [];
  bool isAddingAlbum = false; // Track whether the album name field is visible

  final ImagePicker _imagePicker = ImagePicker();
  final TextEditingController albumNameController = TextEditingController();

  void _pickMediaForAlbum(int albumIndex) async {
    final pickedMedia = await _imagePicker.pickMultipleMedia();

    setState(() {
      final album = albums[albumIndex];
      album.media.clear();

      for (var media in pickedMedia) {
        if (media.path.endsWith('.mp4')) {
          album.media.add(File(media.path));
        } else {
          album.media.add(File(media.path));
        }
      }
    });
  }

  void _addAlbum() {
    setState(() {
      isAddingAlbum = true; // Show the album name field
    });
  }

  void _saveAlbum() {
    final albumName = albumNameController.text.trim();
    if (albumName.isNotEmpty) {
      albums.add(Album(albumName));
      albumNameController.clear();
      setState(() {
        isAddingAlbum = false; // Hide the album name field
      });
    }
  }

  void _deleteAlbum(int index) {
    setState(() {
      albums.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
        title: 'Gallery',
        context: context,
        isFromSearch: false,
        isAdminColor: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
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
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AddNewPhotoPage()));
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
                            style:
                                TextStyle(color: adminAppColor, fontSize: 10),
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
          SizedBox(height: 8), // Adjust the spacing as needed
          Expanded(
            child: ListView.builder(
              itemCount: albums.length,
              itemBuilder: (context, index) {
                final album = albums[index];
                final photoCount =
                    album.media.where((f) => f.path.endsWith('.jpg')).length;
                final videoCount =
                    album.media.where((f) => f.path.endsWith('.mp4')).length;
                return GestureDetector(
                  onTap: () {
                    _pickMediaForAlbum(index);
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(36),
                    child: Card(
                      elevation: 4,
                      color: adminAppColor,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          photoCount == 0 && videoCount == 0
                              ? Text(
                                  textAlign: TextAlign.center,
                                  'UPLOAD',
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w700),
                                )
                              : Container(),
                          photoCount != 0 || videoCount != 0
                              ? Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Column(
                                      children: [
                                        Text(
                                          album.name,
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Icon(
                                          Icons.photo_library,
                                          color: Colors.white,
                                          size: 80,
                                        ),
                                      ],
                                    ),
                                    Text(
                                      '${photoCount} Photos/ \n ${videoCount} video uploaded',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    IconButton(
                                      icon: Icon(Icons.delete),
                                      onPressed: () {
                                        _deleteAlbum(index);
                                      },
                                    )
                                  ],
                                )
                              : Icon(
                                  Icons.photo_library,
                                  color: Colors.white,
                                  size: 80,
                                ),
                        ],
                      ),
                      // Column(
                      //   crossAxisAlignment: CrossAxisAlignment.center,
                      //   children: [
                      //     ListTile(
                      //       title: Text(album.name,style: TextStyle(
                      //     color: Colors.white,fontWeight: FontWeight.w600
                      // ),),
                      //       subtitle: Text('Photos: $photoCount, Videos: $videoCount',style: TextStyle(
                      //         color: Colors.white,fontWeight: FontWeight.w600
                      //       ),),
                      //       trailing: IconButton(
                      //         icon: Icon(Icons.delete,color: Colors.white,),
                      //         onPressed: () => _deleteAlbum(index),
                      //       ),
                      //     ),
                      //     Padding(
                      //       padding: const EdgeInsets.all(16),
                      //       child: Row(
                      //         children: [
                      //           ElevatedButton(
                      //             onPressed: () => _pickMediaForAlbum(index),
                      //             child: Text('Add Media',style: TextStyle(
                      //               color: adminAppColor,fontWeight: FontWeight.bold
                      //             ),),
                      //           ),
                      //           Spacer(),
                      //           // Add a button here to view media within the album if needed
                      //         ],
                      //       ),
                      //     ),
                      //   ],
                      // ),
                    ),
                  ),
                );
              },
            ),
          ),
          Visibility(
            visible: isAddingAlbum,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: TextField(
                controller: albumNameController,
                decoration: InputDecoration(
                  hintText: 'Album Name',
                  labelText: 'New Album',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          GestureDetector(
            onTap: isAddingAlbum ? _saveAlbum : _addAlbum,
            child: Column(
              children: [
                Icon(
                  // height: 30,
                  // width: 30,

                  Icons.camera_alt_rounded,
                  color: adminAppColor,
                ),
                Text(
                  isAddingAlbum ? 'Save Album' : 'Add Album',
                  style: TextStyle(
                      color: adminAppColor,
                      decoration: TextDecoration.underline,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          // Padding(
          //   padding: const EdgeInsets.symmetric(horizontal: 16),
          //   child: ElevatedButton(
          //     onPressed: isAddingAlbum ? _saveAlbum : _addAlbum, // Toggle between adding and saving album
          //     child: Text(isAddingAlbum ? 'Save Album' : 'Add Album'),
          //   ),
          // ),
          SizedBox(height: 16), // Add spacing at the bottom
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

  @override
  void initState() {
    super.initState();
    albums.add(Album('Album'));
  }
}
