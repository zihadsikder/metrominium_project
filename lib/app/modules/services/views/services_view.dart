import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../controllers/services_controller.dart';

class ServicesView extends GetView<ServicesController> {
 ServicesView({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: _buildAppBar(),
      body: Row(
        children: [
          _buildSidebar(context),
          Expanded(
            child: _buildMainContent(context),
          ),
        ],
      ),
    );
  }

  Widget _buildSidebar(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.25,
      color: Colors.white,
      child: Column(
        children: [
          Padding(
            padding:EdgeInsets.symmetric(vertical: 16.h),
            child: Text(
              'Categories',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.blue[900],
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding:
              EdgeInsets.symmetric(vertical: 8.h),
              itemCount: controller.categories.length,
              itemBuilder: (context, index) {
                final category = controller.categories[index];

                // Use Obx for widgets that depend on `isSelected`
                return Obx(() {
                  final isSelected =
                      category.id == controller.selectedCategoryId.value;

                  return GestureDetector(
                    onTap: () => controller.selectCategory(category.id),
                    child: Container(
                      margin: const EdgeInsets.symmetric(vertical: 8,horizontal: 8),
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(

                        color: isSelected
                            ? Colors.white
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(12.r),
                        border: Border.all(
                          color: isSelected ? Colors.grey.shade100 : Colors.transparent,
                          width: 6.w, // Border width
                        ),
                        // boxShadow: [
                        //   if (isSelected)
                        //     BoxShadow(
                        //       color: Colors.red.withOpacity(0.2), // Shadow color
                        //       blurRadius: 8, // Shadow blur
                        //       offset: Offset(0, 4), // Shadow position
                        //     ),
                        // ],
                      ),
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: isSelected ? Colors.blue : Colors.grey[200],
                              borderRadius: BorderRadius.circular(8.r),
                            ),
                            child: Text(
                              category.icon,
                              style: TextStyle(
                                fontSize: 24.sp,
                                color: isSelected
                                    ? Colors.white
                                    : Colors.grey[600],
                              ),
                            ),
                          ),
                       SizedBox(height: 8.h),
                          Text(
                            category.name,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 12.sp,
                              color: isSelected
                                  ? Colors.blue[900]
                                  : Colors.grey[600],
                              fontWeight:
                              isSelected ? FontWeight.w600 : FontWeight.normal,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                });
              },
            ),
          ),
        ],
      ),
    );
  }




  Widget _buildMainContent(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.75,
      padding: EdgeInsets.symmetric(horizontal: 12.w,vertical: 12.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Obx(() {
              final services = controller.getServicesForCategory(
                controller.selectedCategoryId.value,
              );
              return ListView.builder(
                itemCount: services.length,
                itemBuilder: (context, index) {
                  final service = services[index];
                  return Card(
                    color: Colors.white,
                    margin: EdgeInsets.only(bottom: 16.h),
                    child: Padding(
                      padding: EdgeInsets.all(16),
                      child: Column(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Image.network(
                                  service.imageUrl,
                                  width: 64,
                                  height: 72,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              SizedBox(width: 8.0),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      service.name,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),

                                    Text(
                                      maxLines: 3,
                                      service.description,
                                      style: TextStyle(
                                        color: Colors.grey[600],
                                        fontSize: 14,
                                      ),
                                    ),
                                    SizedBox(height: 16),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Divider(
                            thickness: 2,
                            color: Colors.grey.shade100,
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.75,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: InkWell(
                                    onTap: () {},
                                    child: Text(
                                      'Services (${service.servicesCount})',
                                      style: TextStyle(
                                          color: Colors.blue,
                                          decoration: TextDecoration.underline),
                                    ),
                                  ),
                                ),

                                Expanded(
                                  child: TextButton(
                                    onPressed: () {},
                                    style: TextButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8.r),
                                      ),
                                      backgroundColor: Colors.blue,
                                      padding: EdgeInsets.symmetric(

                                        vertical: 12.h,
                                      ),
                                    ),
                                    child: Text(
                                      'Subscribe',
                                      style: TextStyle(
                                          color: Colors
                                              .white), // Add this to make the text visible on a blue background.
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            }),
          ),
        ],
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      title: Row(
        children: [
          ClipOval(
            child: Image.network(
              'https://i.pinimg.com/550x/39/6c/d8/396cd8e1d8557f73c786892cffa4f13c.jpg',
              height: 40.h,
              width: 40.w,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 8),
          Text(
            'Metrominas',
            style: TextStyle(color: Colors.blue[900], fontSize: 20.sp),
          ),
        ],
      ),
      actions: [
        IconButton(
          icon: Icon(Icons.notifications, color: Colors.blue[900]),
          onPressed: () {},
        ),
      ],
    );
  }
}
