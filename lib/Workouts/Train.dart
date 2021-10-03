import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:perfect_body/Workouts/WorkoutPage/AbsArm.dart';

List _dataDummy = [
  {
    "albumId": 1,
    "id": 1,
    "title": "DAY 1",
    "url": "https://via.placeholder.com/600/92c952",
    "thumbnailUrl": "assets/1.png",
    "group": "WEEK 1",
  },
  {
    "albumId": 1,
    "id": 2,
    "title": "DAY 2",
    "url": "https://via.placeholder.com/600/92c952",
    "thumbnailUrl": "assets/2.png",
    "group": "WEEK 1",
  },
  {
    "albumId": 1,
    "id": 3,
    "title": "DAY 3",
    "url": "https://via.placeholder.com/600/92c952",
    "thumbnailUrl": "assets/3.png",
    "group": "WEEK 1",
  },
  {
    "albumId": 1,
    "id": 4,
    "title": "DAY 4",
    "url": "https://via.placeholder.com/600/92c952",
    "thumbnailUrl": "assets/4.png",
    "group": "WEEK 1",
  },
  {
    "albumId": 1,
    "id": 5,
    "title": "DAY 5",
    "url": "https://via.placeholder.com/600/92c952",
    "thumbnailUrl": "assets/5.png",
    "group": "WEEK 1",
  },
  {
    "albumId": 1,
    "id": 6,
    "title": "DAY 6",
    "url": "https://via.placeholder.com/600/92c952",
    "thumbnailUrl": "assets/6.png",
    "group": "WEEK 1",
  },
  {
    "albumId": 1,
    "id": 7,
    "title": "DAY 7",
    "url": "https://via.placeholder.com/600/92c952",
    "thumbnailUrl": "assets/7.png",
    "group": "WEEK 1",
  },
  {
    "albumId": 1,
    "id": 8,
    "title": "DAY 8",
    "url": "https://via.placeholder.com/600/771796",
    "thumbnailUrl": "assets/8.png",
    "group": "WEEK 2",
  },
  {
    "albumId": 1,
    "id": 9,
    "title": "DAY 9",
    "url": "https://via.placeholder.com/600/771796",
    "thumbnailUrl": "assets/9.png",
    "group": "WEEK 2",
  },
  {
    "albumId": 1,
    "id": 10,
    "title": "DAY 10",
    "url": "https://via.placeholder.com/600/771796",
    "thumbnailUrl": "assets/10.png",
    "group": "WEEK 2",
  },
  {
    "albumId": 1,
    "id": 11,
    "title": "DAY 11",
    "url": "https://via.placeholder.com/600/771796",
    "thumbnailUrl": "assets/11.png",
    "group": "WEEK 2",
  },
  {
    "albumId": 1,
    "id": 12,
    "title": "DAY 12",
    "url": "https://via.placeholder.com/600/771796",
    "thumbnailUrl": "assets/12.png",
    "group": "WEEK 2",
  },
  {
    "albumId": 1,
    "id": 13,
    "title": "DAY 13",
    "url": "https://via.placeholder.com/600/771796",
    "thumbnailUrl": "assets/13.png",
    "group": "WEEK 2",
  },
  {
    "albumId": 1,
    "id": 14,
    "title": "DAY 14",
    "url": "https://via.placeholder.com/600/771796",
    "thumbnailUrl": "assets/14.png",
    "group": "WEEK 2",
  },
  {
    "albumId": 1,
    "id": 15,
    "title": "DAY 15 ",
    "url": "https://via.placeholder.com/600/24f355",
    "thumbnailUrl": "assets/15.png",
    "group": "WEEK 3",
  },
  {
    "albumId": 1,
    "id": 16,
    "title": "DAY 16 ",
    "url": "https://via.placeholder.com/600/24f355",
    "thumbnailUrl": "assets/16.png",
    "group": "WEEK 3",
  },
  {
    "albumId": 1,
    "id": 17,
    "title": "DAY 17 ",
    "url": "https://via.placeholder.com/600/24f355",
    "thumbnailUrl": "assets/17.png",
    "group": "WEEK 3",
  },
  {
    "albumId": 1,
    "id": 18,
    "title": "DAY 18 ",
    "url": "https://via.placeholder.com/600/24f355",
    "thumbnailUrl": "assets/18.png",
    "group": "WEEK 3",
  },
  {
    "albumId": 1,
    "id": 19,
    "title": "DAY 19 ",
    "url": "https://via.placeholder.com/600/24f355",
    "thumbnailUrl": "assets/19.png",
    "group": "WEEK 3",
  },
  {
    "albumId": 1,
    "id": 20,
    "title": "DAY 20 ",
    "url": "https://via.placeholder.com/600/24f355",
    "thumbnailUrl": "assets/20.png",
    "group": "WEEK 3",
  },
  {
    "albumId": 1,
    "id": 21,
    "title": "DAY 21 ",
    "url": "https://via.placeholder.com/600/24f355",
    "thumbnailUrl": "assets/21.png",
    "group": "WEEK 3",
  },
  {
    "albumId": 1,
    "id": 22,
    "title": "DAY 22",
    "url": "https://via.placeholder.com/600/d32776",
    "thumbnailUrl": "assets/22.png",
    "group": "WEEK 4",
  },
  {
    "albumId": 1,
    "id": 23,
    "title": "DAY 23",
    "url": "https://via.placeholder.com/600/d32776",
    "thumbnailUrl": "assets/23.png",
    "group": "WEEK 4",
  },
  {
    "albumId": 1,
    "id": 24,
    "title": "DAY 24",
    "url": "https://via.placeholder.com/600/d32776",
    "thumbnailUrl": "assets/24.png",
    "group": "WEEK 4",
  },
  {
    "albumId": 1,
    "id": 25,
    "title": "DAY 25",
    "url": "https://via.placeholder.com/600/d32776",
    "thumbnailUrl": "assets/25.png",
    "group": "WEEK 4",
  },
  {
    "albumId": 1,
    "id": 26,
    "title": "DAY 26",
    "url": "https://via.placeholder.com/600/d32776",
    "thumbnailUrl": "assets/26.png",
    "group": "WEEK 4",
  },
  {
    "albumId": 1,
    "id": 27,
    "title": "DAY 27",
    "url": "https://via.placeholder.com/600/d32776",
    "thumbnailUrl": "assets/27.png",
    "group": "WEEK 4",
  },
  {
    "albumId": 1,
    "id": 28,
    "title": "DAY 28",
    "url": "https://via.placeholder.com/600/d32776",
    "thumbnailUrl": "assets/28.png",
    "group": "WEEK 4",
  },
];

class Train extends StatefulWidget {
  @override
  _TrainState createState() => _TrainState();
}

class _TrainState extends State<Train> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(5.0),
          child: ListView(
            shrinkWrap: true,
            children: <Widget>[
              Stack(
                children: [
                  Container(
                    child: Stack(
                      children: [
                        Image.asset(
                          'assets/AbsArm.jpg',
                          height: 200,
                          width: MediaQuery.of(context).size.width,
                          fit: BoxFit.fitWidth,
                        ),
                        IconButton(
                          icon: new Icon(
                            Icons.arrow_back_ios,
                            color: Colors.blueGrey,
                            size: 30,
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => AbsArm()),
                            );
                          },
                        ),
                        Positioned(
                          child: Text(
                            "Abs & Arm",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                            ),
                          ),
                          bottom: 30,
                          right: -230,
                          width: MediaQuery.of(context).size.width,
                          height: 60,
                        ),
                      ],
                    ),
                    // width: double.infinity,
                    // height: 250,
                    // decoration: BoxDecoration(
                    //     // borderRadius: BorderRadius.circular(20),
                    //     image: DecorationImage(
                    //         image: AssetImage('assets/AbsArm.jpg'),
                    //         fit: BoxFit.cover)),
                    // child: Container(
                    //   child: Column(
                    //     mainAxisAlignment: MainAxisAlignment.end,
                    //     children: <Widget>[
                    // IconButton(
                    //   icon: new Icon(
                    //     Icons.arrow_back_ios,
                    //     color: Colors.blueGrey,
                    //     size: 30,
                    //   ),
                    //   onPressed: () {
                    //     Navigator.push(
                    //       context,
                    //       MaterialPageRoute(
                    //           builder: (context) => AbsArm()),
                    //     );
                    //   },
                    // ),
                    // Text(
                    //   "Abs & Arm",
                    //   textAlign: TextAlign.left,
                    //   style: TextStyle(
                    //     color: Colors.white,
                    //     fontSize: 20,
                    //   ),
                    // ),
                    // SizedBox(
                    //   height: 30,
                    // ),
                    // Positioned(
                    //   child: TextButton(
                    //     onPressed: () {
                    //       Navigator.push(
                    //         context,
                    //         MaterialPageRoute(
                    //             builder: (context) => ListDays()),
                    //       );
                    //     },
                    //     child: Container(
                    //       height: 50,
                    //       margin: EdgeInsets.symmetric(horizontal: 40),
                    //       decoration: BoxDecoration(
                    //           borderRadius: BorderRadius.circular(30),
                    //           color: Colors.green),
                    //       child: Center(
                    //         child: Text(
                    //           'Day 1',
                    //           style: TextStyle(
                    //               color: Colors.white,
                    //               fontWeight: FontWeight.bold,
                    //               fontSize: 20),
                    //         ),
                    //       ),
                    //     ),
                    //   ),
                    // ),
                    // SizedBox(
                    //   height: 30,
                    // ),
                    // ],
                    // ),
                    // ),
                  ),
                ],
              ),

              Stack(
                children: [
                  // Padding(
                  // padding: const EdgeInsets.fromLTRB(4.2, 5.4, 4.2, 0),
                  // child: Container(
                  //   decoration: BoxDecoration(
                  //       borderRadius: BorderRadius.circular(20),
                  //       color: Colors.red),
                  // ),
                  Expanded(
                    child: Container(
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height,
                      // height: 3000,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white24,

                        // image: DecorationImage(
                        //     image: AssetImage('assets/AbsArm.jpg'),
                        //     fit: BoxFit.cover),
                      ),
                      child: Scaffold(
                        body: GroupedListView<dynamic, String>(
                          elements: _dataDummy,
                          groupBy: (element) => element['group'],
                          groupSeparatorBuilder: (String groupByValue) =>
                              Padding(
                            padding: EdgeInsets.all(10),
                            child: Row(
                              children: [
                                Flexible(
                                  child: Row(
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(
                                            left: 10, right: 10),
                                        child: Text(
                                          groupByValue,
                                          textAlign: TextAlign.start,
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          itemBuilder: (context, dynamic element) {
                            return Card(
                              elevation: 10,
                              margin: EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 10),
                              child: Container(
                                padding: EdgeInsets.all(10),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Expanded(
                                      child: ClipRRect(
                                        child: Image(
                                          image: AssetImage(
                                              element['thumbnailUrl']),
                                          fit: BoxFit.cover,
                                        ),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(5)),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 5,
                                      child: Container(
                                        padding: EdgeInsets.only(
                                          bottom: 10,
                                        ),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  left: 10, right: 10),
                                              child: Text(
                                                element['title'],
                                                style: TextStyle(
                                                  fontSize: 23,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.grey,
                                                ),
                                                maxLines: 2,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ),
                                            // Padding(padding: EdgeInsets.only(
                                            //   left:10, right: 10, top: 5
                                            // ),
                                            // child: Row(
                                            //   mainAxisSize: MainAxisSize.max,
                                            //   mainAxisAlignment: MainAxisAlignment.start,
                                            //   children: [
                                            //     Icon(Icons.account_circle_sharp, color: Colors.grey, size: 16),
                                            //     Container(
                                            //       margin: EdgeInsets.only(left:10),
                                            //       child: Text('${element}'),
                                            //     ),
                                            //   ],
                                            // ),),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                          itemComparator: (item1, item2) => item1['title']
                              .compareTo(item2['title']), // optional
                          useStickyGroupSeparators: true, // optional
                          floatingHeader: true, // optional
                          order: GroupedListOrder.ASC, // optional
                        ),
                      ),
                    ),
                  ),

                  // child: Image.asset(
                  //   'assets/time-background-concept-vintage-classic-alarm-clock-yellow-empty-management-comcept-174343445.jpg',
                  //   // height: 500,
                  //   height: 100,
                  //   width: MediaQuery.of(context).size.width,
                  //   fit: BoxFit.fitWidth,
                  // ),
                  // ),
                  // Positioned(
                  //   child: Column(
                  //     children: [
                  //       Text(
                  //         "2-7 min fast workout",
                  //         style: TextStyle(
                  //             fontWeight: FontWeight.bold, fontSize: 20),
                  //       ),
                  //       SizedBox(
                  //         height: 5,
                  //       ),
                  //       Text(
                  //         "Not enough time? \n 2-7 minutes to do anything anywhere",
                  //         style: TextStyle(
                  //             fontWeight: FontWeight.normal, fontSize: 14),
                  //       ),
                  //     ],
                  //   ),
                  //   bottom: 30,
                  //   left: -75,
                  //   width: MediaQuery.of(context).size.width,
                  //   height: 60,
                  // ),
                ],
              ),
              // SizedBox(
              //   height: 20,
              // ),
              // // Expanded(
              // GridView.count(
              //   shrinkWrap: true,
              //   physics: NeverScrollableScrollPhysics(),
              //   crossAxisCount: 2,
              //   crossAxisSpacing: 10,
              //   mainAxisSpacing: 10,
              //   children: _listItem
              //       .map(
              //         (item) => InkWell(
              //           onTap: () {
              //             switch (item) {
              //               case 'assets/ButtLeg.jpg':
              //                 Navigator.push(
              //                   context,
              //                   MaterialPageRoute(
              //                       builder: (context) => ButtLeg()),
              //                 );
              //                 break;
              //               case 'assets/fitness.jpg':
              //                 Navigator.push(
              //                   context,
              //                   MaterialPageRoute(
              //                       builder: (context) => Fitness()),
              //                 );
              //                 break;
              //               case 'assets/FullBody.jpg':
              //                 Navigator.push(
              //                   context,
              //                   MaterialPageRoute(
              //                       builder: (context) => FullBody()),
              //                 );
              //                 break;
              //               default:
              //             }
              //           },
              //           child: Card(
              //             color: Colors.transparent,
              //             elevation: 0,
              //             child: Container(
              //               decoration: BoxDecoration(
              //                 borderRadius: BorderRadius.circular(20),
              //                 image: DecorationImage(
              //                     image: AssetImage(item), fit: BoxFit.cover),
              //               ),
              //               child: Transform.translate(
              //                 offset: Offset(20, -50),
              //                 child: Container(
              //                   margin: EdgeInsets.symmetric(
              //                       horizontal: 0, vertical: 63),
              //                   child: Text(
              //                     _listItemNames[_listItem.indexOf(item)],
              //                     style: TextStyle(
              //                         color: Colors.white,
              //                         fontWeight: FontWeight.bold,
              //                         fontSize: 20),
              //                   ),
              //                 ),
              //               ),
              //             ),
              //           ),
              //         ),
              //       )
              //       .toList(),
              // ),
              // ),
              // SizedBox(
              //   height: 20,
              // ),
              // Container(
              //   width: double.infinity,
              //   height: 150,
              //   decoration: BoxDecoration(
              //     borderRadius: BorderRadius.circular(20),
              //     color: Color.fromRGBO(149, 194, 222, 70),
              //     // image: DecorationImage(
              //     //     image: AssetImage('assets/AbsArm.jpg'),
              //     //     fit: BoxFit.cover),
              //   ),
              //   child: Container(
              //     // decoration: BoxDecoration(
              //     //     borderRadius: BorderRadius.circular(20),
              //     //     gradient:
              //     //         LinearGradient(begin: Alignment.bottomRight, colors: [
              //     //       Colors.black.withOpacity(.4),
              //     //       Colors.black.withOpacity(.2),
              //     //     ])),
              //     child: Stack(
              //       // mainAxisAlignment: MainAxisAlignment.start,
              //       children: <Widget>[
              //         Positioned(
              //           child: Column(
              //             children: [
              //               Text(
              //                 "Water Tracker",
              //                 textAlign: TextAlign.right,
              //                 style: TextStyle(
              //                   color: Colors.black,
              //                   fontWeight: FontWeight.bold,
              //                   fontSize: 20,
              //                 ),
              //               ),
              //               SizedBox(
              //                 height: 8,
              //               ),
              //               Text(
              //                 "Water is the fuel of the \nmuscles",
              //                 textAlign: TextAlign.left,
              //                 style: TextStyle(
              //                   color: Colors.black,
              //                   fontSize: 15,
              //                 ),
              //               ),
              //             ],
              //           ),
              //           top: 10,
              //           right: 60,
              //           width: MediaQuery.of(context).size.width,
              //           // height: 30,
              //         ),
              //         SizedBox(
              //           height: 30,
              //         ),
              //         Positioned(
              //           child: Container(
              //             height: 80,
              //             width: 80,
              //             margin: EdgeInsets.symmetric(horizontal: 40),
              //             decoration: BoxDecoration(
              //               borderRadius: BorderRadius.circular(30),
              //               image: DecorationImage(
              //                   image: AssetImage('assets/waterReminder.jpg'),
              //                   fit: BoxFit.fill),
              //             ),
              //           ),
              //           //   child: Center(
              //           //     child: Text(
              //           //       'Day 1',
              //           //       style: TextStyle(
              //           //           color: Colors.white,
              //           //           fontWeight: FontWeight.bold,
              //           //           fontSize: 20),
              //           //     ),
              //           //   ),
              //           left: 230,
              //           top: 10,
              //         ),
              //         SizedBox(
              //           height: 30,
              //         ),
              //         Positioned(
              //           child: TextButton(
              //             onPressed: () {
              //               Navigator.push(
              //                 context,
              //                 MaterialPageRoute(
              //                     builder: (context) => HomePage()),
              //               );
              //             },
              //             child: Container(
              //               height: 40,
              //               width: 130,
              //               margin: EdgeInsets.symmetric(horizontal: 40),
              //               decoration: BoxDecoration(
              //                   borderRadius: BorderRadius.circular(30),
              //                   color: Colors.green),
              //               child: Center(
              //                 child: Text(
              //                   'Drink',
              //                   style: TextStyle(
              //                       color: Colors.white,
              //                       fontWeight: FontWeight.bold,
              //                       fontSize: 20),
              //                 ),
              //               ),
              //             ),
              //           ),
              //           bottom: 20,
              //           left: 70,
              //         ),
              //       ],
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ),

      // body: Column(
      //   children: [
      //     Stack(
      //       children: [
      //         Padding(
      //           padding: const EdgeInsets.fromLTRB(4.2, 5.4, 4.2, 0),
      //           child: Image.asset(
      //             'assets/AbsArm.jpg',
      //             height: 200,
      //             width: MediaQuery.of(context).size.width,
      //             fit: BoxFit.fitWidth,
      //           ),
      //         ),
      //         IconButton(
      //           icon: new Icon(
      //             Icons.arrow_back_ios,
      //             color: Colors.blueGrey,
      //             size: 30,
      //           ),
      //           onPressed: () {
      //             Navigator.push(
      //               context,
      //               MaterialPageRoute(builder: (context) => AbsArm()),
      //             );
      //           },
      //         ),
      //         Positioned(
      //           child: Column(
      //             children: [
      //               Text(
      //                 "Abs & Arm",
      //                 style: TextStyle(
      //                     // fontWeight: FontWeight.bold,
      //                     fontSize: 30,
      //                     color: Colors.white),
      //               ),
      //               SizedBox(
      //                 height: 5,
      //               ),
      //             ],
      //           ),
      //           bottom: 30,
      //           right: -75,
      //           width: MediaQuery.of(context).size.width,
      //           height: 60,
      //         ),
      //       ],
      //     ),
      //     // Container(
      //     //   decoration: BoxDecoration(
      //     //       borderRadius: BorderRadius.circular(20), color: Colors.red),
      //     // ),
      //   ],
      // ),
    );
  }
}
