import "package:flutter/material.dart";

import "../const/constant.dart";

class Salewidget extends StatefulWidget {
  @override
  State<Salewidget> createState() => _SalewidgetState();
}

class _SalewidgetState extends State<Salewidget> {
  TextEditingController textEditingController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    textEditingController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      height: size.height * .02,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          gradient: LinearGradient(
            colors: [
              Color(0xFF7A60A5),
              Color(0xFF82C3DF),
            ],
            begin: FractionalOffset(0.0, 0.0),
            end: FractionalOffset(1.0, 0.0),
            stops: [0.0, 1.0],
            tileMode: TileMode.clamp,
          )),
      child: Row(
        children: [
          Flexible(
              flex: 2,
              child: Padding(
                padding: EdgeInsets.all(14),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color(0xFF9689CE),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Get the special Discount",
                          style: TextStyle(color: Colors.white),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Flexible(
                            child: FittedBox(
                                child: Text(
                          "50 %\n OFF",
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ))),
                      ],
                    ),
                  ),
                ),
              )),
          Flexible(
              flex: 3,
              child: Image.asset("assetts/fashon.jpg",width: double.infinity,fit: BoxFit.contain,))
        ],
      ),
    );
  }
}
