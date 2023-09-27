import 'package:flutter/material.dart';
import 'package:maarifkids/contants.dart';
import 'package:maarifkids/widgets/navigator_class.dart';

import '../../utils/custom_date_picker.dart';
import '../EventProgram/admin_progress_tracking_results_page.dart';


class AdminProgressViewOldPage extends StatelessWidget {
  const AdminProgressViewOldPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
        title: progressTrackingString,
        context: context,
        isFromSearch: false,
        isAdminColor: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: adminAppColor,
                      )),
                  child: TextButton(
                    onPressed: () {
                   NavigationHelper.pushPage(context, AdminProgressTrackingViewOldResultsPage(isFromSearch: false,));
                      //TODO: make sure that the user is not empty.
                      //TODO: make sure that the subject is not empty
                      //TODO: make sure that the message is not empty
                      //TODO: check if there is any attachement attached.
                    },
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.remove_red_eye,
                              size: 20,
                              color: adminAppColor,
                            ),
                          ],
                        ),
                        Text(
                          'Publish',
                          style: TextStyle(
                              color: adminAppColor,
                              fontSize: 10,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: 15,
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Container(
                            width: 60,
                            height: 30,
                            decoration: BoxDecoration(
                                color: adminAppColor,
                                borderRadius: BorderRadius.circular(8)),
                            child: Center(
                                child: Text(
                              'Student',
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                              ),
                            ))),
                        Container(
                          width: 210,
                          child: TextField(
                            decoration: InputDecoration(
                              suffixIcon:Icon(
Icons.search,color: Theme.of(context).primaryColor,                              )
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                            width: 65,
                            height: 40,
                            decoration: BoxDecoration(
                                color: adminAppColor,
                                borderRadius: BorderRadius.circular(8)),
                            child: Center(
                                child: Text(
                                  textAlign:TextAlign.center,
                              'Academic Year',
                              style: TextStyle(

                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                              ),

                            ))),
                        Container(
                          width: 210,
                          child:DateSelectionWidget(),
                        ),
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
