import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:otbokhly_app/screens/results_screen.dart';
import 'package:path/path.dart';

class FoodAnalyzerScreen extends StatefulWidget {
  const FoodAnalyzerScreen({Key? key}) : super(key: key);

  @override
  _FoodAnalyzerScreenState createState() => _FoodAnalyzerScreenState();
}

class _FoodAnalyzerScreenState extends State<FoodAnalyzerScreen> {
  File? image;
  String? imageName;
  String? url;

  Future getImageGallery() async {
    XFile? selectedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    setState(() {
      image = File(selectedImage!.path);
      imageName = basename(image!.path);
    });
  }

  Future getImageCamera() async {
    XFile? selectedImage =
        await ImagePicker().pickImage(source: ImageSource.camera);
    setState(() {
      image = File(selectedImage!.path);
      imageName = basename(image!.path);
    });
  }

  Future<String> uploadImage() async {
    Reference ref = FirebaseStorage.instance.ref().child(imageName!);
    UploadTask uploadTask = ref.putFile(image!);
    String downUrl = await (await uploadTask).ref.getDownloadURL();
    String url = downUrl.toString();
    return url;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          "Food Analyzer",
          style: TextStyle(
            color: Colors.orange,
          ),
        ),
      ),
      body: Center(
        child: image == null
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Please select an image to analyze it."),
                  const SizedBox(height: 30),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.width * 0.15),
                    child: MaterialButton(
                      color: Colors.orange,
                      onPressed: () => getImageGallery(),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(
                            Icons.image,
                            color: Colors.white,
                          ),
                          SizedBox(width: 10),
                          Text(
                            "Pick image from gallery",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.width * 0.15),
                    child: MaterialButton(
                      color: Colors.orange,
                      onPressed: () => getImageCamera(),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(
                            Icons.camera_alt,
                            color: Colors.white,
                          ),
                          SizedBox(width: 10),
                          Text(
                            "Pick image from camera",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              )
            : buildUpload(context),
      ),
    );
  }

  Widget buildUpload(context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(
          backgroundImage: FileImage(image!),
          radius: 100,
        ),
        const SizedBox(height: 30),
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.35),
          child: MaterialButton(
            color: Colors.orange,
            onPressed: () async {
              ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Uploading! Please wait...")));
              url = await uploadImage();
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultsScreen(
                    url: url,
                    image: image,
                  ),
                ),
              );
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(
                  Icons.upload,
                  color: Colors.white,
                ),
                SizedBox(width: 5),
                Text(
                  "Upload",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
