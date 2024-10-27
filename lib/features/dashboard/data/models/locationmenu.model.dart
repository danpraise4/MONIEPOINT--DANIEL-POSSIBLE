class LocationMenuModel {
  final String title;
  final String icon;
  bool isSelected;

  LocationMenuModel({
    required this.title,
    required this.icon,
    this.isSelected = false,
  });
}
