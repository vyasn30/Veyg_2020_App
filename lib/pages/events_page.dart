import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:folding_cell/folding_cell/widget.dart';

class EventsPage extends StatelessWidget {
  final _foldingCellKey1 = GlobalKey<SimpleFoldingCellState>();
  final _foldingCellKey2 = GlobalKey<SimpleFoldingCellState>();
  final _foldingCellKey3 = GlobalKey<SimpleFoldingCellState>();


  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFF2e282a),
      child: Column(
        children: <Widget>[
          SimpleFoldingCell(
              key: _foldingCellKey1,
              frontWidget: _buildFrontWidget(_foldingCellKey1, "CARD 1"),
              innerTopWidget: _buildInnerTopWidget("TITLE 1"),
              innerBottomWidget: _buildInnerBottomWidget(_foldingCellKey1),
              cellSize: Size(MediaQuery.of(context).size.width, 125),
              padding: EdgeInsets.all(15),
              animationDuration: Duration(milliseconds: 300),
              borderRadius: 10,
              onOpen: () => print('cell 1 opened'),
              onClose: () => print('cell 1 closed')),
          SimpleFoldingCell(
              key: _foldingCellKey2,
              frontWidget: _buildFrontWidget(_foldingCellKey2, "CARD 2"),
              innerTopWidget: _buildInnerTopWidget("TITLE 2"),
              innerBottomWidget: _buildInnerBottomWidget(_foldingCellKey2),
              cellSize: Size(MediaQuery.of(context).size.width, 125),
              padding: EdgeInsets.all(15),
              animationDuration: Duration(milliseconds: 300),
              borderRadius: 10,
              onOpen: () => print('cell 2 opened'),
              onClose: () => print('cell 2 closed')),

          SimpleFoldingCell(
              key: _foldingCellKey3,
              frontWidget: _buildFrontWidget(_foldingCellKey3, "CARD 2"),
              innerTopWidget: _buildInnerTopWidget("TITLE 2"),
              innerBottomWidget: _buildInnerBottomWidget(_foldingCellKey3),
              cellSize: Size(MediaQuery.of(context).size.width, 125),
              padding: EdgeInsets.all(15),
              animationDuration: Duration(milliseconds: 300),
              borderRadius: 10,
              onOpen: () => print('cell 2 opened'),
              onClose: () => print('cell 2 closed')),
        ],
      ),
    );
  }

  Widget _buildFrontWidget(
      GlobalKey<SimpleFoldingCellState> key, String title) {
    return Container(
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
            FlatButton(
              onPressed: () => key?.currentState?.toggleFold(),
              child: Text(
                "Open",
              ),
              textColor: Colors.white,
              color: Colors.indigoAccent,
              splashColor: Colors.white.withOpacity(0.5),
            )
          ],
        ));
  }

  Widget _buildInnerTopWidget(String title) {
    return Container(
        color: Color(0xFFff9234),
        alignment: Alignment.center,
        child: Text(title,
            style: TextStyle(
                color: Color(0xFF2e282a),
                fontFamily: 'OpenSans',
                fontSize: 20.0,
                fontWeight: FontWeight.w800)));
  }

  Widget _buildInnerBottomWidget(GlobalKey<SimpleFoldingCellState> key) {
    return Container(
      color: Color(0xFFecf2f9),
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: EdgeInsets.only(bottom: 10),
        child: FlatButton(
          onPressed: () => key?.currentState?.toggleFold(),
          child: Text(
            "Close",
          ),
          textColor: Colors.white,
          color: Colors.indigoAccent,
          splashColor: Colors.white.withOpacity(0.5),
        ),
      ),
    );
  }
}
