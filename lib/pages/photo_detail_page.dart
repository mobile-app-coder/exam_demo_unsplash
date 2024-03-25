import 'package:cached_network_image/cached_network_image.dart';
import 'package:exam_demo_unsplash/models/collection_model.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

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
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.ios_share_outlined, color: Colors.white),
            onPressed: () {
              share();
            },
          ),
        ],
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
          padding: EdgeInsets.only(bottom: 40, right: 5),
          height: double.infinity,
          width: double.infinity,
          alignment: Alignment.bottomCenter,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: const Icon(
                  Icons.info_outlined,
                  color: Colors.white,
                ),
                onPressed: () {
                  showModalBottomSheet(
                      context: context,
                      builder: (BuildContext context) {
                        return Container(
                          height: 600,
                          padding: EdgeInsets.all(10),
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20),
                                  topRight: Radius.circular(20))),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Username: ${photo.user}",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ),
                              Text("description: ${photo.descriptions}",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20)),
                              Text(
                                "created at : ${photo.createdAt}",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                ),
                                maxLines: 2,
                              ),
                            ],
                          ),
                        );
                      });
                },
              ),
              IconButton(
                onPressed: () {
                  //_saveNetworkImage();
                },
                icon: const Icon(
                  Icons.arrow_downward_outlined,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        )
      ]),
    );
  }

  share() async {
    await Share.share(photo.links!.download);
  }
}
