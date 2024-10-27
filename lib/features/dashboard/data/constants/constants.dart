import 'package:possible/core/resources/strings.dart';
import 'package:possible/features/dashboard/data/models/locationmenu.model.dart';
import 'package:possible/features/dashboard/data/models/navitem.model.dart';

List<NavigartorModel> get navItems => [
      NavigartorModel(icon: '$svgPath/icon-search.svg'),
      NavigartorModel(icon: '$svgPath/icon-message.svg'),
      NavigartorModel(icon: '$svgPath/icon-home.svg'),
      NavigartorModel(icon: '$svgPath/icon-heart.svg'),
      NavigartorModel(icon: '$svgPath/icon-user.svg'),
    ];


List<LocationMenuModel> get locationMenuItems => [
      LocationMenuModel(title: 'Cosy areas', icon: '$svgPath/icon-protect.svg'),
      LocationMenuModel(title: 'Price', icon: '$svgPath/icon-wallet.svg' , isSelected: true),
      LocationMenuModel(title: 'Infrastructure', icon: '$svgPath/icon-shop.svg'),
      LocationMenuModel(title: 'Without any layer', icon: '$svgPath/icon-stack.svg'),
    ];

String galleryUrl1 = '$imagePath/image-dc-1.png';
String galleryUrl2 = '$imagePath/image-dc-2.png';
String galleryUrl3 = '$imagePath/image-dc-4.png';

List<(String , double, double)> get locations => [
  ("10,3 mn P" , -.3,-.3),
  ("11 mn P" , -.5,-.5),
  ("7,8 mn P" , .6,0),
  ("8,5 mn P" , .6,.3),
  ("13,3 mn P" , .1,.5),
  ("6,95 mn P" , -.7,.35)
];
