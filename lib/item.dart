import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ImageItem extends StatefulWidget {
  ImageItem({@required this.imagePath, @required this.name});
  final imagePath;
  final name;

  @override
  _ItemState createState() => _ItemState();
}

class _ItemState extends State<ImageItem> {
  Color favIconColor = Colors.grey[400];
  String itemImage;
  String itemName;
  IconData appIcon = Icons.favorite_outlined;

  @override
  void initState() {
    super.initState();
    updateUI(widget.imagePath, widget.name);
  }

  void updateUI(String imagePath, String name) {
    setState(() {
      itemImage = imagePath;
      itemName = name;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      margin: EdgeInsets.only(right: 20),
      height: 180,
      child: Column(
        children: [
          Stack(
            children: [
              Image(
                image: AssetImage(itemImage),
                fit: BoxFit.cover,
              ),
              Positioned(
                bottom: 15,
                right: 5,
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      if (favIconColor == Colors.grey[400]) {
                        favIconColor = Colors.orangeAccent;
                      } else {
                        favIconColor = Colors.grey[400];
                      }
                    });
                  },
                  child: Icon(
                    appIcon,
                    color: favIconColor,
                    size: 25.0,
                  ),
                ),
              )
            ],
          ),
          Text(itemName)
        ],
      ),
      decoration: BoxDecoration(
          border: Border.all(
            color: Colors.grey[300],
            width: 1,
          ),
          borderRadius: BorderRadius.circular(10.0)),
    );
  }
}
