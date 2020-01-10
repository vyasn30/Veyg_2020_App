
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:snaplist/snaplist.dart';



class DepartmentPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Snaplist Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<String> urls = [
    "https://image.tmdb.org/t/p/w370_and_h556_bestv2/2uNW4WbgBXL25BAbXGLnLqX71Sw.jpg",
    "https://image.tmdb.org/t/p/w370_and_h556_bestv2/lNkDYKmrVem1J0aAfCnQlJOCKnT.jpg",
    "https://image.tmdb.org/t/p/w370_and_h556_bestv2/wrFpXMNBRj2PBiN4Z5kix51XaIZ.jpg",
    "https://image.tmdb.org/t/p/w370_and_h556_bestv2/r6pPUVUKU5eIpYj4oEzidk5ZibB.jpg",
    "https://image.tmdb.org/t/p/w370_and_h556_bestv2/x1txcDXkcM65gl7w20PwYSxAYah.jpg",
    "https://image.tmdb.org/t/p/w370_and_h556_bestv2/ptSrT1JwZFWGhjSpYUtJaasQrh.jpg",
    "https://image.tmdb.org/t/p/w370_and_h556_bestv2/wMq9kQXTeQCHUZOG4fAe5cAxyUA.jpg",
    "https://image.tmdb.org/t/p/w370_and_h556_bestv2/7WsyChQLEftFiDOVTGkv3hFpyyt.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        child: Scaffold(
          appBar: AppBar(
              title: Text("Snaplist demo"),
              bottom: TabBar(tabs: <Widget>[
                Tab(
                  text: "Horizontal",
                ),
                Tab(
                  text: "Explicit",
                ),
                Tab(text: "Vertical")
              ])),
          body: TabBarView(
            physics: NeverScrollableScrollPhysics(),
            children: <Widget>[HorizontalTab(
              images: urls, loadMore: _loadMoreItems,
            ),
              HorizontalExplicitTab(
                images: urls, loadMore: _loadMoreItems,
              ),
              VerticalTab(images: urls, loadMore: _loadMoreItems)
            ],
          ),
        ),
        length: 3
    );
  }

  void _loadMoreItems() {
    setState(() {
      urls = new List.from(urls)..addAll(urls);
    });
  }
}

class VerticalTab extends StatelessWidget {
  final List<String> images;
  final VoidCallback loadMore;

  const VerticalTab({Key key, this.images, this.loadMore}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size cardSize = Size(250.0, 250.0);
    return SnapList(
      padding: EdgeInsets.only(
          top: (MediaQuery.of(context).size.height - 180 - cardSize.height) / 2),
      sizeProvider: (index, data) => cardSize,
      separatorProvider: (index, data) => Size(50.0, 50.0),
      positionUpdate: (int index){
        if(index==images.length-1){
          loadMore();
        }
      },
      builder: (context, index, data) {
        return ClipOval(
          child: Image.network(
            images[index],
            fit: BoxFit.cover,
          ),
        );
      },
      count: images.length,
      axis: Axis.vertical,
    );
  }
}

class HorizontalTab extends StatelessWidget {
  final List<String> images;
  final VoidCallback loadMore;

  const HorizontalTab({Key key, this.images, this.loadMore}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size cardSize = Size(300.0, 460.0);
    return SnapList(
      padding: EdgeInsets.only(
          left: (MediaQuery.of(context).size.width - cardSize.width) / 2),
      sizeProvider: (index, data) => cardSize,
      separatorProvider: (index, data) => Size(10.0, 10.0),
      positionUpdate: (int index) {
        if (index == images.length - 1) {
          loadMore();
        }
      },
      builder: (context, index, data) {
        return ClipRRect(
          borderRadius: new BorderRadius.circular(16.0),
          child: Image.network(
            images[index],
            fit: BoxFit.fill,
          ),
        );
      },
      count: images.length,
    );
  }
}

class HorizontalExplicitTab extends StatelessWidget {
  final List<String> images;
  final VoidCallback loadMore;

  const HorizontalExplicitTab({Key key, this.images, this.loadMore})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size cardSize = Size(300.0, 460.0);

    final random =  Random();
    final controller = SnaplistController(initialPosition: 2);
    return Stack(
      children: <Widget>[
        SnapList(
          padding: EdgeInsets.only(
              left: (MediaQuery.of(context).size.width - cardSize.width) / 2),
          sizeProvider: (index, data) => cardSize,
          separatorProvider: (index, data) => Size(10.0, 10.0),
          positionUpdate: (int index) {
            if (index == images.length - 1) {
              loadMore();
            }
          },
          builder: (context, index, data) {
            return ClipRRect(
              borderRadius: new BorderRadius.circular(16.0),
              child: Image.network(
                images[index],
                fit: BoxFit.fill,
              ),
            );
          },
          count: images.length,
          snaplistController: controller,
        ),
        Positioned(
          child: FloatingActionButton(
            onPressed: () =>
                controller.setPosition(random.nextInt(images.length)),
          ),
          bottom: 10,
          right: 10,
        )
      ],
    );
  }
}