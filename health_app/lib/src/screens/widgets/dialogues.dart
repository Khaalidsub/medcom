import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
void openImagePicker([BuildContext context,getImage]) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Container(
            color: Colors.blueAccent,
            height: 150,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.all(10.0),
                  child: Text('Pick an Image'),
                  color: Colors.blue,
                ),
                SizedBox(
                  height: 10.0,
                ),
                FlatButton(
                  child: Text('Use Camera'),
                  onPressed: () {
                    getImage(context, ImageSource.camera);
                  },
                ),
                FlatButton(
                  child: Text('Use Gallery'),
                  onPressed: () {
                    getImage(context, ImageSource.gallery);
                  },
                ),
              ],
            ),
          );
        });
  }