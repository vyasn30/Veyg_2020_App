import 'package:flutter/widgets.dart';

class GalleryExampleItem {
  GalleryExampleItem({this.id, this.resource});

  final String id;
  final String resource;
}

class GalleryExampleItemThumbnail extends StatelessWidget {
  const GalleryExampleItemThumbnail(
      {Key key, this.galleryExampleItem, this.onTap})
      : super(key: key);

  final GalleryExampleItem galleryExampleItem;

  final GestureTapCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 5.0),
      child: GestureDetector(
        onTap: onTap,
        child: Hero(
          tag: galleryExampleItem.id,
          child: Image.asset(galleryExampleItem.resource, height: 80.0),
        ),
      ),
    );
  }
}

List<GalleryExampleItem> galleryItems = <GalleryExampleItem>[
  GalleryExampleItem(
    id: "tag1",
    resource: "assets/veyg_2019/1.jpg",
  ),
  GalleryExampleItem(
    id: "tag2",
    resource: "assets/veyg_2019/2.jpg",
  ),
  GalleryExampleItem(
    id: "tag3",
    resource: "assets/veyg_2019/3.jpg",
  ),
  GalleryExampleItem(
    id: "tag4",
    resource: "assets/veyg_2019/4.jpg",
  ),
];
