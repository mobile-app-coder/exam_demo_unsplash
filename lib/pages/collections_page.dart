import 'package:cached_network_image/cached_network_image.dart';
import 'package:exam_demo_unsplash/models/collection_model.dart';
import 'package:exam_demo_unsplash/pages/collection_details_page.dart';
import 'package:exam_demo_unsplash/services/network.dart';
import 'package:flutter/material.dart';

class CollectionPage extends StatefulWidget {
  const CollectionPage({super.key});

  @override
  State<CollectionPage> createState() => _CollectionPageState();
}

class _CollectionPageState extends State<CollectionPage> {
  bool _isLoading = false;
  List<CollectionModel> collections = [];

  loadCollection() async {
    var response = await Network.GET(
        Network.COLLECTIONS_API, Network.paramsGetCollection());
    if (response != null) {
      setState(() {
        collections = collectionModelFromMap(response);
      });
    }
    setState(() {
      _isLoading = true;
    });
  }

  @override
  void initState() {
    super.initState();
    loadCollection();
  }

  _openCollectionDetails(CollectionModel collectionModel) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (BuildContext context) {
      return CollectionDetailsPage(model: collectionModel);
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title: Text(
          "Collections",
          style: TextStyle(color: Colors.white70),
        ),
      ),
      body: _isLoading
          ? ListView.builder(
              itemCount: collections.length,
              itemBuilder: (context, index) {
                return _collectionItem(collections[index]);
              })
          : const Center(
              child: CircularProgressIndicator(),
            ),
    );
  }

  Widget _collectionItem(CollectionModel collectionModel) {
    return GestureDetector(
      onTap: () {
        _openCollectionDetails(collectionModel);
      },
      child: SizedBox(
        child: AspectRatio(
          aspectRatio: collectionModel.coverPhoto.width /
              collectionModel.coverPhoto.height,
          child: Stack(
            children: [
              CachedNetworkImage(imageUrl: collectionModel.coverPhoto.urls.raw),
              Container(
                padding: EdgeInsets.all(10),
                alignment: Alignment.bottomLeft,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.bottomLeft,
                      end: Alignment(-0.5, -0.5),
                      colors: <Color>[
                        Colors.black,
                        Colors.transparent,
                      ]),
                ),
                child: Text(
                  collectionModel.title,
                  style: TextStyle(color: Colors.white, fontSize: 30),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
