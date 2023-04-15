import 'package:bloc_tutorial/data/models/location_model.dart';

import '../providers/location_provider.dart';

class LocationRepository {
  Future<LocationModel> getLocation(String city) async {
    LocationProvider provider = LocationProvider();
    final locationData = await provider.getLocation(city);
    final location = LocationModel.fromJson(locationData);
    return location;
  }
}
