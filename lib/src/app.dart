import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_image_view/src/widgets/image_list.dart';
import 'package:http/http.dart' show get;

import 'model/image_model.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int counter = 0;
  List<ImageModel> images = [];
  fetchImage() async{
    counter++;
    var uri = Uri.parse('https://jsonplaceholder.typicode.com/photos/$counter');
    var response = await get(uri);
    var imageModel = ImageModel.fromJson(json.decode(response.body));
    setState(() {
      images.add(imageModel);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Lets see some images!'),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: fetchImage,
          child: const Icon(Icons.add),
        ),
        body: Center(
          child: ImageList(images: images,),
        ),
      ),
    );
  }
}
