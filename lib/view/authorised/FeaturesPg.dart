import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class FeaturesPg extends StatefulWidget {
  const FeaturesPg({Key? key}) : super(key: key);

  @override
  _FeaturesPgState createState() => _FeaturesPgState();
}

class _FeaturesPgState extends State<FeaturesPg> {
  var date = DateFormat.MMMMd().format(DateTime.now());
  var time = DateFormat.jm().format(DateTime.now());
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _timer =
        Timer.periodic(const Duration(milliseconds: 500), (timer) => _update());
  }

  void _update() {
    setState(() {
      date = DateFormat.MMMMd().format(DateTime.now());
      time = DateFormat.jm().format(DateTime.now());
    });
  }

  @override
  Widget build(BuildContext context) {
    dynamic height = MediaQuery.sizeOf(context).height;
    dynamic width = MediaQuery.sizeOf(context).width;

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 29, 29, 29),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${date},   ${time}",
                        style: TextStyle(color: Colors.grey, fontSize: 18),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 6),
                        child: Text(
                          "Explore Events",
                          style: GoogleFonts.sen(
                              color: Colors.white, fontSize: 25),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 100),
                    child: CircleAvatar(
                      backgroundColor: Colors.grey,
                      radius: height * 0.03,
                      backgroundImage: NetworkImage(
                          "https://t4.ftcdn.net/jpg/03/64/21/11/360_F_364211147_1qgLVxv1Tcq0Ohz3FawUfrtONzz8nq3e.jpg"),
                    ),
                  )
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.all(8),
              child: Container(
                height: height * 0.07,
                width: width,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 56, 56, 56),
                  borderRadius: BorderRadius.circular(10),
                ),
                alignment: Alignment.centerLeft,
                child: Row(
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Icon(
                        Icons.search_rounded,
                        color: Color.fromARGB(255, 153, 153, 153),
                        size: 30,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 3),
                      child: Text(
                        "Search",
                        style: GoogleFonts.sen(
                            color: const Color.fromARGB(255, 153, 153, 153),
                            fontSize: 18),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 150,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 4,
                  itemBuilder: (_, index) => Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Container(
                          width: 140,
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                  colors: [
                                    Color.fromARGB(255, 1, 133, 240),
                                    Color.fromARGB(255, 65, 159, 235),
                                    Color.fromARGB(255, 78, 169, 244),
                                  ]),
                              borderRadius: BorderRadius.circular(10)),
                        ),
                      )),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(top: 25, left: 5),
              child: Text("Featured",
                  style: GoogleFonts.sen(
                    color: Colors.white,
                    fontSize: 18,
                  )),
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 260,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 4,
                  itemBuilder: (_, index) => Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Container(
                          width: 240,
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  colors: [
                                    Color.fromARGB(255, 1, 133, 240),
                                    Color.fromARGB(255, 205, 100, 135),
                                    Color.fromARGB(255, 212, 56, 108),
                                  ]),
                              borderRadius: BorderRadius.circular(10)),
                        ),
                      )),
            ),
          ),
        ],
      ),
    );
  }
}
