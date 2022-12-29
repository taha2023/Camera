import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

void main() {
  runApp( MaterialApp(
    title: "Camera App",
    home: LandingScreen(),

  ));
}

class LandingScreen extends StatefulWidget {

  @override
  _LandingScreenState createState() => _LandingScreenState();

}
class _LandingScreenState extends State<LandingScreen> {
    File? imageFile;

  _openGallary(BuildContext context) async {
    var picture = await ImagePicker().pickImage(source: ImageSource.gallery);
    this.setState(() {
      imageFile = picture as File;
    });
    Navigator.of(context).pop();
  }

  _openCamera(BuildContext context) async {
    final ImagePicker _picker = ImagePicker();
                            final XFile? image = await _picker.pickImage(
                                source: ImageSource.gallery, imageQuality: 50);
                           imageFile= File(image!.path);
   // var picture = await ImagePicker().pickImage(source: Imag؟؟
    Navigator.of(context).pop();
  }

  Future<void> _showChoiceDialog(BuildContext context) {
    return showDialog(context: context, builder: (BuildContext context) {
      return AlertDialog(
        title: Text("Make a choice"),
        content: SingleChildScrollView(
          child: ListBody(
              children: <Widget>[
                GestureDetector(
                  child: Text("Gallary"),
                  onTap: () {
                    _openGallary(context);
                  },
                ),
                Padding(padding: EdgeInsets.all(8.0)),
                GestureDetector(
                  child: Text("Camera"),
                  onTap: () {
                    _openCamera(context);
                  },
                ),
              ]
          ),
        ),
      );
    });
  }

  _decideImageView() {
    return imageFile == null ? Text("No Image selected"): Image.file(imageFile!, width: 400, height: 400);

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Main Screen"),
        backgroundColor: Colors.black,
      ),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
             if(imageFile!=null) Image.file(imageFile!, width: 400, height: 400),
              Text("No Image Selected"),
              _decideImageView(),
              ElevatedButton(onPressed: () {
                _showChoiceDialog(context);
              }, child: Text("select Image"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
  