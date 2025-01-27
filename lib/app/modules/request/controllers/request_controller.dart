import 'package:get/get.dart';

import '../Modal/booking_model.dart';

class RequestController extends GetxController {
  var selectedTab = 'All'.obs;
  var bookings = <BookingModel>[].obs;
  var filteredBookings = <BookingModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    // Initialize with dummy data
    bookings.value = [
      BookingModel(
        id: '100120',
        serviceName: 'Ambulance Service',
        bookingDate: DateTime(2025, 1, 23, 18, 10),
        scheduledDate: DateTime(2025, 1, 23, 18, 12),
        totalAmount: 2997.00,
        status: 'pending',
      ),
      BookingModel(
        id: '100119',
        serviceName: 'Refrigerator Repair',
        bookingDate: DateTime(2025, 1, 23, 18, 8),
        scheduledDate: DateTime(2025, 1, 23, 18, 10),
        totalAmount: 845.20,
        status: 'accepted',
      ),
      BookingModel(
        id: '100119',
        serviceName: 'Refrigerator Repair',
        bookingDate: DateTime(2025, 1, 23, 18, 8),
        scheduledDate: DateTime(2025, 1, 23, 18, 10),
        totalAmount: 845.20,
        status: 'accepted',
      ),
      // Add more bookings as needed
    ];
    filterBookings();
  }

  void changeTab(String tab) {
    selectedTab.value = tab;
    filterBookings();
  }

  void filterBookings() {
    if (selectedTab.value == 'All') {
      filteredBookings.value = bookings;
    } else {
      filteredBookings.value = bookings.where(
              (booking) => booking.status.toLowerCase() == selectedTab.value.toLowerCase()
      ).toList();
    }
  }

  int getCount(String status) {
    if (status == 'All') return bookings.length;
    return bookings.where((booking) =>
    booking.status.toLowerCase() == status.toLowerCase()
    ).length;
  }
}
