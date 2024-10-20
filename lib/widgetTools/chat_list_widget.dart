import 'package:Colibri_Collecte/widgetTools/message_widget.dart';
import 'package:flutter/material.dart';



class ChatList extends StatelessWidget {
  final List<MessageWidget> children;
  final ScrollController? scrollController;

  ChatList({this.children = const <MessageWidget>[], this.scrollController});

  Widget build(context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        Expanded(
          child: ListView.builder(
            shrinkWrap: true,
            controller: scrollController ?? ScrollController(),
            padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
            itemCount: children.length,
            itemBuilder: (BuildContext buildContext, int index) {
              return children[index];
            },
          ),
          flex: 8,
        ),
      ],
    );
  }
}
