import 'package:cached_network_image/cached_network_image.dart';
import 'package:exam_demo_unsplash/models/collection_model.dart';
import 'package:exam_demo_unsplash/pages/photo_detail_page.dart';
import 'package:flutter/material.dart';

class CollectionDetailsPage extends StatefulWidget {
  final CollectionModel? model;

  const CollectionDetailsPage({super.key, this.model});

  @override
  State<CollectionDetailsPage> createState() => _CollectionDetailsPageState();
}

class _CollectionDetailsPageState extends State<CollectionDetailsPage> {
  late CollectionModel model;
  List<PreviewPhoto> photos = [];

  @override
  void initState() {
    super.initState();
    model = widget.model!;
    photos = widget.model!.previewPhotos;
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
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        backgroundColor: Colors.black87,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white38),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          model.title,
          style: TextStyle(color: Colors.white70),
        ),
      ),
      body: ListView.builder(
        itemCount: photos.length,
        itemBuilder: (context, index) {
          return _photoItem(photos[index]);
        },
      ),
    );
  }

  Widget _photoItem(PreviewPhoto photo) {
    return GestureDetector(
      onTap: () {
        openPhotoDetails(photo);
      },
      child: Container(
        width: double.infinity,
        child: CachedNetworkImage(
          imageUrl: photo.urls.raw,
        ),
      ),
    );
  }
}
