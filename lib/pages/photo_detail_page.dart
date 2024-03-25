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
          icon: Icon(Icons.arrow_back_ios, color: Colors.white38),
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
            onPressed: () {},
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
                child: const Icon(
                  Icons.favorite,
                  color: Colors.white,
                ),
              ),
              GestureDetector(
                onTap: () {
                  showBottomSheet(
                      context: context,
                      builder: (context) =>
                          Container(
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
                  onPressed: () {
                    showModalBottomSheet(
                      scrollControlDisabledMaxHeightRatio: double.infinity,
                      backgroundColor: Colors.black.withOpacity(0.8),
                      context: context,
                      builder: (BuildContext context) {
                        return Container(
                          padding: const EdgeInsets.all(30),
                          height: MediaQuery
                              .of(context)
                              .size
                              .height / 1.5,
                          width: MediaQuery
                              .of(context)
                              .size
                              .width,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  SizedBox(
                                    height: 50,
                                    width: 50,
                                    child: CachedNetworkImage(
                                      fit: BoxFit.cover,
                                      imageUrl: photo
                                          .id,
                                      placeholder: (context, urls) =>
                                          Center(
                                            child: Container(
                                              decoration: BoxDecoration(
                                                color: Colors.grey[300],
                                                borderRadius:
                                                BorderRadius.circular(25),
                                              ),
                                            ),
                                          ),
                                      errorWidget: (context, urls, error) =>
                                      const Icon(Icons.error),
                                      imageBuilder:
                                          (context, imageProvider) =>
                                          Container(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                              BorderRadius.circular(25),
                                              image: DecorationImage(
                                                image: imageProvider,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    photo.id,
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                    ),
                                  ),
                                ],
                              ),
                              Container(
                                margin: const EdgeInsets.only(top: 20),
                                child: const Text(
                                  'Description',
                                  style: TextStyle(color: Colors.white30),
                                ),
                              ),
                              // Text(
                              //   // getDescription(),
                              //   style: const TextStyle(
                              //
                              //   color: Colors.white, fontSize: 17),
                              // ),
                              Container(
                                margin: const EdgeInsets.only(top: 20),
                                child: const Text(
                                  'Published',
                                  style: TextStyle(color: Colors.white30),
                                ),
                              ),
                              Text(
                                photo.createdAt
                                    .toIso8601String()
                                    .substring(0, 10),
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 18),
                              ),
                              Container(
                                margin: const EdgeInsets.only(top: 20),
                                child: const Text(
                                  'Dimensions',
                                  style: TextStyle(color: Colors.white30),
                                ),
                              ),
                              Text(
                                '${photo.blurHash} / ${photo.assetType}',
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 18),
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  },
                  icon: Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.7),
                        borderRadius: BorderRadius.circular(25)),
                    // child: const Icon(
                      // Iconsax.info_circle,
                      // size: 30,
                      // shadows: [
                      //   Shadow(color: Colors.black, blurRadius: 8.0)
                      // ],
                    // ),


                    child: IconButton(
                      icon: Icon(Icons.info_outlined, color: Colors.white,),
                      onPressed: (){
                        photo;
                      },
                    ),
                  ),
                  color: Colors.white,
                ),
              )
            ],
          ),
        )
      ]),
    );
  }
  String? Iconsax;
}
