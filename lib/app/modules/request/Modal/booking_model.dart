class BookingModel {
  final String id;
  final String serviceName;
  final DateTime bookingDate;
  final DateTime scheduledDate;
  final double totalAmount;
  final String status;

  BookingModel({
    required this.id,
    required this.serviceName,
    required this.bookingDate,
    required this.scheduledDate,
    required this.totalAmount,
    required this.status,
  });
}