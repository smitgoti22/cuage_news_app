import 'package:flutter/material.dart';
import 'package:news_app/componets/text.dart';

class NewsDetailsScreen extends StatefulWidget {

  final String ? author;
  final String ?title;
  final String ?description;
  final String ?urlToImage;
  final String? content;

  NewsDetailsScreen({super.key,required this.author, required this.title, required this.description, required this.urlToImage, this.content});


  @override
  State<NewsDetailsScreen> createState() => _NewsDetailsScreenState();
}

class _NewsDetailsScreenState extends State<NewsDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
         color: Colors.grey
        ),
        actions: [
          IconButton(onPressed: () {

          }, icon: Icon(Icons.share)),
          IconButton(onPressed: () {
          }, icon: Icon(Icons.star)),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(15),
        child: Column
          ( crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            SizedBox(height: height * 0.25,width: width,child: Image.network(widget.urlToImage.toString(),fit: BoxFit.cover),
            ),
          SizedBox(height: height * 0.025,),
          CommonText(text: widget.title,size: 18,fontweight: FontWeight.bold,),
          SizedBox(height: height * 0.015,),
          CommonText(text: widget.author,size: 14,color: Colors.grey,),
          SizedBox(height: height * 0.03,),
          CommonText(text: widget.description,size: 14,),
        ]),
      ),
    );
  }
}
