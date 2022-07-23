// ignore_for_file: file_names

import 'package:flutter/material.dart';

class Page404 extends StatelessWidget {
  const Page404({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ERROR 404"),
      ),
      body: const Center(
        child: FadeInImage(
          image: NetworkImage("https://fotografias.antena3.com/clipping/cmsimages01/2013/06/02/F614029E-38F4-4F8D-AD13-FFF134D8FBFF/69.jpg?crop=16:9,smart&width=1200&height=675&optimize=low&format=webply"),
          fadeInDuration: Duration(milliseconds: 200),
          placeholder: AssetImage("Files/loading.gif"), 
        ),
      ),
    );
  }
}