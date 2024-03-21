import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../models/search_response_model.dart';
import '../services/network.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  List<Result> results = [];
  bool _isLoading = true;

  loadPhotos(String text) async {
    var response =
        await Network.GET(Network.SEARCH_API, Network.paramsSearch(text));
    if (response != null) {
      setState(() {
        results = searchPhotosModelFromJson(response).results;
      });
    }
    _isLoading = false;
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
            decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "Search images",
                icon: Icon(Icons.search)),
            onChanged: (text) {
              setState(() {
                loadPhotos(text);
              });
            },
          ),
        ),
      ),
      body: _isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Container(
              child: ListView.builder(
                itemCount: results.length,
                itemBuilder: (context, index) {
                  return _resultItem(results[index]);
                },

              ),
            ),
    );
  }

  Widget _resultItem(Result result) {
    return Container(
      child: CachedNetworkImage(
        imageUrl: result.urls.raw,
      ),
    );
  }
}
