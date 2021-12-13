import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RecipesWidget extends StatefulWidget {
  final String? image;
  final String? title;
  final String? summary;
  final int? aggregateLikes;
  final int? readyInMinutes;
  final bool? vegan;

  const RecipesWidget(
      {Key? key,
      this.image,
      this.title,
      this.summary,
      this.aggregateLikes,
      this.readyInMinutes,
      this.vegan})
      : super(key: key);

  @override
  _RecipesWidgetState createState() => _RecipesWidgetState();
}

class _RecipesWidgetState extends State<RecipesWidget> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        children: [
          Flexible(
            child: Image.network(widget.image!),
          ),
          const SizedBox(width: 10),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(widget.title!,
                    style: const TextStyle(fontWeight: FontWeight.bold)),
                const SizedBox(height: 15),
                Text(
                  widget.summary!,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        const Icon(
                          CupertinoIcons.heart_circle,
                          color: Colors.red,
                        ),
                        Text(
                          widget.aggregateLikes.toString(),
                          style: const TextStyle(
                            fontSize: 10,
                            color: Colors.red,
                          ),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        Icon(
                          CupertinoIcons.clock,
                          color: Colors.yellow.shade600,
                        ),
                        Text(
                          widget.readyInMinutes.toString(),
                          style: TextStyle(
                              fontSize: 10, color: Colors.yellow.shade600),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Icon(
                          CupertinoIcons.leaf_arrow_circlepath,
                          color: widget.vegan! ? Colors.green : Colors.grey,
                        ),
                        Text(
                          "Vegan",
                          style: TextStyle(
                            fontSize: 10,
                            color: widget.vegan! ? Colors.green : Colors.grey,
                          ),
                        )
                      ],
                    )
                  ],
                ),
                const SizedBox(
                  height: 5,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
