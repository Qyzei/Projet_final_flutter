import '/model/chat_model.dart';
import 'package:flutter/material.dart';

class MessegesScreen extends StatefulWidget {
  @override
  _MessegesScreenState createState() => _MessegesScreenState();
}

class _MessegesScreenState extends State<MessegesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Container(
          child: ListView.builder(
            itemCount: ChatModel.dummyData.length,
            itemBuilder: (context, index) {
              ChatModel _model = ChatModel.dummyData[index];
              return Column(
                children: <Widget>[
                  Divider(
                    height: 12.0,
                  ),
                  ListTile(
                    leading: CircleAvatar(
                      radius: 24.0,
                      backgroundImage: NetworkImage(_model.avatarUrl),
                    ),
                    title: Row(
                      children: <Widget>[
                        Text(_model.name),
                        SizedBox(
                          width: 16.0,
                        ),
                        Text(
                          _model.datetime,
                          style: TextStyle(fontSize: 12.0),
                        ),
                      ],
                    ),
                    subtitle: Text(_model.message),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      size: 14.0,
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
