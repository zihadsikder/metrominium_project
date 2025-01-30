import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:metrominium_project/app/modules/more/views/more_view.dart';
import 'package:metrominium_project/app/modules/request/views/request_view.dart';
import 'package:metrominium_project/app/modules/services/views/services_view.dart';

import '../../../core/config/App_colors.dart';
import '../../home/views/home_view.dart';
import '../controllers/nevbar_controller.dart';

class NevbarView extends GetView<NevbarController> {
NevbarView({super.key});
  final List pages = [
    const HomeView(),
    const RequestView(),
    ServicesView(),
    const MoreView(),
  ];

  @override
  Widget build(BuildContext context) {

    return GetBuilder<NevbarController>(
        builder: (controller) {
          return Scaffold(
            backgroundColor: AppColors.secondaryColor,
            body: pages[controller.currentIndex],
            bottomNavigationBar: ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(30.0),
                topRight: Radius.circular(30.0),
              ),
              child: BottomNavigationBar(
                type: BottomNavigationBarType.fixed,
                backgroundColor: Colors.blue[900],
                onTap: (index) {
                  if (index == 3) {
                    _showMoreOptions(context); // Show modal for "More"
                  } else {
                    controller.changeIndex(index);
                  }
                },
                currentIndex: controller.currentIndex,
                selectedItemColor: AppColors.secondaryColor,
                unselectedItemColor: Colors.grey.shade500,
                showUnselectedLabels: true,
                showSelectedLabels: true,
                items: const <BottomNavigationBarItem>[
                  BottomNavigationBarItem(label: ("Home"), icon: Icon(Icons.dashboard_outlined)),
                  BottomNavigationBarItem(
                      label: ("Request"), icon: Icon(Icons.request_page_outlined)),
                  BottomNavigationBarItem(
                      label: ("Services"), icon: Icon(Icons.settings)),
                  BottomNavigationBarItem(
                      label: ("More"), icon: Icon(Icons.more_horiz_outlined)),
                ],
              ),
            ),
          );
        }
    );
  }
void _showMoreOptions(BuildContext context) {
  showModalBottomSheet(
    context: context,
    //isScrollControlled: true, // Allow modal to expand properly
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(30.r)),
    ),
    builder: (context) {
      return Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.expand_more, size: 30, color: Colors.grey),
            SizedBox(height: 16.h),
            SizedBox(
              //height: 300, // Set height explicitly to avoid overflow
              child: GridView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: 13, // Total number of items
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4, // Number of columns
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                ),
                itemBuilder: (context, index) {
                  final item = controller.gridItems[index];
                  return GestureDetector(
                    onTap: () {
                      // Handle tap on each grid item
                      Navigator.pop(context); // Close modal on tap
                    },
                    child: Column(
                      //mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(13),
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Icon(
                            item.icon, // Dynamic icon
                            size: 24,
                            color: Colors.blue[900],
                          ),
                        ),
                  SizedBox(height: 8.h),
                        Text(
                          item.title, // Dynamic title
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 12.sp),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      );
    },
  );
}

}