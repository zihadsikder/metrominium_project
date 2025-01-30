import 'package:get/get.dart';

import '../modal/category_model.dart';
import '../modal/service_model.dart';

class ServicesController extends GetxController {
  var categories = <CategoryModel>[].obs;
  var services = <ServiceModel>[].obs;
  var selectedCategoryId = ''.obs;

  @override
  void onInit() {
    super.onInit();
    _loadCategories();
    _loadServices();
    // Select first category by default
    if (categories.isNotEmpty) {
      selectedCategoryId.value = categories[0].id;
    }
  }

  void selectCategory(String id) {
    selectedCategoryId.value = id;
    // Here you would typically fetch services for the selected category
  }

  void _loadCategories() {
    categories.value = [
      CategoryModel(
        id: '1',
        name: 'Shifting',
        icon: '🚚',
        isSelected: true,
      ),
      CategoryModel(
        id: '2',
        name: 'Plumbing',
        icon: '🚰',
      ),
      CategoryModel(
        id: '3',
        name: 'Painting & Renovation',
        icon: '🏠',
      ),
      CategoryModel(
        id: '4',
        name: 'House Cleaning',
        icon: '🧹',
      ),
    ];
  }

  void _loadServices() {
    services.value = [
      ServiceModel(
        id: '1',
        name: 'Bachelor Shifting',
        description: 'We are well-equipped and well-prepared with experts to offer you the best service...',
        imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR7PxFUsylw6ztJ543dnU6d2EWp8xH2DaEB3A&s',
        servicesCount: 0,
        categoryId: '1',
      ),
      ServiceModel(
        id: '2',
        name: 'Family Shifting',
        description: 'We are well-equipped with experts to offer you the best service...',
        imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR7PxFUsylw6ztJ543dnU6d2EWp8xH2DaEB3A&s',
        servicesCount: 0,
        categoryId: '1',
      ),
      ServiceModel(
        id: '3',
        name: 'Office Shifting',
        description: 'We are well-equipped and well-prepared with experts to offer you the best service...',
        imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR7PxFUsylw6ztJ543dnU6d2EWp8xH2DaEB3A&s',
        servicesCount: 1,
        categoryId: '1',
      ),
    ];
  }

  List<ServiceModel> getServicesForCategory(String categoryId) {
    return services.where((service) => service.categoryId == categoryId).toList();
  }
}