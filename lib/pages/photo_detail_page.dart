import 'package:cached_network_image/cached_network_image.dart';
import 'package:exam_demo_unsplash/models/collection_model.dart';
import 'package:flutter/material.dart';

class PhotoDetailPage extends StatefulWidget {
  final PreviewPhoto? photo;

  const PhotoDetailPage({super.key, this.photo});

  @override
  State<PhotoDetailPage> createState() => _PhotoDetailPageState();
}

class _PhotoDetailPageState extends State<PhotoDetailPage> {
  late PreviewPhoto photo;

  @override
  void initState() {
    super.initState();
    photo = widget.photo!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black12,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white38),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      backgroundColor: Colors.black54,
      body: Stack(children: [
        Container(
          alignment: Alignment.center,
          child: GestureDetector(
            onTap: () {},
            child: CachedNetworkImage(
              fit: BoxFit.cover,
              imageUrl: photo.urls.regular,
            ),
          ),
        ),
        Container(
          alignment: Alignment.topRight,
          child: IconButton(
            icon: Icon(Icons.ios_share_outlined, color: Colors.white),
            onPressed: (){},
          ),
        ),
        Container(
          padding: EdgeInsets.only(bottom: 40, right: 20),
          height: double.infinity,
          width: double.infinity,
          alignment: Alignment.bottomRight,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                width: 50,
                height: 50,
                decoration: const BoxDecoration(
                    shape: BoxShape.circle, color: Colors.black),
                child: Icon(
                  Icons.favorite,
                  color: Colors.white,
                ),
              ),
              GestureDetector(
                onTap: (){
                  showBottomSheet(
                      context: context,
                      builder: (context) => Container(
                        height: 100,
                      ));
                },
                child: Container(
                  margin: EdgeInsets.only(top: 10),
                  width: 50,
                  height: 50,
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle, color: Colors.black),
                  child: const Icon(
                    Icons.more_horiz,
                    color: Colors.white,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 10),
                width: 50,
                height: 50,
                decoration: const BoxDecoration(
                    shape: BoxShape.circle, color: Colors.white),
                child: const Icon(
                  Icons.arrow_downward_outlined,
                  color: Colors.black,
                ),
              ),
              Container(
                child: IconButton(
                  icon: Icon(Icons.info_outlined, color: Colors.white,),
                  onPressed: (){},
                ),
              )
            ],
          ),
        )
      ]),
    );
  }
}
