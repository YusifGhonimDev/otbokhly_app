import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:otbokhly_app/constants/constants.dart';
import 'package:otbokhly_app/models/image_analysis_model.dart';
import 'package:otbokhly_app/widgets/details/instructions_widget.dart';
import 'package:percent_indicator/percent_indicator.dart';

class AnalaysisWidget extends StatelessWidget {
  final ImageAnalysisModel? model;
  final File? image;

  const AnalaysisWidget({Key? key, this.model, this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Image.file(
          image!,
        ),
        const SizedBox(height: 30),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
          child: Center(
            child: Text(
              "This is a ${model!.category!.name!}",
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
            ),
          ),
        ),
        const SizedBox(height: 30),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const Text("Probability",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
            const SizedBox(width: 10),
            CircularPercentIndicator(
              animation: true,
              animationDuration: 1000,
              radius: 80,
              percent: model!.category!.probability!.toDouble(),
              progressColor: Colors.orange,
              backgroundColor: Colors.orange.shade100,
              circularStrokeCap: CircularStrokeCap.butt,
              center: Text("${(model!.category!.probability! * 100).round()}%",
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 20)),
            ),
          ],
        ),
        const SizedBox(height: 30),
        buildNutrition(model!.nutrition!.calories!.value!.toInt(), "Calories"),
        const SizedBox(height: 30),
        buildNutrition(model!.nutrition!.fat!.value!.toInt(), "Fat"),
        const SizedBox(height: 30),
        buildNutrition(model!.nutrition!.protein!.value!.toInt(), "Protein"),
        const SizedBox(height: 30),
        buildNutrition(model!.nutrition!.carbs!.value!.toInt(), "Carbs"),
        const SizedBox(height: 30),
        const Center(
          child: Text("Recommended recipes",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25)),
        ),
        const SizedBox(height: 30),
        ListView.builder(
          shrinkWrap: true,
          physics: const ScrollPhysics(),
          itemCount: model!.recipes!.length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => RecommendedInstructionsWidget(
                              url: model!.recipes![index].url,
                            )));
              },
              child: Card(
                child: Row(
                  children: [
                    const SizedBox(width: 10),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: CircleAvatar(
                        radius: 50,
                        backgroundImage: NetworkImage(
                            "$recipeImageEndPoint/${model!.recipes![index].id}-$recipeImageSize.${model!.recipes![index].imageType}"),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        "${model!.recipes![index].title}",
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15),
                      ),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            );
          },
        ),
      ],
    );
  }

  Widget buildNutrition(data, title) {
    return Card(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(title, style: const TextStyle(fontSize: 20)),
          const SizedBox(width: 10),
          Text(data.toString(), style: const TextStyle(fontSize: 20)),
        ],
      ),
    );
  }
}
