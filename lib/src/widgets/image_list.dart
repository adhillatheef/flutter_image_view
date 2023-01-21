import 'package:flutter/material.dart';

import '../model/image_model.dart';

class ImageList extends StatelessWidget {
  final List<ImageModel> images;
  const  ImageList({required this.images, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: images.length,
        itemBuilder: (context,int index) {
          return Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey)
            ),
            padding: const EdgeInsets.all(20),
            margin: const EdgeInsets.all(20),
            child: Column(
              children: [
                Image(image: NetworkImage(images[index].url!)),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(images[index].title!),
                )
              ],
            ),
          );
    });
  }
}
