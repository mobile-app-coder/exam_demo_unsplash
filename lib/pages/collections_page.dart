import 'package:cached_network_image/cached_network_image.dart';
import 'package:exam_demo_unsplash/models/collection_model.dart';
import 'package:exam_demo_unsplash/pages/collection_details_page.dart';
import 'package:exam_demo_unsplash/services/http_service.dart';
import 'package:flutter/material.dart';

class CollectionPage extends StatefulWidget {
  const CollectionPage({super.key});

  @override
  State<CollectionPage> createState() => _CollectionPageState();
}

class _CollectionPageState extends State<CollectionPage> {
  List<CollectionModel> collections = [];

  loadCollection() async {
    var response = await Network.GET(
        Network.COLLECTIONS_API, Network.paramsGetCollection());
    if (response != null) {
      setState(() {
        collections = collectionModelFromMap(response);
      });
    }
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
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title: const Text(
          "Collections",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: ListView.builder(
          itemCount: collections.length,
          itemBuilder: (context, index) {
            return _collectionItem(collections[index]);
          }),
    );
  }

  Widget _collectionItem(CollectionModel collectionModel) {
    return GestureDetector(
      onTap: () {
        _openCollectionDetails(collectionModel);
      },
      child: Container(
        child: Stack(
          children: [
            Container(
              height: 250,
              width: double.infinity,
              child: CachedNetworkImage(
                memCacheWidth: collectionModel.coverPhoto.width ~/ 10,
                memCacheHeight: collectionModel.coverPhoto.height ~/ 10,
                placeholder: (context, url) {
                  return Container(
                    height: 250,
                    color: Colors.black12,
                  );
                },
                imageUrl: collectionModel.coverPhoto.urls.regular,
                fit: BoxFit.fitWidth,
              ),
            ),
            Container(
              height: 250,
              padding: EdgeInsets.all(10),
              alignment: Alignment.bottomLeft,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.bottomLeft,
                    end: Alignment(-0.5, -0.5),
                    colors: <Color>[
                      Colors.black,
                      Colors.transparent,
                    ]),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    collectionModel.title,
                    style: TextStyle(color: Colors.white, fontSize: 30),
                  ),
                  Text(
                    "${collectionModel.totalPhotos} photos",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
