import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: const Color.fromARGB(255, 158, 171, 246),
        appBar: AppBar(
          backgroundColor: Colors.indigoAccent[400],
          title: Text('Image Matching'),
        ),
        body: ImagePage(),
      ),
    ),
  );
}

class ImagePage extends StatefulWidget {
  const ImagePage({super.key});

  //const ImagePage({super.key});

  @override
  State<ImagePage> createState() => _ImagePageState();
}

class _ImagePageState extends State<ImagePage> {
  int leftPhohtoNumber = 1;
  int rightPhohtoNumber = 2;
  int numOfWins = 0;

  bool isImagesEquals() {
    if (leftPhohtoNumber == rightPhohtoNumber) {
      //numOfWins++;
      return true;
    }
    return false;
  }

  String showMessage() {
    if (isImagesEquals()) {
      return "You God Damn Right!";
    } else {
      return "Match The Images Below";
    }
  }

  void changeImage() {
    leftPhohtoNumber = Random().nextInt(9) + 1;
    rightPhohtoNumber = Random().nextInt(9) + 1;
  }


  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text('Wins is $numOfWins', style: TextStyle(fontSize: 25)),
        Text(
          showMessage(),
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: TextButton(
                      onPressed: () {
                        print('You Cliked on Left Photo!');
                        setState(() {
                          changeImage();
                        });
                        print('LeftPNumber = $leftPhohtoNumber');
                      },
                      child: Image.asset('images/image-$leftPhohtoNumber.png'),
                    ),
                  ),
                  Expanded(
                    child: TextButton(
                      onPressed: () {
                        setState(() {
                          changeImage();
                          if(isImagesEquals()){
                            numOfWins++;
                          }
                        });
                        print('You Cliked on Right Photo!');
                      },
                      child: Image.asset('images/image-$rightPhohtoNumber.png'),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 50),
                    child: OutlinedButton(
                      style: TextButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 82, 238, 93),
                      ),
                      onPressed: () {
                        setState(() {
                          numOfWins = 0;
                        });
                      },
                      child: Text(
                        'Resete Wins',
                        style: TextStyle(color: Colors.black87),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
