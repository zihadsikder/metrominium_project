class CategoryModel {
  final String id;
  final String name;
  final String icon;
  final bool isSelected;

  CategoryModel({
    required this.id,
    required this.name,
    required this.icon,
    this.isSelected = false,
  });

  CategoryModel copyWith({bool? isSelected}) {
    return CategoryModel(
      id: id,
      name: name,
      icon: icon,
      isSelected: isSelected ?? this.isSelected,
    );
  }
}