import 'dart:io';
import 'package:flutter/material.dart';
import 'package:otbokhly_app/api/spoonacular_api.dart';
import 'package:otbokhly_app/models/image_analysis_model.dart';
import 'package:otbokhly_app/widgets/analysis_widget.dart';
import 'package:otbokhly_app/widgets/loading_widget.dart';

class ResultsScreen extends StatefulWidget {
  final String? url;
  final File? image;

  const ResultsScreen({Key? key, this.url, this.image}) : super(key: key);

  @override
  State<ResultsScreen> createState() => _ResultsScreenState();
}

class _ResultsScreenState extends State<ResultsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          "Results",
          style: TextStyle(color: Colors.orange),
        ),
        iconTheme: const IconThemeData(color: Colors.orange),
      ),
      body: FutureBuilder(
        future: SpoonacularAPI().analyzeImage(widget.url),
        builder: (context, AsyncSnapshot snapshot) {
          if (!snapshot.hasData) {
            return const LoadingWidget();
          } else {
            return AnalaysisWidget(
              model: ImageAnalysisModel.fromJson(snapshot.data),
              image: widget.image,
            );
          }
        },
      ),
    );
  }
}
