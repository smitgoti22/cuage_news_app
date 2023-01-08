import 'package:flutter/material.dart';
import 'package:news_app/api_service/get_api_service.dart';
import 'package:news_app/componets/text.dart';
import 'package:news_app/model/GetArticlesModel.dart';
import 'package:news_app/screens/news_details_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  TabController? tabController;

  @override
  void initState() {
    // TODO: implement initState
    tabController = TabController(length: 5, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: const Icon(Icons.menu, color: Colors.black),
        title: Padding(
          padding: const EdgeInsets.only(right: 21),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                  width: width * 0.25,
                  child: Image.asset(
                    "assets/pngegg (40).png",
                    fit: BoxFit.cover,
                  )),
              SizedBox(width: width * 0.01,),
              CommonText(text: "\tNEWS",color: Colors.black,size: 14,)
            ],
          ),
        ),
        // centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.search,
                color: Colors.black,
              ))
        ],
        toolbarHeight: height * 0.08,
        bottom: TabBar(
            controller: tabController,
            isScrollable: true,
            overlayColor: const MaterialStatePropertyAll(Colors.transparent),
            labelPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            unselectedLabelColor: Colors.grey,
            indicatorColor: Colors.black,
            labelColor: Colors.black,
            tabs: const [
              CommonText(
                text: "Home",
              ),
              CommonText(text: "News"),
              CommonText(text: "ShowBiz"),
              CommonText(text: "LifeStyle"),
              CommonText(text: "Techbee"),
            ]),
        backgroundColor: Colors.white,
      ),
      body: FutureBuilder(
        future: GetArticles.getArticle(),
      builder: (context, AsyncSnapshot<GetArticlesModel> snapshot) {
        if(snapshot.connectionState == ConnectionState.done)
          {
            return Column(
              children: [
                Expanded(
                  flex: 1,
                  child: ListView.separated(
                    itemCount: 10,
                    physics: const BouncingScrollPhysics(),
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    itemBuilder: (context, index) {
                      final news = snapshot.data!.articles![index];
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(context,MaterialPageRoute(builder: (context) => NewsDetailsScreen(author: news.author, title: news.title, description: news.description, urlToImage: news.urlToImage),));
                        },
                        child: Column(
                          children: [
                            SizedBox(
                              height: height * 0.01,
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: width * 0.03,
                                ),

                                /// article image
                                SizedBox(
                                  height: height * 0.14,
                                  width: width * 0.32,
                                  child: Image.network(
                                      news.urlToImage.toString(),
                                      fit: BoxFit.cover),
                                ),
                                SizedBox(
                                  width: width * 0.03,
                                ),

                                /// title
                                Flexible(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children:  [
                                      CommonText(
                                        text: news.title.toString(),
                                        color: Colors.black,
                                        size: 14,
                                        fontweight: FontWeight.bold,
                                      ),
                                      SizedBox(
                                        height: height * 0.01,
                                      ),
                                      CommonText(
                                        text: news.publishedAt.toString().split(" ").first,
                                        color: Colors.grey,
                                        size: 14,
                                        fontweight: FontWeight.w400,
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              height: height * 0.01,
                            ),
                          ],
                        ),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return Divider(height: 2, color: Colors.grey,);
                    },
                  ),
                ),
              ],
            );
          }
        else {
          return const Center(child: CircularProgressIndicator());
        }
      },)
    );
  }
}
