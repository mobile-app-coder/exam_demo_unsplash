import 'package:cached_network_image/cached_network_image.dart';
import 'package:exam_demo_unsplash/models/search_photos_model.dart';
import 'package:exam_demo_unsplash/services/log.dart';
import 'package:exam_demo_unsplash/services/network.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<ImageModel> images = List.empty(growable: true);
  SearchPhotosModel? model;

  loadPhotos() async {
    var response =
        await Network.GET(Network.SEARCH_API, Network.paramsToGet("lion"));

    if (response != null) {
      LogService.i(images[1].urls.full);
      model = searchPhotosModelFromJson(response);
      images = model!.results;
    }
  }

  void initState() {
    // TODO: implement initState
    super.initState();
    loadPhotos();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Search"),
        ),
        body:
        Container(
          child: ListView.builder(
            itemCount: images.length,
            itemBuilder: (context, index) {
              return photoView();
            },
          ),
        )


        );
  }

  Widget photoView() {
    return Container(
      child: CachedNetworkImage(
        imageUrl:
            "https://images.unsplash.com/photo-1570264013623-796051486fc6?ixlib=rb-4.0.3",
      ),
    );
  }
}
