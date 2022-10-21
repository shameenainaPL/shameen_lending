import 'package:flutter/material.dart';
import 'package:lending_shameen/constants/theme_constants.dart';
import 'package:lending_shameen/common_widgets/widget_size.dart';
import 'package:readmore/readmore.dart';

//function to trigger build
void main() {
  runApp(const Lending());
}

class Lending extends StatelessWidget {
  const Lending({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flexi Credit',
      theme: ThemeData(
        primaryColor: ColorConstants.background,
      ),// ThemeData
      home: const LendingPage(),
      debugShowCheckedModeBanner: false,
    );// MaterialApp
  }
}

class LendingPage extends StatefulWidget {
  const LendingPage({Key? key}) : super(key: key);

  @override
// ignore: library_private_types_in_public_api
  _LendingPageState createState() => _LendingPageState();
}

class _LendingPageState extends State<LendingPage> {
  double bottomWidgetHeight = 0.0;
  double topWidgetHeight = 0.0;
  bool value = false;
  String descText = "I authorise Lender, Protium Finance Limited (“Lender/Protium”), its group companies and its agents / representatives for sharing with me information on various products, offers and services provided by the Lender / its group companies through any mode including without limited to (telephone calls / SMS / WhatsApp / electronic messages, emails etc). This consent will override any registration done by me for NDNC / DNC / DND";
  //bool descTextShowFlag = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: ColorConstants.carouselBackground,
        child: SafeArea(
          bottom: true,
          top: true,
          child: Column(
            children: [
              //topView(),
              bottomView(),
            ],
          ),
        ),
      ),
    );
  }

  WidgetSize topView() {
    return WidgetSize(
      onChange: (Size size) {
        setState(() {
          topWidgetHeight = size.height;
        });
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            decoration: const BoxDecoration(
              color: ColorConstants.background,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(20.0),
                bottomRight: Radius.circular(0.0),
                topLeft: Radius.circular(20.0),
                bottomLeft: Radius.circular(0.0),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Expanded bottomView() {
    final screenHeight =
        MediaQuery.of(context).size.height - MediaQuery.of(context).padding.bottom;
    return Expanded(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              WidgetSize(
                  onChange: (Size size) {
                    setState(() {
                      bottomWidgetHeight = size.height;
                    });
                  },
                  child: Container(
                    decoration: const BoxDecoration(
                      color: ColorConstants.background,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(0.0),
                        bottomRight: Radius.circular(0.0),
                        topLeft: Radius.circular(0.0),
                        bottomLeft: Radius.circular(0.0),
                      ),
                    ),
                    child: SafeArea(
                      bottom: true,
                      child: knowMore(),
                    ),
                  )
              ),
            ]
        )
    );
  }

  Column knowMore() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 19, horizontal: 0),
          child: Text(
            "Know More",
            style: TextStyle(
              fontFamily: "Indivisible",
              fontWeight: FontWeight.w600,
              fontSize: 12,
              color: Color(0xFF50D387),
            ),
            textAlign: TextAlign.center,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 0, horizontal:20),
          child: widgetRectangle(),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 5, horizontal: 0),
          child: ListTile(
            leading: Checkbox(
              checkColor: Color(0xFF50D387),
              value: this.value,
              onChanged: (value) {
                setState(() {
                  this.value = value as bool;
                });
              },
            ),
            title: ReadMoreText(
              descText,
              trimLines: 2,
              textAlign: TextAlign.justify,
              trimMode: TrimMode.Line,
              trimCollapsedText: " Read More ",
              trimExpandedText: " Read Less ",
              lessStyle: TextStyle(
                fontWeight: FontWeight.w600,
                color: Color(0xFF50D387),
              ),
              moreStyle: TextStyle(
                fontWeight: FontWeight.w600,
                color: Color(0xFF50D387),
              ),
              style: TextStyle(
                fontFamily: "Indivisible",
                fontWeight: FontWeight.w500,
                fontSize: 12,
                color: Color(0xFF999999),
              ),
            ),
            contentPadding: EdgeInsets.only(left: 5, right: 25),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
          child: InkWell(
            key: const Key("btnUnlock"),
            onTap: () => print('hello'),
            child: Container(
              //width: 100.0,
              height: 48.0,
              decoration: BoxDecoration(
                color: ColorConstants.primaryButton,
                borderRadius: BorderRadius.circular(68.0),
              ),
              child: Center(
                child: Text('Unlock',
                  style: TextStyle(
                      fontFamily: "Indivisible",
                      fontWeight: FontWeight.w600,
                      fontSize: 14.0,
                      color: ColorConstants.primaryButtonText),
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 10, bottom: 50, left: 100, right: 100),
          child: Text(
            'Unlock and sign up to withdraw the funds to your bank account.',
            maxLines: 2,
            style: TextStyle(
              fontFamily: "Indivisible",
              fontWeight: FontWeight.w600,
              fontSize: 12,
              color: Color(0xFF999999),
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }

  Column widgetRectangle() {
    return Column(
        children:[
          Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(12)),
              color: Color(0xFF16231C),
            ),
            child: lendingBox())
        ]
    );
  }

  WidgetSize lendingBox() {
    return WidgetSize(
      onChange: (Size size) {
        setState(() {
          topWidgetHeight = size.height;
        });
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 29, bottom: 12.5),
            child: Text(
              "UNLOCK UP TO",
              style: TextStyle(
                fontFamily: "Indivisible",
                fontWeight: FontWeight.w600,
                fontSize: 18,
                color: Color(0xFF92989B),
                letterSpacing: 2,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
              padding: EdgeInsets.only(top: 12.5, bottom: 9),
              child: Image.asset(
                'assets/images/padlock.png',
                height: 36.67,
                width: 33,
              )
          ),
          Padding(
            padding: EdgeInsets.only(top: 9, bottom: 4.5),
            child: Text(
              "₹ 10,00,000",
              style: TextStyle(
                fontFamily: "Indivisible",
                fontWeight: FontWeight.w600,
                fontSize: 36,
                color: Color(0xFF50D387),
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
              padding: EdgeInsets.only(top: 4.5, bottom: 34),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/slide1.png',
                    width: 90,
                  ),
                  Text(
                    "IN QUICK 4 STEPS",
                    style: TextStyle(
                      fontFamily: "Indivisible",
                      fontWeight: FontWeight.w600,
                      fontSize: 12,
                      color: Color(0xFF92989B),
                      letterSpacing: 2,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Image.asset(
                    'assets/images/slide2.png',
                    width: 90,
                  ),
                ],
              )
          ),
        ],
      ),
    );
  }
}
