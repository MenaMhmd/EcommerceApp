import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:page_transition/page_transition.dart';
import 'package:storepro/screens/AllProducts.dart';
import 'package:storepro/screens/category_screen.dart';
import 'package:storepro/screens/feedproducts.dart';
import 'package:storepro/screens/salewidget.dart';
import 'package:storepro/screens/userscreen.dart';
import 'package:storepro/service/apiservice.dart';

import '../const/constant.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController textEditingController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    Apiservice.getallproducts();

    super.didChangeDependencies();
  }

  @override
  void dispose() {
    textEditingController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        elevation: 4,
        title: Text("Home"),
        leading: InkWell(
          onTap: () {
            Navigator.push(
              context,
              PageTransition(
                type: PageTransitionType.fade,
                child: Categoryscreen(),
              ),
            );
          },
          child: Icon(
            IconlyBold.category,
            color: lightIconsColor,
          ),
        ),
        actions: [
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                PageTransition(
                  type: PageTransitionType.fade,
                  child: UsersScreen(),
                ),
              );
            },
            child: Icon(
              IconlyBold.user_3,
              color: lightIconsColor,
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: textEditingController,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                filled: true,
                suffixIcon: Icon(
                  Icons.search,
                  color: lightIconsColor,
                ),
                hintText: "search..",
                fillColor: Theme.of(context).cardColor,
                hintStyle: TextStyle(color: lightIconsColor),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(color: lightIconsColor, width: 2)),
                errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(color: lightIconsColor, width: 2)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(color: lightIconsColor, width: 2)),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: size.height * .25,
                      child: Swiper(
                        itemCount: 3,
                        itemBuilder: (BuildContext context, int idex) {
                          return Salewidget();
                        },
                        pagination: SwiperPagination(
                            alignment: Alignment.bottomCenter,
                            builder: DotSwiperPaginationBuilder(
                                color: Colors.orangeAccent)),
                        control: SwiperControl(),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "All Products",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),

                          
                           InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                PageTransition(
                                  type: PageTransitionType.fade,
                                  child: AllProducts(products: [],),
                                ),
                              );
                            },
                            child: Icon(
                              Icons.arrow_right,
                              color: lightIconsColor,
                            ),
                          ),

                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    FutureBuilder(
                      future: Apiservice.getallproducts(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.done) {
                          if (snapshot.hasError) {
                            return Center(
                              child: Text(
                                '${snapshot.error} occurred',
                                style: TextStyle(fontSize: 18),
                              ),
                            );

                            // if we got our data
                          }
                          else if(snapshot.hasData) {
                            // Extracting data from snapshot object
                            final data = snapshot.data as String;
                          return
                            GridView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: snapshot.data?.length,
                            gridDelegate:
                            SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    crossAxisSpacing: 0.0,
                                    mainAxisSpacing: 0.0,
                                    childAspectRatio: .6),
                            itemBuilder: (context, index) {
                              return FeedsWidget(products:snapshot.data![index] ,);
                            },
                          );}
                        };
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      },
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
