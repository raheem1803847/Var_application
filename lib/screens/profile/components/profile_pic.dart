import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';

class ProfilePic extends StatefulWidget {
  const ProfilePic({
    Key? key,
  }) : super(key: key);

  @override
  _ProfilePicState createState() => _ProfilePicState();
}

class _ProfilePicState extends State<ProfilePic> {
  File? _imageFile;
  final ImagePicker _picker = ImagePicker();
  Widget build(BuildContext context) {
    return SizedBox(
      height: 115,
      width: 115,
      child: Stack(
        fit: StackFit.expand,
        clipBehavior: Clip.none,
        children: [
          CircleAvatar(
            backgroundImage: _imageFile == null
                ? AssetImage("assets/images/profile.jfif")
                : FileImage(File(_imageFile!.path)) as ImageProvider,
          ),
          Positioned(
            right: -16,
            bottom: 0,
            child: SizedBox(
              height: 46,
              width: 46,
              child: TextButton(
                style: TextButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                    side: BorderSide(color: Colors.white),
                  ),
                  primary: Colors.white,
                  backgroundColor: Color(0xFFF5F6F9),
                ),
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    builder: ((builder) => bottomsheet()),
                  );
                },
                child: SvgPicture.asset("assets/icons/Camera Icon.svg"),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget bottomsheet() {
    return Container(
      height: 100.0,
      width: 100.0,
      margin: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20,
      ),
      child: Column(
        children: <Widget>[
          Text(
            "choose profile photo",
            style: TextStyle(fontSize: 20.0),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ElevatedButton.icon(
                  icon: Icon(Icons.camera),
                  onPressed: () {
                    takephoto(ImageSource.camera);
                  },
                  label: Text("Camera")),
              ElevatedButton.icon(
                  icon: Icon(Icons.image),
                  onPressed: () {
                    takephoto(ImageSource.gallery);
                  },
                  label: Text("Gallery")),
            ],
          )
        ],
      ),
    );
  }

  Future takephoto(ImageSource source) async {
    final pickedFile = await _picker.pickImage(
      source: source,
    );
    if (pickedFile == null) return;
    final imagetemporary = File(pickedFile.path);
    setState(() => this._imageFile = imagetemporary);
  }
}
