import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:exam_demo_unsplash/pages/photo_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../models/collection_model.dart';
import '../models/search_response_model.dart';
import '../services/http_service.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  List<Result> results = [];

  searchPhotos(String text) async {
    var response =
        await Network.GET(Network.SEARCH_API, Network.paramsSearch(text));
    if (response != null) {
      setState(() {
        results = searchPhotosModelFromJson(response).results;
      });
    }
  }

  loadPhotos() async {
    var response = await Network.GET(Network.PHOTOS_API, Network.paramsEmpty());
    if (response != null) {
      setState(() {
        results = List<Result>.from(
            jsonDecode(response).map((x) => Result.fromJson(x)));
      });
    }
  }

  openPhotoDetails(PreviewPhoto photo) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (BuildContext context) {
      return PhotoDetailPage(
        photo: photo,
      );
    }));
  }

  @override
  void initState() {
    super.initState();
    loadPhotos();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title: Container(
          margin: EdgeInsets.symmetric(vertical: 10),
          padding: EdgeInsets.symmetric(horizontal: 10),
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white70,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(),
          ),
          child: TextField(
            decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: "Search images",
                icon: Icon(Icons.search)),
            onChanged: (text) {
              setState(() {
                searchPhotos(text);
              });
            },
          ),
        ),
      ),
      body: Container(
        child: GridView.custom(
          gridDelegate: SliverQuiltedGridDelegate(
            crossAxisCount: 4,
            mainAxisSpacing: 4,
            crossAxisSpacing: 4,
            repeatPattern: QuiltedGridRepeatPattern.inverted,
            pattern: [
              QuiltedGridTile(2, 2),
              QuiltedGridTile(1, 1),
              QuiltedGridTile(1, 1),
              QuiltedGridTile(1, 2),
            ],
          ),
          childrenDelegate: SliverChildBuilderDelegate(
            childCount: results.length,
            (context, index) => Container(
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(10)),
                child: index < results.length - 1
                    ? _resultItem(results[index])
                    : Container()),
          ),
        ),
      ),
    );
  }

  Widget _resultItem(Result result) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
      child: GestureDetector(
        onTap: () {
          openPhotoDetails(getPreviewPhoto(result));
        },
        child: CachedNetworkImage(
          imageUrl: result.urls.regular,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
