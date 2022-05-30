// import 'dart:io';
// import 'dart:async';

// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';

// class bodyPolls extends StatefulWidget {
//   const bodyPolls({Key? key}) : super(key: key);
//   @override
//   State<bodyPolls> createState() => _bodyPollsState();
// }

// class _bodyPollsState extends State<bodyPolls> {
//   //final _formKey = GlobalKey<FormState>();

//   String? inputTime = '';
//   String? inputPlace = '';
//   String? inputOccasion = '';
//   bool isImageUploaded = false;

//   XFile? _image;

//   void _setImageFileFromFile(XFile? value) {
//     _image = value != null ? value : null;
//   }

//   dynamic _pickImageError;
//   String? _retrieveDataError;

//   final ImagePicker _picker = ImagePicker();

//   Future<void> _onImageButtonPressed(ImageSource source,
//       {BuildContext? context}) async {
//     try {
//       final XFile? pickedFile = await _picker.pickImage(
//         source: source,
//         maxWidth: 650,
//         maxHeight: 350,
//       );
//       setState() {
//         _setImageFileFromFile(pickedFile);
//       }
//     } catch (e) {
//       setState(() {
//         _pickImageError = e;
//       });
//     }
//   }

//   Widget _previewImages() {
//     final Text? retrieveError = _getRetrieveErrorWidget();
//     if (retrieveError != null) {
//       return retrieveError;
//     }
//     print("IMAGE");
//     if (_image != null) {
//       print("IMAGE EXISTED");
//       return Container(
//         height: MediaQuery.of(context).size.width - 10,
//         width: MediaQuery.of(context).size.width - 10,
//         child: Image.file(File(_image!.path)),
//       );
//     } else if (_pickImageError != null) {
//       return Text(
//         'Pick image error: $_pickImageError',
//         textAlign: TextAlign.center,
//       );
//     } else {
//       return const Text(
//         'You have not yet picked an image.',
//         textAlign: TextAlign.center,
//       );
//     }
//   }

//   Future<void> retrieveLostData() async {
//     final LostDataResponse response = await _picker.retrieveLostData();
//     if (response.isEmpty) {
//       return;
//     }
//     if (response.file != null) {
//       setState(() {
//         if (response.files == null) {
//           _setImageFileFromFile(response.file);
//         } else {
//           _image = response.files![0];
//         }
//       });
//     } else {
//       _retrieveDataError = response.exception!.code;
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         elevation: 0,
//         title: Text(
//           'TPOSHARE',
//           style: TextStyle(
//             color: Colors.black,
//             fontWeight: FontWeight.bold,
//             fontSize: 20,
//           ),
//         ),
//       ),
//       body: Center(
//         child: FutureBuilder<void>(
//           future: retrieveLostData(),
//           builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
//             switch (snapshot.connectionState) {
//               case ConnectionState.none:
//               case ConnectionState.waiting:
//                 return const Text(
//                   'You have not yet picked an image.',
//                   textAlign: TextAlign.center,
//                 );
//               case ConnectionState.done:
//                 return _previewImages();
//               default:
//                 if (snapshot.hasError) {
//                   return Text(
//                     'Pick image/video error: ${snapshot.error}}',
//                     textAlign: TextAlign.center,
//                   );
//                 } else {
//                   return const Text(
//                     'You have not yet picked an image.....',
//                     textAlign: TextAlign.center,
//                   );
//                 }
//             }
//           },
//         ),
//       ),
//       floatingActionButton: Column(
//         mainAxisAlignment: MainAxisAlignment.end,
//         children: <Widget>[
//           Padding(
//             padding: const EdgeInsets.only(top: 1.0),
//             child: FloatingActionButton(
//               onPressed: () {
//                 _onImageButtonPressed(ImageSource.gallery, context: context);
//               },
//               heroTag: 'image0',
//               tooltip: 'Pick Image from gallery',
//               child: const Icon(Icons.photo),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.only(top: 16.0),
//             child: FloatingActionButton(
//               onPressed: () {
//                 _onImageButtonPressed(ImageSource.camera, context: context);
//               },
//               heroTag: 'image2',
//               tooltip: 'Take a Photo',
//               child: const Icon(Icons.camera_alt),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Text? _getRetrieveErrorWidget() {
//     if (_retrieveDataError != null) {
//       final Text result = Text(_retrieveDataError!);
//       _retrieveDataError = null;
//       return result;
//     }
//     return null;
//   }
// }

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class bodyPolls extends StatefulWidget {
  bodyPolls({Key? key}) : super(key: key);
  @override
  State<bodyPolls> createState() => _bodyPollsState();
}

class _bodyPollsState extends State<bodyPolls> {
  @override
  var userImage;

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'TPOSHARE',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.check_outlined, color: Colors.blue, size: 35),
            onPressed: () {
              print('Clicked');
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                border: Border.all(
                  color: Color.fromARGB(255, 220, 217, 217),
                  width: 3,
                ),
              ),
              height: MediaQuery.of(context).size.width - 10,
              width: MediaQuery.of(context).size.width - 10,
              child: userImage == null
                  ? Center(child: Text('No image'))
                  : Image.file(userImage),
            ),
            Container(
              width: MediaQuery.of(context).size.width - 10,
              margin: EdgeInsets.symmetric(horizontal: 10.0),
              height: 60,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.photo_album_outlined,
                      size: 40,
                      color: Colors.blue,
                    ),
                    onPressed: () async {
                      var picker = ImagePicker();
                      var image =
                          await picker.pickImage(source: ImageSource.gallery);
                      if (image != null) {
                        setState(() {
                          userImage = File(image.path);
                        });
                      } else {
                        setState(() {
                          userImage = null;
                        });
                      }
                    },
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.photo_camera_back,
                      size: 40,
                      color: Colors.blue,
                    ),
                    onPressed: () async {
                      var picker = ImagePicker();
                      var image =
                          await picker.pickImage(source: ImageSource.camera);
                      if (image != null) {
                        setState(() {
                          userImage = File(image.path);
                        });
                      } else {
                        setState(() {
                          userImage = null;
                        });
                      }
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
