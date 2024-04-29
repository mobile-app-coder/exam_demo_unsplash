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
  ScrollController controller = ScrollController();
  int _currentPage = 1;
  int _currentSPage = 1;
  bool _isLoading = true;
  String query = "";
  List<Result> results = [];

  searchPhotos(String text) async {
    _isLoading = true;
    var response =
        await Network.GET(Network.SEARCH_API, Network.paramsSearch(text,_currentSPage ));
    if (response != null) {
      setState(() {
        if(_currentSPage == 1){
          results = searchPhotosModelFromJson(response).results;
        }else{
          results.addAll(searchPhotosModelFromJson(response).results);
        }
      });
    }
    _isLoading = false;
  }

  loadPhotos() async {
    var response = await Network.GET(
        Network.PHOTOS_API, Network.paramsEmpty(_currentPage));
    if (response != null) {
      setState(() {
        var list = List<Result>.from(
            jsonDecode(response).map((x) => Result.fromJson(x)));
        results.addAll(list);
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
    controller.addListener(() {
      if (controller.position.maxScrollExtent <= controller.offset) {
        if(query.isEmpty){
          _currentPage++;
          loadPhotos();
        }else{
          searchPhotos(query);
          _currentSPage++;
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        toolbarHeight: 70,
        backgroundColor: Colors.black,
        title: Container(
          height: 48,
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
              query = text;
              setState(() {
                searchPhotos(text);
              });
            },
          ),
        ),
      ),
      body: _isLoading
          ? Center(child: Lottie.asset("assets/animations/loading.json"))
          : GridView.custom(
              controller: controller,
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
            memCacheHeight: result.height ~/ 10,
            memCacheWidth: result.width ~/ 10,
            imageUrl: result.urls.regular,
            fit: BoxFit.cover,
          ),
          Container(
            margin: EdgeInsets.all(5),
            alignment: Alignment.bottomLeft,
            child: Text(
              result.user.name,
              maxLines: 1,
              style: const TextStyle(
                color: Colors.white,
              ),
            ),
          )
        ]),
      ),
    );
  }
}
