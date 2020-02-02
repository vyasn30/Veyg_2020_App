import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

import 'gallery_app_bar.dart';
import 'gallery_example_item.dart';

class GalleryExample extends StatefulWidget {
  @override
  _GalleryExampleState createState() => _GalleryExampleState();
}

class _GalleryExampleState extends State<GalleryExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF212121),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          const ExampleAppBar(
            title: "Veyg 2019 Images",
            showGoBack: true,
          ),
          Flexible(
            child: GridView.builder(
                itemCount: galleryItems.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3),
                itemBuilder: (context, position) {
                  return GalleryExampleItemThumbnail(
                    galleryExampleItem: galleryItems[position],
                    onTap: () {
                      open(context, position);
                    },
                  );
                }),
          )
        ],
      ),
    );
  }

  void open(BuildContext context, final int index) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => GalleryPhotoViewWrapper(
          galleryItems: galleryItems,
          backgroundDecoration: const BoxDecoration(
            color: Colors.black,
          ),
          initialIndex: index,
          scrollDirection: Axis.horizontal,
        ),
      ),
    );
  }
}

class GalleryPhotoViewWrapper extends StatefulWidget {
  GalleryPhotoViewWrapper({
    this.loadingChild,
    this.backgroundDecoration,
    this.minScale,
    this.maxScale,
    this.initialIndex,
    @required this.galleryItems,
    this.scrollDirection = Axis.horizontal,
  }) : pageController = PageController(initialPage: initialIndex);

  final Widget loadingChild;
  final Decoration backgroundDecoration;
  final dynamic minScale;
  final dynamic maxScale;
  final int initialIndex;
  final PageController pageController;
  final List<GalleryExampleItem> galleryItems;
  final Axis scrollDirection;

  @override
  State<StatefulWidget> createState() {
    return _GalleryPhotoViewWrapperState();
  }
}

class _GalleryPhotoViewWrapperState extends State<GalleryPhotoViewWrapper> {
  int currentIndex;

  @override
  void initState() {
    currentIndex = widget.initialIndex;
    super.initState();
  }

  void onPageChanged(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF212121),
      body: Container(
        decoration: widget.backgroundDecoration,
        constraints: BoxConstraints.expand(
          height: MediaQuery.of(context).size.height,
        ),
        child: Stack(
          alignment: Alignment.bottomRight,
          children: <Widget>[
            PhotoViewGallery.builder(
              scrollPhysics: const BouncingScrollPhysics(),
              builder: _buildItem,
              itemCount: galleryItems.length,
              loadingChild: widget.loadingChild,
              backgroundDecoration: widget.backgroundDecoration,
              pageController: widget.pageController,
              onPageChanged: onPageChanged,
              scrollDirection: widget.scrollDirection,
            ),
            
          ],
        ),
      ),
    );
  }

  PhotoViewGalleryPageOptions _buildItem(BuildContext context, int index) {
    final GalleryExampleItem item = widget.galleryItems[index];
    return PhotoViewGalleryPageOptions(
      imageProvider: AssetImage(item.resource),
      initialScale: PhotoViewComputedScale.contained,
      minScale: PhotoViewComputedScale.contained * (0.5 + index / 10),
      maxScale: PhotoViewComputedScale.covered * 1.1,
      heroAttributes: PhotoViewHeroAttributes(tag: item.id),
    );
  }
}

// Expanded(
//   child: Center(
//     child: Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: <Widget>[
//         Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             GalleryExampleItemThumbnail(
//               galleryExampleItem: galleryItems[0],
//               onTap: () {
//                 open(context, 0);
//               },
//             ),
//             GalleryExampleItemThumbnail(
//               galleryExampleItem: galleryItems[1],
//               onTap: () {
//                 open(context, 1);
//               },
//             ),
//             GalleryExampleItemThumbnail(
//               galleryExampleItem: galleryItems[2],
//               onTap: () {
//                 open(context, 2);
//               },
//             ),
//             GalleryExampleItemThumbnail(
//               galleryExampleItem: galleryItems[3],
//               onTap: () {
//                 open(context, 3);
//               },
//             ),
//           ],
//         ),

//       ],
//     ),
//   ),
// ),
