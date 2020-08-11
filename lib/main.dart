import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

void main() => runApp(new Pictures());

class Pictures extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'picture',
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text(
            "Pictures",
            style:
                new TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
          backgroundColor: Colors.yellow,
        ),
        body: new PictureButton(),
      ),
    );
  }
}

class PictureButton extends StatefulWidget {
  @override
  _PictureButtonState createState() => _PictureButtonState();
}

class _PictureButtonState extends State<PictureButton> {
  String url = "";
  String animUrl = "";

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        new RaisedButton(
          onPressed: _ButtonPressed_fromInternet,
          child: const Text(
            'Picture upload',
            style: TextStyle(fontSize: 20),
          ),
        ),
        new CachedNetworkImage(imageUrl: url, placeholder: (context, animUrl) => CircularProgressIndicator(),),
      ],
    );
  }

  void _ButtonPressed() {
    setState(() {
      url = "Assets/home.png";
    });
  }

  void _ButtonPressed_fromInternet() {
    setState(() {
      url = "https://i.pinimg.com/originals/36/56/4c/36564c298b894452479dd08a7ea57233.gif";
      animUrl = "Assets/loading.gif";
    });
  }
}
