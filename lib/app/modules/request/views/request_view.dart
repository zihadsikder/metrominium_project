import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../Modal/booking_model.dart';
import '../controllers/request_controller.dart';

class RequestView extends GetView<RequestController> {
  const RequestView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Row(
          children: [
            ClipOval(
              child: Image.network(
                'https://i.pinimg.com/550x/39/6c/d8/396cd8e1d8557f73c786892cffa4f13c.jpg',
                height: 40,
                width: 40,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(width: 8),
            Text(
              'Booking Requests',
              style: TextStyle(
                color: Colors.blue[900],
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.filter_list, color: Colors.blue[900]),
            onPressed: () {},
          ),
          CircleAvatar(
            radius: 16,
            backgroundColor: Colors.grey[200],
            child: Icon(Icons.person, color: Colors.blue[600]),
          ),
          SizedBox(width: 16),
        ],
      ),
      body: Column(
        children: [
          _buildFilterTabs(),
          Expanded(
            child: Obx(() => ListView.builder(
              padding: EdgeInsets.all(16),
              itemCount: controller.filteredBookings.length,
              itemBuilder: (context, index) {
                final booking = controller.filteredBookings[index];
                return _buildBookingCard(booking);
              },
            )),
          ),
        ],
      ),
    );
  }

  Widget _buildFilterTabs() {
    return Container(
      height: 48,
      margin: EdgeInsets.symmetric(vertical: 8),
      child: ListView(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: 16),
        children: [
          _buildTab('All', controller.getCount('All')),
          _buildTab('Pending', controller.getCount('pending')),
          _buildTab('Accepted', controller.getCount('accepted')),
        ],
      ),
    );
  }

  Widget _buildTab(String title, int count) {
    return Obx(() => GestureDetector(
      onTap: () => controller.changeTab(title),
      child: Container(
        margin: EdgeInsets.only(right: 8),
        padding: EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          color: controller.selectedTab.value == title
              ? Colors.blue[900]
              : Colors.blue[50],
          borderRadius: BorderRadius.circular(24),
        ),
        child: Center(
          child: Text(
            '$title ($count)',
            style: TextStyle(
              color: controller.selectedTab.value == title
                  ? Colors.white
                  : Colors.grey[800],
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    ));
  }

  Widget _buildBookingCard(BookingModel booking) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      margin: EdgeInsets.only(bottom: 16),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Booking # ${booking.id}',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.more_vert),
                  onPressed: () {},
                  padding: EdgeInsets.zero,
                  constraints: BoxConstraints(),
                ),
              ],
            ),
            Text(
              booking.serviceName,
              style: TextStyle(
                color: Colors.grey[600],
                fontSize: 14,
              ),
            ),
            Divider(thickness: 2,color: Colors.grey.shade200,),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  overflow: TextOverflow.ellipsis,
                  'Booking date:',
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 14,
                  ),
                ),
                Text(
                  DateFormat('dd MMM, yyyy hh:mm a').format(booking.bookingDate),
                  style: TextStyle(
                    color: Colors.grey[800],
                    fontSize: 14,
                  ),
                ),

              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  overflow: TextOverflow.ellipsis,
                  'Scheduled date:',
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 14,
                  ),
                ),
                Text(
                  DateFormat('dd MMM, yyyy hh:mm a').format( booking.scheduledDate),
                  style: TextStyle(
                    color: Colors.grey[800],
                    fontSize: 14,
                  ),
                ),

              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total Amount',
                  style: TextStyle(
                      color: Colors.grey[800],
                      fontSize: 14,
                      fontWeight: FontWeight.w500
                  ),
                ),
                Text(
                  '${booking.totalAmount.toStringAsFixed(2)} \$',
                  style: TextStyle(
                    color: Colors.blue[900],
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),


          ],
        ),
      ),
    );
  }


}
