import 'dart:developer';

import 'package:devbook/src/controller/auth/auth_controller.dart';
import 'package:devbook/src/utils/color_constant.dart';
import 'package:devbook/src/utils/image_constant.dart';
import 'package:devbook/src/utils/math_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfilePage extends GetWidget<AuthController> {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    log(controller.profile!.profileImage.toString());
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorConstant.whiteA700,
        body: Column(
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: ColorConstant.whiteA700,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: SizedBox(
                                    height: getVerticalSize(
                                      288.00,
                                    ),
                                    width: size.width,
                                    child: Stack(
                                      alignment: Alignment.bottomCenter,
                                      children: [
                                        Align(
                                          alignment: Alignment.topLeft,
                                          child: Padding(
                                            padding: EdgeInsets.only(
                                              bottom: getVerticalSize(
                                                10.00,
                                              ),
                                            ),
                                            child: Image.asset(
                                              ImageConstant.imgCoverphjoto,
                                              height: getVerticalSize(
                                                240.00,
                                              ),
                                              width: getHorizontalSize(
                                                414.00,
                                              ),
                                              fit: BoxFit.fill,
                                            ),
                                          ),
                                        ),
                                        Align(
                                          alignment: Alignment.bottomCenter,
                                          child: Container(
                                            margin: EdgeInsets.only(
                                              left: getHorizontalSize(
                                                161.00,
                                              ),
                                              top: getVerticalSize(
                                                10.00,
                                              ),
                                              right: getHorizontalSize(
                                                161.00,
                                              ),
                                              bottom: getVerticalSize(
                                                2.00,
                                              ),
                                            ),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(
                                                getHorizontalSize(
                                                  46.00,
                                                ),
                                              ),
                                              border: Border.all(
                                                color: ColorConstant
                                                    .deepPurpleA100,
                                                width: getHorizontalSize(
                                                  1.50,
                                                ),
                                              ),
                                            ),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsets.only(
                                                    left: getHorizontalSize(
                                                      4.00,
                                                    ),
                                                    top: getVerticalSize(
                                                      4.00,
                                                    ),
                                                    right: getHorizontalSize(
                                                      4.00,
                                                    ),
                                                    bottom: getVerticalSize(
                                                      4.00,
                                                    ),
                                                  ),
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                      getSize(
                                                        42.00,
                                                      ),
                                                    ),
                                                    child: CircleAvatar(
                                                      backgroundColor:
                                                          Colors.white,
                                                      radius: 32,
                                                      child: Image.network(
                                                        "${controller.profile!.profileImage}",
                                                        // color: Colors.white,
                                                        // "https://www.gravatar.com/avatar/6266ce7764a595e3de2f?s=32&d=identicon&r=PG",
                                                        height: getSize(
                                                          84.00,
                                                        ),
                                                        width: getSize(
                                                          84.00,
                                                        ),
                                                        fit: BoxFit.fill,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        // Align(
                                        //   alignment: Alignment.bottomLeft,
                                        //   child: Padding(
                                        //     padding: EdgeInsets.only(
                                        //       left: getHorizontalSize(
                                        //         60.00,
                                        //       ),
                                        //       top: getVerticalSize(
                                        //         10.00,
                                        //       ),
                                        //       right: getHorizontalSize(
                                        //         60.00,
                                        //       ),
                                        //     ),
                                        //     child: Column(
                                        //       mainAxisSize: MainAxisSize.min,
                                        //       crossAxisAlignment:
                                        //           CrossAxisAlignment.center,
                                        //       mainAxisAlignment:
                                        //           MainAxisAlignment.start,
                                        //       children: [
                                        //         Padding(
                                        //           padding: EdgeInsets.only(
                                        //             left: getHorizontalSize(
                                        //               9.00,
                                        //             ),
                                        //             right: getHorizontalSize(
                                        //               9.00,
                                        //             ),
                                        //           ),
                                        //           child: Text(
                                        //             "43.5k",
                                        //             overflow:
                                        //                 TextOverflow.ellipsis,
                                        //             textAlign: TextAlign.center,
                                        //             style: TextStyle(
                                        //               color: ColorConstant
                                        //                   .indigo900,
                                        //               fontSize: getFontSize(
                                        //                 17,
                                        //               ),
                                        //               fontFamily:
                                        //                   'Airbnb Cereal App',
                                        //               fontWeight:
                                        //                   FontWeight.w500,
                                        //             ),
                                        //           ),
                                        //         ),
                                        //         Align(
                                        //           alignment:
                                        //               Alignment.centerLeft,
                                        //           child: Text(
                                        //             "Followers",
                                        //             overflow:
                                        //                 TextOverflow.ellipsis,
                                        //             textAlign: TextAlign.center,
                                        //             style: TextStyle(
                                        //               color: ColorConstant
                                        //                   .indigo900B2,
                                        //               fontSize: getFontSize(
                                        //                 14,
                                        //               ),
                                        //               fontFamily:
                                        //                   'Airbnb Cereal App',
                                        //               fontWeight:
                                        //                   FontWeight.w400,
                                        //             ),
                                        //           ),
                                        //         ),
                                        //       ],
                                        //     ),
                                        //   ),
                                        // ),
                                        // Align(
                                        //   alignment: Alignment.bottomRight,
                                        //   child: Container(
                                        //     width: getHorizontalSize(
                                        //       61.00,
                                        //     ),
                                        //     margin: EdgeInsets.only(
                                        //       left: getHorizontalSize(
                                        //         60.00,
                                        //       ),
                                        //       top: getVerticalSize(
                                        //         10.00,
                                        //       ),
                                        //       right: getHorizontalSize(
                                        //         60.00,
                                        //       ),
                                        //     ),
                                        //     child: Column(
                                        //       mainAxisSize: MainAxisSize.min,
                                        //       crossAxisAlignment:
                                        //           CrossAxisAlignment.center,
                                        //       mainAxisAlignment:
                                        //           MainAxisAlignment.start,
                                        //       children: [
                                        //         Padding(
                                        //           padding: EdgeInsets.only(
                                        //             left: getHorizontalSize(
                                        //               16.00,
                                        //             ),
                                        //             right: getHorizontalSize(
                                        //               16.00,
                                        //             ),
                                        //           ),
                                        //           child: Text(
                                        //             "537",
                                        //             overflow:
                                        //                 TextOverflow.ellipsis,
                                        //             textAlign: TextAlign.center,
                                        //             style: TextStyle(
                                        //               color: ColorConstant
                                        //                   .indigo900,
                                        //               fontSize: getFontSize(
                                        //                 17,
                                        //               ),
                                        //               fontFamily:
                                        //                   'Airbnb Cereal App',
                                        //               fontWeight:
                                        //                   FontWeight.w500,
                                        //             ),
                                        //           ),
                                        //         ),
                                        //         Align(
                                        //           alignment:
                                        //               Alignment.centerLeft,
                                        //           child: Text(
                                        //             "Following",
                                        //             overflow:
                                        //                 TextOverflow.ellipsis,
                                        //             textAlign: TextAlign.center,
                                        //             style: TextStyle(
                                        //               color: ColorConstant
                                        //                   .indigo900B2,
                                        //               fontSize: getFontSize(
                                        //                 14,
                                        //               ),
                                        //               fontFamily:
                                        //                   'Airbnb Cereal App',
                                        //               fontWeight:
                                        //                   FontWeight.w400,
                                        //             ),
                                        //           ),
                                        //         ),
                                        //       ],
                                        //     ),
                                        //   ),
                                        // ),
                                        // Align(
                                        //   alignment: Alignment.topCenter,
                                        //   child: Container(
                                        //     width: size.width,
                                        //     margin: EdgeInsets.only(
                                        //       left: getHorizontalSize(
                                        //         24.00,
                                        //       ),
                                        //       top: getVerticalSize(
                                        //         44.00,
                                        //       ),
                                        //       right: getHorizontalSize(
                                        //         24.00,
                                        //       ),
                                        //       bottom: getVerticalSize(
                                        //         44.00,
                                        //       ),
                                        //     ),
                                        //     child: Row(
                                        //       mainAxisAlignment:
                                        //           MainAxisAlignment
                                        //               .spaceBetween,
                                        //       crossAxisAlignment:
                                        //           CrossAxisAlignment.center,
                                        //       mainAxisSize: MainAxisSize.max,
                                        //       children: [
                                        //         SizedBox(
                                        //           height: getSize(
                                        //             48.00,
                                        //           ),
                                        //           width: getSize(
                                        //             48.00,
                                        //           ),
                                        //           child: SvgPicture.asset(
                                        //             ImageConstant.imgBackbutton,
                                        //             fit: BoxFit.fill,
                                        //           ),
                                        //         ),
                                        //         Container(
                                        //           height: getSize(
                                        //             48.00,
                                        //           ),
                                        //           width: getSize(
                                        //             48.00,
                                        //           ),
                                        //           decoration: BoxDecoration(
                                        //             color: ColorConstant
                                        //                 .whiteA700Cc,
                                        //             borderRadius:
                                        //                 BorderRadius.circular(
                                        //               getHorizontalSize(
                                        //                 24.00,
                                        //               ),
                                        //             ),
                                        //           ),
                                        //           child: Card(
                                        //             clipBehavior:
                                        //                 Clip.antiAlias,
                                        //             elevation: 0,
                                        //             margin:
                                        //                 const EdgeInsets.all(0),
                                        //             color: ColorConstant
                                        //                 .whiteA700Cc,
                                        //             shape:
                                        //                 RoundedRectangleBorder(
                                        //               borderRadius:
                                        //                   BorderRadius.circular(
                                        //                 getHorizontalSize(
                                        //                   24.00,
                                        //                 ),
                                        //               ),
                                        //             ),
                                        //             child: Stack(
                                        //               children: [
                                        //                 Align(
                                        //                   alignment:
                                        //                       Alignment.center,
                                        //                   child: Padding(
                                        //                     padding:
                                        //                         EdgeInsets.only(
                                        //                       left:
                                        //                           getHorizontalSize(
                                        //                         15.11,
                                        //                       ),
                                        //                       top:
                                        //                           getVerticalSize(
                                        //                         16.00,
                                        //                       ),
                                        //                       right:
                                        //                           getHorizontalSize(
                                        //                         15.11,
                                        //                       ),
                                        //                       bottom:
                                        //                           getVerticalSize(
                                        //                         16.00,
                                        //                       ),
                                        //                     ),
                                        //                     child: SizedBox(
                                        //                       height:
                                        //                           getVerticalSize(
                                        //                         16.00,
                                        //                       ),
                                        //                       width:
                                        //                           getHorizontalSize(
                                        //                         17.78,
                                        //                       ),
                                        //                       child: SvgPicture
                                        //                           .asset(
                                        //                         ImageConstant
                                        //                             .imgMessage,
                                        //                         fit:
                                        //                             BoxFit.fill,
                                        //                       ),
                                        //                     ),
                                        //                   ),
                                        //                 ),
                                        //               ],
                                        //             ),
                                        //           ),
                                        //         ),
                                        //       ],
                                        //     ),
                                        //   ),
                                        // ),
                                      ],
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                    left: getHorizontalSize(
                                      48.00,
                                    ),
                                    top: getVerticalSize(
                                      14.00,
                                    ),
                                    right: getHorizontalSize(
                                      48.00,
                                    ),
                                  ),
                                  child: Text(
                                    controller.profile!.user!.name.toString(),
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      color: ColorConstant.indigo900,
                                      fontSize: getFontSize(
                                        17,
                                      ),
                                      fontFamily: 'Airbnb Cereal App',
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                                Container(
                                  width: getHorizontalSize(
                                    204.00,
                                  ),
                                  margin: EdgeInsets.only(
                                    left: getHorizontalSize(
                                      48.00,
                                    ),
                                    top: getVerticalSize(
                                      8.00,
                                    ),
                                    right: getHorizontalSize(
                                      48.00,
                                    ),
                                  ),
                                  child: Text(
                                    controller.profile!.bio ?? "",
                                    maxLines: null,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: ColorConstant.indigo900B2,
                                      fontSize: getFontSize(
                                        14,
                                      ),
                                      fontFamily: 'Airbnb Cereal App',
                                      fontWeight: FontWeight.w400,
                                      height: 1.71,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                    left: getHorizontalSize(
                                      48.00,
                                    ),
                                    top: getVerticalSize(
                                      24.00,
                                    ),
                                    right: getHorizontalSize(
                                      48.00,
                                    ),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      // Container(
                                      //   alignment: Alignment.center,
                                      //   height: getVerticalSize(
                                      //     56.00,
                                      //   ),
                                      //   width: getHorizontalSize(
                                      //     148.00,
                                      //   ),
                                      //   decoration: BoxDecoration(
                                      //     color: ColorConstant.deepPurpleA100,
                                      //     borderRadius: BorderRadius.circular(
                                      //       getHorizontalSize(
                                      //         100.00,
                                      //       ),
                                      //     ),
                                      //   ),
                                      //   child: Text(
                                      //     "Follow",
                                      //     textAlign: TextAlign.center,
                                      //     style: TextStyle(
                                      //       color: ColorConstant.whiteA700,
                                      //       fontSize: getFontSize(
                                      //         15,
                                      //       ),
                                      //       fontFamily: 'Airbnb Cereal App',
                                      //       fontWeight: FontWeight.w500,
                                      //       height: 1.60,
                                      //     ),
                                      //   ),
                                      // ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                          left: getHorizontalSize(
                                            16.00,
                                          ),
                                        ),
                                        child: InkWell(
                                          onTap: () {
                                            controller.clearUserdata();
                                          },
                                          child: Container(
                                            alignment: Alignment.center,
                                            height: getVerticalSize(
                                              56.00,
                                            ),
                                            width: getHorizontalSize(
                                              148.00,
                                            ),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(
                                                getHorizontalSize(
                                                  100.00,
                                                ),
                                              ),
                                              border: Border.all(
                                                color: ColorConstant
                                                    .deepPurpleA10051,
                                                width: getHorizontalSize(
                                                  1.00,
                                                ),
                                              ),
                                            ),
                                            child: Text(
                                              "Logout",
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                color: ColorConstant.indigo900,
                                                fontSize: getFontSize(
                                                  15,
                                                ),
                                                fontFamily: 'Airbnb Cereal App',
                                                fontWeight: FontWeight.w500,
                                                height: 1.60,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            // Padding(
                            //   padding: EdgeInsets.only(
                            //     top: getVerticalSize(
                            //       40.00,
                            //     ),
                            //   ),
                            //   child: Column(
                            //     mainAxisSize: MainAxisSize.min,
                            //     mainAxisAlignment: MainAxisAlignment.start,
                            //     children: [
                            //       Align(
                            //         alignment: Alignment.centerLeft,
                            //         child: Row(
                            //           mainAxisAlignment:
                            //               MainAxisAlignment.spaceBetween,
                            //           crossAxisAlignment:
                            //               CrossAxisAlignment.start,
                            //           mainAxisSize: MainAxisSize.max,
                            //           children: [
                            //             Padding(
                            //               padding: EdgeInsets.only(
                            //                 left: getHorizontalSize(
                            //                   32.00,
                            //                 ),
                            //               ),
                            //               child: Row(
                            //                 crossAxisAlignment:
                            //                     CrossAxisAlignment.center,
                            //                 mainAxisSize: MainAxisSize.min,
                            //                 children: [
                            //                   Text(
                            //                     "All",
                            //                     overflow: TextOverflow.ellipsis,
                            //                     textAlign: TextAlign.left,
                            //                     style: TextStyle(
                            //                       color:
                            //                           ColorConstant.indigo900,
                            //                       fontSize: getFontSize(
                            //                         17,
                            //                       ),
                            //                       fontFamily:
                            //                           'Airbnb Cereal App',
                            //                       fontWeight: FontWeight.w500,
                            //                     ),
                            //                   ),
                            //                   Padding(
                            //                     padding: EdgeInsets.only(
                            //                       left: getHorizontalSize(
                            //                         40.00,
                            //                       ),
                            //                     ),
                            //                     child: Text(
                            //                       "Photo",
                            //                       overflow:
                            //                           TextOverflow.ellipsis,
                            //                       textAlign: TextAlign.left,
                            //                       style: TextStyle(
                            //                         color: ColorConstant
                            //                             .indigo90066,
                            //                         fontSize: getFontSize(
                            //                           17,
                            //                         ),
                            //                         fontFamily:
                            //                             'Airbnb Cereal App',
                            //                         fontWeight: FontWeight.w500,
                            //                       ),
                            //                     ),
                            //                   ),
                            //                   Padding(
                            //                     padding: EdgeInsets.only(
                            //                       left: getHorizontalSize(
                            //                         40.00,
                            //                       ),
                            //                     ),
                            //                     child: Text(
                            //                       "Video",
                            //                       overflow:
                            //                           TextOverflow.ellipsis,
                            //                       textAlign: TextAlign.left,
                            //                       style: TextStyle(
                            //                         color: ColorConstant
                            //                             .indigo90066,
                            //                         fontSize: getFontSize(
                            //                           17,
                            //                         ),
                            //                         fontFamily:
                            //                             'Airbnb Cereal App',
                            //                         fontWeight: FontWeight.w500,
                            //                       ),
                            //                     ),
                            //                   ),
                            //                 ],
                            //               ),
                            //             ),
                            //             Padding(
                            //               padding: EdgeInsets.only(
                            //                 top: getVerticalSize(
                            //                   5.00,
                            //                 ),
                            //                 right: getHorizontalSize(
                            //                   32.00,
                            //                 ),
                            //                 bottom: getVerticalSize(
                            //                   4.00,
                            //                 ),
                            //               ),
                            //               child: SizedBox(
                            //                 height: getVerticalSize(
                            //                   13.00,
                            //                 ),
                            //                 width: getHorizontalSize(
                            //                   4.00,
                            //                 ),
                            //                 child: SvgPicture.asset(
                            //                   ImageConstant.imgMenubutton,
                            //                   fit: BoxFit.fill,
                            //                 ),
                            //               ),
                            //             ),
                            //           ],
                            //         ),
                            //       ),
                            //       Align(
                            //         alignment: Alignment.centerLeft,
                            //         child: Container(
                            //           height: getSize(
                            //             5.00,
                            //           ),
                            //           width: getSize(
                            //             5.00,
                            //           ),
                            //           margin: EdgeInsets.only(
                            //             left: getHorizontalSize(
                            //               40.00,
                            //             ),
                            //             top: getVerticalSize(
                            //               2.00,
                            //             ),
                            //             right: getHorizontalSize(
                            //               40.00,
                            //             ),
                            //           ),
                            //           decoration: BoxDecoration(
                            //             color: ColorConstant.deepPurpleA100,
                            //             borderRadius: BorderRadius.circular(
                            //               getHorizontalSize(
                            //                 80.00,
                            //               ),
                            //             ),
                            //           ),
                            //         ),
                            //       ),
                            //     ],
                            //   ),
                            // ),

                            // Align(
                            //   alignment: Alignment.center,
                            //   child: Padding(
                            //     padding: EdgeInsets.only(
                            //       left: getHorizontalSize(
                            //         24.00,
                            //       ),
                            //       top: getVerticalSize(
                            //         11.00,
                            //       ),
                            //       right: getHorizontalSize(
                            //         23.00,
                            //       ),
                            //     ),
                            //     child: GridView.builder(
                            //       shrinkWrap: true,
                            //       gridDelegate:
                            //           SliverGridDelegateWithFixedCrossAxisCount(
                            //         mainAxisExtent: getVerticalSize(
                            //           118.00,
                            //         ),
                            //         crossAxisCount: 3,
                            //         mainAxisSpacing: getHorizontalSize(
                            //           8.00,
                            //         ),
                            //         crossAxisSpacing: getHorizontalSize(
                            //           8.00,
                            //         ),
                            //       ),
                            //       physics: const NeverScrollableScrollPhysics(),
                            //       itemCount: 9,
                            //       itemBuilder: (context, index) {
                            //         return const ProfileItemWidget();
                            //       },
                            //     ),
                            //   ),
                            // ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // Container(
            //   decoration: BoxDecoration(
            //     color: ColorConstant.whiteA700Cc,
            //   ),
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //     crossAxisAlignment: CrossAxisAlignment.center,
            //     mainAxisSize: MainAxisSize.max,
            //     children: [
            //       Padding(
            //         padding: EdgeInsets.only(
            //           top: getVerticalSize(
            //             30.00,
            //           ),
            //           bottom: getVerticalSize(
            //             30.00,
            //           ),
            //         ),
            //         child: SizedBox(
            //           height: getVerticalSize(
            //             20.00,
            //           ),
            //           width: getHorizontalSize(
            //             19.00,
            //           ),
            //           child: SvgPicture.asset(
            //             ImageConstant.imgHome,
            //             fit: BoxFit.fill,
            //           ),
            //         ),
            //       ),
            //       Padding(
            //         padding: EdgeInsets.only(
            //           top: getVerticalSize(
            //             30.00,
            //           ),
            //           bottom: getVerticalSize(
            //             30.78,
            //           ),
            //         ),
            //         child: SizedBox(
            //           height: getVerticalSize(
            //             19.22,
            //           ),
            //           width: getHorizontalSize(
            //             18.76,
            //           ),
            //           child: SvgPicture.asset(
            //             ImageConstant.imgSearch,
            //             fit: BoxFit.fill,
            //           ),
            //         ),
            //       ),
            //       Padding(
            //         padding: EdgeInsets.only(
            //           top: getVerticalSize(
            //             24.00,
            //           ),
            //           bottom: getVerticalSize(
            //             24.00,
            //           ),
            //         ),
            //         child: SizedBox(
            //           height: getSize(
            //             32.00,
            //           ),
            //           width: getSize(
            //             32.00,
            //           ),
            //           child: SvgPicture.asset(
            //             ImageConstant.imgAddbutton,
            //             fit: BoxFit.fill,
            //           ),
            //         ),
            //       ),
            //       Padding(
            //         padding: EdgeInsets.only(
            //           top: getVerticalSize(
            //             30.00,
            //           ),
            //           bottom: getVerticalSize(
            //             30.00,
            //           ),
            //         ),
            //         child: SizedBox(
            //           height: getVerticalSize(
            //             20.00,
            //           ),
            //           width: getHorizontalSize(
            //             17.00,
            //           ),
            //           child: SvgPicture.asset(
            //             ImageConstant.imgNotification,
            //             fit: BoxFit.fill,
            //           ),
            //         ),
            //       ),
            //       Padding(
            //         padding: EdgeInsets.only(
            //           top: getVerticalSize(
            //             27.00,
            //           ),
            //           bottom: getVerticalSize(
            //             27.00,
            //           ),
            //         ),
            //         child: ClipRRect(
            //           borderRadius: BorderRadius.circular(
            //             getSize(
            //               13.00,
            //             ),
            //           ),
            //           child: Image.asset(
            //             ImageConstant.imgProfilepicture,
            //             height: getSize(
            //               26.00,
            //             ),
            //             width: getSize(
            //               26.00,
            //             ),
            //             fit: BoxFit.fill,
            //           ),
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
