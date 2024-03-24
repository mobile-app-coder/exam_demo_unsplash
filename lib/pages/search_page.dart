import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:exam_demo_unsplash/pages/photo_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:lottie/lottie.dart';

import '../models/collection_model.dart';
import '../models/search_response_model.dart';
import '../services/http_service.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  bool _isLoading = true;
  List<Result> results = [];

  searchPhotos(String text) async {
    _isLoading = true;
    var response =
        await Network.GET(Network.SEARCH_API, Network.paramsSearch(text));
    if (response != null) {
      setState(() {
        results = searchPhotosModelFromJson(response).results;
      });
    }
    _isLoading = false;
  }

  loadPhotos() async {
    var response = await Network.GET(Network.PHOTOS_API, Network.paramsEmpty());
    if (response != null) {
      setState(() {
        results = List<Result>.from(
            jsonDecode(response).map((x) => Result.fromJson(x)));
      });
    }
    _isLoading = false;
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
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Container(
          height: 48,
          margin: EdgeInsets.symmetric(vertical: 10),
          padding: EdgeInsets.symmetric(horizontal: 10),
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white12,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(),
          ),
          child: TextField(
            style: const TextStyle(color: Colors.white),
            decoration: const InputDecoration(
                border: InputBorder.none,
                hintStyle: TextStyle(color: Colors.white),
                hintText: "Search photos, collections, users",
                labelStyle: TextStyle(color: Colors.white),
                icon: Icon(
                  Icons.search,
                  color: Colors.white,
                )),
            onSubmitted: (text) {
              setState(() {
                searchPhotos(text);
              });
            },
          ),
        ),
      ),
      body: _isLoading
          ? Center(child: Lottie.asset("assets/animations/loading.json"))
          :

          // Container(
          //         child: MasonryGridView.count(
          //         itemCount: results.length,
          //         crossAxisCount: 2,
          //         mainAxisSpacing: 4,
          //         crossAxisSpacing: 4,
          //         itemBuilder: (context, index) {
          //           return _resultItem(results[index]);
          //         },
          //       )
          GridView.custom(
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
    );
  }

  Widget _resultItem(Result result) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
      child: GestureDetector(
        onTap: () {
          openPhotoDetails(getPreviewPhoto(result));
        },
        child: Stack(fit: StackFit.expand, children: [
          CachedNetworkImage(
            imageUrl: result.urls.regular,
            fit: BoxFit.cover,
          ),
          Container(
            margin: EdgeInsets.all(5),
            alignment: Alignment.bottomLeft,
            child: Text(
              result.user.name,
              style: TextStyle(color: Colors.white),
            ),
          )
        ]),
      ),
    );
  }
}
