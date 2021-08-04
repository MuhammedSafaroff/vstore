import 'dart:io';
import 'dart:math';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:vstore_appl/data/services/my_firebase_auth.dart';
import 'package:vstore_appl/main.dart';
import 'package:vstore_appl/presentation/dialogs/dialog_platform.dart';
import 'package:vstore_appl/presentation/dialogs/progress_dialog.dart';
import 'package:vstore_appl/constants/statics.dart';
import '../../../data/models/profile_model.dart';
import '../../widgets/my_custom_button.dart';

class ProfileEdit extends StatefulWidget {
  ProfileEdit({Key key, this.data}) : super(key: key);
  final ProfileModel data;

  @override
  _ProfileEditState createState() => _ProfileEditState();
}

class _ProfileEditState extends State<ProfileEdit> {
  bool enabled = false;
  String gender;
  TextEditingController fullNameController;
  TextEditingController emailController;
  TextEditingController telNoController;
  Size size;
  double screenHeight;
  String imageUrl;
  //
  PickedFile image;
  var file;
  String imageNameUrl;
  bool loading = false;
  @override
  void initState() {
    fullNameController = TextEditingController(text: widget.data.fullName);
    emailController = TextEditingController(text: widget.data.email);
    telNoController = TextEditingController(text: widget.data.phoneNumber);
    gender = widget.data.gender;
    imageUrl = widget.data.photeUrl;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    screenHeight = size.height;
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Settings',
          style: TextStyle(fontSize: 18, color: Color(0xff121624)),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_rounded,
            color: Color(0xff121624),
          ),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Theme(
          data: ThemeData(primaryColor: backgroundColor),
          child: Container(
            padding: EdgeInsets.only(bottom: 20, left: 17, right: 17),
            child: Form(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: screenHeight * 0.035),
                  Stack(
                    children: [
                      CircleAvatar(
                        backgroundImage: file != null
                            ? FileImage(file)
                            : NetworkImage(imageUrl) as ImageProvider,
                        radius: 60,
                        backgroundColor: Colors.transparent,
                      ),
                      Positioned(
                        child: InkWell(
                          borderRadius: BorderRadius.circular(100),
                          onTap: enabled
                              ? () {
                                  permissionAndSelectImage(context);
                                }
                              : null,
                          child: Container(
                              padding: EdgeInsets.all(6),
                              decoration: BoxDecoration(
                                  color: backgroundColor,
                                  shape: BoxShape.circle),
                              child: Icon(CupertinoIcons.camera_fill,
                                  size: 20, color: Colors.white)),
                        ),
                        right: 6,
                        bottom: 6,
                      )
                    ],
                  ),
                  SizedBox(height: screenHeight * 0.03),
                  TextFormField(
                    enabled: enabled,
                    controller: fullNameController,
                    cursorColor: backgroundColor,
                    style: TextStyle(fontSize: 16),
                    decoration: InputDecoration(
                      prefixIcon:
                          Icon(CupertinoIcons.person, color: backgroundColor),
                      labelStyle: TextStyle(color: backgroundColor),
                      filled: true,
                      labelText: 'Ad Soyad',
                      fillColor: enabled ? Colors.white : Color(0xFFF2F1ED),
                      disabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0),
                        borderSide: BorderSide(
                          color: backgroundColor,
                          width: 1.0,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0),
                        borderSide: BorderSide(
                          color: backgroundColor,
                          width: 1.0,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0),
                        borderSide: BorderSide(
                          color: backgroundColor,
                          width: 1.0,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.03),
                  TextFormField(
                    enabled: false,
                    controller: emailController,
                    cursorColor: backgroundColor,
                    style: TextStyle(fontSize: 16),
                    decoration: InputDecoration(
                      prefixIcon:
                          Icon(CupertinoIcons.at, color: backgroundColor),
                      labelStyle: TextStyle(color: backgroundColor),
                      filled: true,
                      labelText: 'Email',
                      fillColor: Color(0xFFF2F1ED),
                      disabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0),
                        borderSide: BorderSide(
                          color: backgroundColor,
                          width: 1.0,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.03),
                  TextFormField(
                    enabled: enabled,
                    controller: telNoController,
                    cursorColor: backgroundColor,
                    keyboardType: TextInputType.phone,
                    style: TextStyle(fontSize: 16),
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        CupertinoIcons.phone,
                        color: backgroundColor,
                      ),
                      labelStyle: TextStyle(color: backgroundColor),
                      filled: true,
                      labelText: 'Telefon',
                      fillColor: enabled ? Colors.white : Color(0xFFF2F1ED),
                      disabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0),
                        borderSide: BorderSide(
                          color: backgroundColor,
                          width: 1.0,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0),
                        borderSide: BorderSide(
                          color: backgroundColor,
                          width: 1.0,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0),
                        borderSide: BorderSide(
                          color: backgroundColor,
                          width: 1.0,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.03),
                  Container(
                    height: 58,
                    width: MediaQuery.of(context).size.width - 34,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: enabled
                              ? () {
                                  setState(() {
                                    gender = "male";
                                  });
                                }
                              : null,
                          child: Container(
                            width: MediaQuery.of(context).size.width / 2 - 36,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                  color: gender == 'male'
                                      ? Colors.blueAccent
                                      : Colors.grey[300],
                                  width: 2),
                            ),
                            height: 54,
                            child: Text(
                              'Male',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w600),
                            ),
                            alignment: Alignment.center,
                          ),
                        ),
                        GestureDetector(
                          onTap: enabled
                              ? () {
                                  setState(() {
                                    gender = "female";
                                  });
                                }
                              : null,
                          child: Container(
                            width: MediaQuery.of(context).size.width / 2 - 36,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                  color: gender == 'female'
                                      ? Colors.pinkAccent
                                      : Colors.grey[300],
                                  width: 2),
                            ),
                            height: 54,
                            child: Text(
                              'Female',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w600),
                            ),
                            alignment: Alignment.center,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.065),
                  MyCustomButton(
                    backColor: enabled ? 0xFF03D36F : 0xFFdd0d4b,
                    title: enabled ? 'Yadda saxla' : 'Hesab məlumatların dəyiş',
                    textColor: enabled ? 0xff000000 : 0xfffffffff,
                    onTap: () async {
                      setState(() {
                        enabled = !enabled;
                      });

                      if (!enabled) {
                        if (image != null) {
                          uploadImage();
                        } else {
                          var a = MyFireBaseAuth().myProfileUpdate(ProfileModel(
                              fullName: fullNameController.text,
                              gender: gender,
                              phoneNumber: telNoController.text,
                              token: widget.data.token,
                              photeUrl: imageUrl));
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => MyApp(
                                index: 3,
                                name: 'profile',
                              ),
                            ),
                          );
                        }
                      }
                    },
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // select image

  Future permissionAndSelectImage(BuildContext context) async {
    final _picker = ImagePicker();

    await Permission.photos.request();
    var permissionStatus = await Permission.photos.status;

    if (permissionStatus.isGranted) {
      image = await _picker.getImage(source: ImageSource.gallery);
      if (image != null)
        setState(() {
          file = File(image.path);
        });
    } else {
      DialogPlatformCtrl(
        title: 'Denied',
        myContent: Text('Permission Denied!'),
        context: context,
        yesButton: 'OK',
        yesButtonFun: () {
          Navigator.of(context).pop();
        },
      ).platformCtrlDialog();
    }
  }

  //upload
  uploadImage() async {
    BuildContext myContext =
        ProgressAlertDialog(context).showProgressAlertDialog();
    var _storage = FirebaseStorage.instance;
    int number1 = Random().nextInt(1000000);
    int number2 = Random().nextInt(1000000);
    int number3 = Random().nextInt(1000000);
    String name = "ProfileImage$number1$number2$number3";

    var snapshot = await _storage
        .ref()
        .child(widget.data.token + '/' + name)
        .putFile(file)
        .whenComplete(() {
      setState(() {
        loading = true;
      });
    });

    imageNameUrl = await snapshot.ref.getDownloadURL();

    if (imageNameUrl != null) {
      var a = await MyFireBaseAuth().myProfileUpdate(ProfileModel(
          fullName: fullNameController.text,
          gender: gender,
          phoneNumber: telNoController.text,
          token: widget.data.token,
          photeUrl: imageNameUrl));
      if (imageUrl !=
          'https://firebasestorage.googleapis.com/v0/b/vstore-7528c.appspot.com/o/defaultImage%2Fprofile_image.jpg?alt=media&token=ee78e9a0-2703-404f-a8f4-82f15964a2da') {
        Reference ref = await FirebaseStorage.instance.refFromURL(imageUrl);
        await ref.delete();
      }
      Navigator.of(myContext, rootNavigator: false).pop();
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => MyApp(
            index: 3,
            name: 'profile',
          ),
        ),
      );
    }
  }
}
