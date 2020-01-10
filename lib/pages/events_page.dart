import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:folding_cell/folding_cell/widget.dart';
import 'package:gradient_widgets/gradient_widgets.dart';

import 'event_detail.dart';

class EventsPage extends StatelessWidget {
  final _foldingCellKey1 = GlobalKey<SimpleFoldingCellState>();
  final _foldingCellKey2 = GlobalKey<SimpleFoldingCellState>();
  final _foldingCellKey3 = GlobalKey<SimpleFoldingCellState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
        "Demo",
      )),
      body: Container(
        color: Color(0xFF2e282a),
        child: ListView(
          children: <Widget>[
            SimpleFoldingCell(
                key: _foldingCellKey1,
                frontWidget: _buildFrontWidget(_foldingCellKey1, "CARD 1"),
                innerTopWidget: _buildInnerTopWidget(_foldingCellKey1,"TITLE 1", context),
                innerBottomWidget: _buildInnerBottomWidget(_foldingCellKey1,context),
                cellSize: Size(MediaQuery.of(context).size.width, 125),
                padding: EdgeInsets.all(15),
                animationDuration: Duration(milliseconds: 300),
                borderRadius: 10,
                onOpen: () => print('cell 1 opened'),
                onClose: () => print('cell 1 closed')),
            SimpleFoldingCell(
                key: _foldingCellKey2,

                frontWidget: _buildFrontWidget(_foldingCellKey2, "CARD 2"),
                innerTopWidget: _buildInnerTopWidget(_foldingCellKey2,"TITLE 2", context),
                innerBottomWidget: _buildInnerBottomWidget(_foldingCellKey2,context),
                cellSize: Size(MediaQuery.of(context).size.width, 125),
                padding: EdgeInsets.all(15),
                animationDuration: Duration(milliseconds: 300),
                borderRadius: 10,
                onOpen: () => print('cell 2 opened'),
                onClose: () => print('cell 2 closed')),
            SimpleFoldingCell(
                key: _foldingCellKey3,
                frontWidget: _buildFrontWidget(_foldingCellKey3, "CARD 2"),
                innerTopWidget: _buildInnerTopWidget(_foldingCellKey3,"TITLE 2", context),
                innerBottomWidget: _buildInnerBottomWidget(_foldingCellKey3,context),
                cellSize: Size(MediaQuery.of(context).size.width, 125),
                padding: EdgeInsets.all(15),
                animationDuration: Duration(milliseconds: 300),
                borderRadius: 10,
                onOpen: () => print('c  ell 2 opened'),
                onClose: () => print('cell 2 closed')),
          ],
        ),
      ),
    );
  }

  Widget _buildFrontWidget(
      GlobalKey<SimpleFoldingCellState> key, String title) {
    return Material(
      child: InkWell(
        onTap: (){
          key?.currentState?.toggleFold();
        },
        child: Container(
            color: Color(0xFFffcd3c),
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(title,
                    style: TextStyle(
                        color: Color(0xFF2e282a),
                        fontFamily: 'OpenSans',
                        fontSize: 20.0,
                        fontWeight: FontWeight.w800)),
//            FlatButton(
//              onPressed: () => key?.currentState?.toggleFold(),
//              child: Text(
//                "Open",
//              ),
//              textColor: Colors.white,
//              color: Colors.indigoAccent,
//              splashColor: Colors.white.withOpacity(0.5),
//            )
              ],
            )),
      ),
    );
  }

  Widget _buildInnerTopWidget(GlobalKey<SimpleFoldingCellState> key,String title, BuildContext context) {
    return InkWell(
      onTap: () => key?.currentState?.toggleFold(),
      child: Container(
          color: Color(0xFFff9234),
          alignment: Alignment.center,
          child: InkWell(
            onTap: () => key?.currentState?.toggleFold(),
            child: Text(title,
                style: TextStyle(
                    color: Color(0xFF2e282a),
                    fontFamily: 'OpenSans',
                    fontSize: 20.0,
                    fontWeight: FontWeight.w800)),
          )),
    );
  }

  Widget _buildInnerBottomWidget(GlobalKey<SimpleFoldingCellState> key,context) {
    return InkWell(
      onTap: () => key?.currentState?.toggleFold(),
      child: Container(
        color: Color(0xFFecf2f9),
        alignment: Alignment.bottomCenter,
        child: Padding(
          padding: EdgeInsets.only(bottom: 10),
        child: FlatButton(
          onPressed: () => print("sdas"),
          child: Text(
            "Close",
          ),
//          textColor: Colors.white,
//          color: Colors.indigoAccent,
//          splashColor: Colors.white.withOpacity(0.5),
        ),
        ),
      ),
    );
  }
}
