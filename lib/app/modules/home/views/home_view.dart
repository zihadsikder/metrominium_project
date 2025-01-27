import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:metrominium_project/app/core/constant/app_assets.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: _buildAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Business Summary Section
              const Text(
                'Business Summary',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              const BusinessSummary(),
              const SizedBox(height: 32),

              // Highlighted Section
              Center(child: _buildHighlightedSection()),
              const SizedBox(height: 32),

              Row(
                children: [
                  Icon(
                    Icons.person,
                    color: Colors.blue.shade300,
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Text(
                    ' Recent Booking Activities',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.black),
                  ),
                ],
              ),
              // Tab Section
              Column(
                children: [
                  TabBar(
                    isScrollable: true,
                    controller: controller.tabController,
                    labelColor: Colors.blue.shade800,

                    dividerHeight: 0,
                    //indicatorSize: TabBarIndicatorSize.tab,
                    padding: EdgeInsets.zero,
                    labelStyle:
                        TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
                    unselectedLabelColor: Colors.grey,
                    tabs: controller.tab,
                    tabAlignment: TabAlignment.start,
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    height: 300, // Set height for TabBarView
                    child: TabBarView(
                      controller: controller.tabController,
                      children: [
                        const BookingList(),
                        Center(
                          child: Text(
                            'Customized Bookings',
                            style: TextStyle(
                                fontSize: 18, color: Colors.grey[700]),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.person,
                        color: Colors.blue.shade300,
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Text(
                        'My Subscription',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.black),
                      ),
                      Spacer(),
                      Text(
                        'View All',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.yellow.shade800,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ],
                  ),
                  SubscriptionList(),
                  SizedBox(
                    height: 16,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.person,
                        color: Colors.blue.shade300,
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Text(
                        'Serviceman List',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.black),
                      ),
                      Spacer(),
                      Text(
                        'View All',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.yellow.shade800,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  SizedBox(
                    height: 400,
                    // Or another specific value to constrain the GridView
                    child: GridView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 16,
                        mainAxisSpacing: 16,
                        childAspectRatio: 1,
                      ),
                      padding: const EdgeInsets.all(16),
                      itemCount: 3,
                      itemBuilder: (context, index) {
                        return Container(
                          width: 100,
                          height: 100,
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.2),
                                spreadRadius: 2,
                                blurRadius: 5,
                                offset: Offset(0, 3),
                              ),
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.person, size: 40, color: Colors.blue),
                              const SizedBox(height: 8),
                              Text(
                                'Alex Handle',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black87,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                '+88255555210',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey[600],
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  // AppBar
  AppBar _buildAppBar() {
    return AppBar(
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
          const SizedBox(width: 8),
          Text(
            'Metrominas',
            style: TextStyle(color: Colors.blue[900], fontSize: 20),
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

  // Highlighted Section Widget
  Widget _buildHighlightedSection() {
    return Column(
      children: [
        Image.asset(AppAssets.announce, height: 60),
        const Text(
          'Want To Get Highlighted',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        Text(
          'Create to get highlight on the\napp and web browser',
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.grey[600]),
        ),
        const SizedBox(height: 16),
        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue[900],
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          child: const Text(
            'Create Ads',
            style: TextStyle(
                fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
      ],
    );
  }
}

// Business Summary Widget
class BusinessSummary extends GetView<HomeController> {
  const BusinessSummary({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: GridView.count(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        crossAxisCount: 2,
        childAspectRatio: 1.5,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        children: [
          _buildStatCard(
            'Total Earning',
            '\$${controller.totalEarnings.value}',
            Colors.green,
            Icons.trending_up,
          ),
          _buildStatCard(
            'Total Subscribed\n Subcategories',
            '${controller.totalSubscribers.value}',
            Colors.blue,
            Icons.people,
          ),
          _buildStatCard(
            'Total Servicemen',
            '${controller.totalServices.value}',
            Colors.orange,
            Icons.build,
          ),
          _buildStatCard(
            'Total Booking\nServed',
            '${controller.totalBookings.value}',
            Colors.indigo,
            Icons.calendar_today,
          ),
        ],
      ),
    );
  }

  Widget _buildStatCard(
      String title, String value, Color color, IconData icon) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                value,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Icon(icon, color: Colors.white70),
            ],
          ),
          Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}

// Booking List Widget
class BookingList extends StatelessWidget {
  const BookingList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.all(8),
      itemCount: 7,
      itemBuilder: (context, index) {
        return ListTile(
          leading: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(
              'https://images.unsplash.com/photo-1621801306185-8c0ccf9c8eb8?fm=jpg&q=60&w=3000&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8aW5kaWFuJTIwbWFycmlhZ2V8ZW58MHx8MHx8fDA%3D',
              width: 60,
              height: 60,
              fit: BoxFit.cover,
            ),
          ),
          title: Text('Booking# ${555205 + index}'),
          subtitle: const Text('01.25.2025 || 03:47'),
          trailing: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: Colors.blue[50],
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Text(
              'Pending',
              style: TextStyle(color: Colors.blue),
            ),
          ),
        );
      },
    );
  }
}

class SubscriptionList extends StatelessWidget {
  const SubscriptionList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120, // Constrain height for horizontal scrolling
      child: ListView.builder(
        //physics: NeverScrollableScrollPhysics(),
        scrollDirection: Axis.horizontal, // Make the list horizontal
        padding: const EdgeInsets.all(8),
        itemCount: 7, // Number of items
        itemBuilder: (context, index) {
          return Container(
            width: 250,
            margin: const EdgeInsets.only(right: 16), // Spacing between items
            child: ListTile(
              contentPadding: EdgeInsets.zero, // Remove default padding
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  'https://images.unsplash.com/photo-1621801306185-8c0ccf9c8eb8?fm=jpg&q=60&w=3000&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8aW5kaWFuJTIwbWFycmlhZ2V8ZW58MHx8MHx8fDA%3D',
                  width: 60,
                  height: 80,
                  fit: BoxFit.cover,
                ),
              ),

              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    'Furniture Cleaning',
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text('2 Services'),
                  Text('4 Booking Complete'),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
