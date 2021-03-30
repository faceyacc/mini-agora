import 'package:flutter/material.dart';
import 'package:mini_agora/utilities/contants.dart';
import 'library.dart';

class MiniAorgHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
        backgroundColor: Colors.white,
        brightness: Brightness.light, // status bar brightness
      ),
      body: Stack(
        overflow: Overflow.visible,
        children: [
          Image(
            // Background Image
            image: AssetImage('images/test_agora.png'),
            fit: BoxFit.fitHeight,
            height: kImageHeight,
          ),

          DescriptionBox(
            text: kfioresDescriptions,
          ),

          // 'Start Browsing' button
        ],
      ),
    );
  }
}

class BrowsButton extends StatelessWidget {
  const BrowsButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      child: GestureDetector(
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => AgoraLibrary()));
        },
        child: Container(
          padding: EdgeInsets.fromLTRB(20, 4, 0, 0),
          child: Row(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Start\nBrowsing',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(60, 0, 0, 5),
                child: Icon(
                  Icons.arrow_forward_sharp,
                  color: Colors.white,
                  size: 35,
                ),
              ),
            ],
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: Color(0xFF7EB0EB),
          ),
          margin: EdgeInsets.fromLTRB(150, 430, 35, 74),
          height: 50,
        ),
      ),
    );
  }
}

class DescriptionBox extends StatelessWidget {
  final Text text;
  DescriptionBox({this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        overflow: Overflow.visible,
        children: [
          // Descriptions
          Positioned(
            top: (MediaQuery.of(context).size.height) / 2.0,
            child: SafeArea(
              child: Center(
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.circular(kDescriptionBorderRadius),
                      color: kDescriptionColor),
                  alignment: Alignment.bottomCenter,
                  width: (MediaQuery.of(context).size.width),
                  height: (MediaQuery.of(context).size.height) / 2,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(25, 50, 25, 1),
                    child: Center(child: kfioresDescriptions),
                  ),
                ),
              ),
            ),
          ),

          // Button
          Positioned(
            bottom: 290,
            left: 200,
            child: SafeArea(
              child: Center(
                  child: GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => AgoraLibrary()));
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Color(0xFF7EB0EB),
                  ),
                  padding: EdgeInsets.fromLTRB(15, 8, 15, 8),
                  child: Row(
                    children: [
                      Text(
                        'Start\nBrowsing',
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                      Icon(
                        Icons.arrow_forward_sharp,
                        color: Colors.white,
                        size: 35,
                      ),
                    ],
                  ),
                ),
              )),
            ),
          ),

          // Title
          Positioned(
            bottom: 220,
            child: SafeArea(
              child: Center(
                  child: Padding(
                padding: const EdgeInsets.fromLTRB(25, 50, 25, 1),
                child: kfioresDescriptionTitle,
              )),
            ),
          ),
        ],
      ),
    );
  }
}
