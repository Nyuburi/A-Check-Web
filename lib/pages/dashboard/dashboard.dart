import 'package:a_check_web/pages/dashboard/dashboard_con.dart';
import 'package:a_check_web/utils/abstracts.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => DashboardState();
}

class DashboardView extends WidgetView<Dashboard, DashboardState> {
  const DashboardView(super.state, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      body:SingleChildScrollView(
        child:
          Column(
          mainAxisAlignment:MainAxisAlignment.start,
          crossAxisAlignment:CrossAxisAlignment.center,
          mainAxisSize:MainAxisSize.max,
          children: [
            Card(
              margin:const EdgeInsets.fromLTRB(16, 30, 16, 0),
              color:const Color(0xffffffff),
              shadowColor:const Color(0xffd5d2d2),
              elevation:4,
              shape:RoundedRectangleBorder(
                borderRadius:BorderRadius.circular(16.0),
                side: const BorderSide(color:Color(0x4d9e9e9e), width:1),
              ),
              child:
              const Padding(
                padding:EdgeInsets.all(16),
                child:
                Column(
                  mainAxisAlignment:MainAxisAlignment.start,
                  crossAxisAlignment:CrossAxisAlignment.start,
                  mainAxisSize:MainAxisSize.max,
                  children: [
                    Text(
                      "Most Accumulated Absences",
                      textAlign: TextAlign.start,
                      overflow:TextOverflow.clip,
                      style:TextStyle(
                        fontWeight:FontWeight.w700,
                        fontStyle:FontStyle.normal,
                        fontSize:16,
                        color:Color(0xff000000),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            Card(
              margin:const EdgeInsets.fromLTRB(16, 16, 16, 30),
              color:const Color(0xffffffff),
              shadowColor:const Color(0xffd5d2d2),
              elevation:4,
              shape:RoundedRectangleBorder(
                borderRadius:BorderRadius.circular(16.0),
                side: const BorderSide(color:Color(0x4d9e9e9e), width:1),
              ),
              child:
              const Padding(
                padding:EdgeInsets.all(16),
                child:
                Column(
                  mainAxisAlignment:MainAxisAlignment.start,
                  crossAxisAlignment:CrossAxisAlignment.start,
                  mainAxisSize:MainAxisSize.max,
                  children: [
                    Text(
                      "Support",
                      textAlign: TextAlign.start,
                      overflow:TextOverflow.clip,
                      style:TextStyle(
                        fontWeight:FontWeight.w700,
                        fontStyle:FontStyle.normal,
                        fontSize:16,
                        color:Color(0xff000000),
                      ),
                    ),
                    Padding(
                      padding:EdgeInsets.fromLTRB(0, 30, 0, 0),
                      child:ListTile(
                        tileColor:Color(0x00ffffff),
                        title:Text("Help",
                          style:TextStyle(
                            fontWeight:FontWeight.w400,
                            fontStyle:FontStyle.normal,
                            fontSize:16,
                            color:Color(0xff000000),
                          ),
                          textAlign:TextAlign.start,
                        ),
                        dense:false,
                        contentPadding:EdgeInsets.all(0),
                        selected:false,
                        selectedTileColor:Color(0x42000000),
                        shape:RoundedRectangleBorder(
                          borderRadius:BorderRadius.zero,
                        ),
                        trailing:Icon(Icons.arrow_forward_ios,color:Color(0xff767678),size:18),
                      ),
                    ),
                    Divider(
                      color:Color(0xff808080),
                      height:16,
                      thickness:0.3,
                      indent:0,
                      endIndent:0,
                    ),
                    ListTile(
                      tileColor:Color(0x00ffffff),
                      title:Text("Contact Us",
                        style:TextStyle(
                          fontWeight:FontWeight.w400,
                          fontStyle:FontStyle.normal,
                          fontSize:16,
                          color:Color(0xff000000),
                        ),
                        textAlign:TextAlign.start,
                      ),
                      dense:false,
                      contentPadding:EdgeInsets.all(0),
                      selected:false,
                      selectedTileColor:Color(0x42000000),
                      shape:RoundedRectangleBorder(
                        borderRadius:BorderRadius.zero,
                      ),
                      trailing:Icon(Icons.arrow_forward_ios,color:Color(0xff767678),size:18),
                    ),
                  ],),),
            ),
          ],
        ),
      ),
    );
  }
}
