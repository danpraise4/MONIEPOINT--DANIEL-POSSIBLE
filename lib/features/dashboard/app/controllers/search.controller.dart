// ignore_for_file: implementation_imports, depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter_platform_interface/src/types/location.dart' as map;
import 'package:possible/core/resources/strings.dart';

class SearchController {
  BuildContext? context;

  SearchController();
  ValueNotifier<String> mapStyle = ValueNotifier<String>('');
  ValueNotifier<bool> showText = ValueNotifier(false);
  
  TextEditingController searchController = TextEditingController();

  AnimationController? animationController;
  
  void setContext(BuildContext context) {
    this.context = context;
  }

  // import map style from json file
  void importMapStyle() async {
    final file = await rootBundle.loadString('$mapPath/dark.json');
    mapStyle.value = file;
  }

  // On map tapped 
   void onMarkerTap( map.LatLng latLng) {
    print(latLng);
  }
}
