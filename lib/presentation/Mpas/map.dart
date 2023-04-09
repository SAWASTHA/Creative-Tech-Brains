import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';

import '../../core/utils/image_constant.dart';

class AppConstants {
  static const String mapBoxAccessToken =
      'pk.eyJ1Ijoicm9oaXR3YWdobWFyZSIsImEiOiJjbGZvMTc1Zzgwcmw0M3FwNmVvc3RiZ3MyIn0.vlpN0tuVEw4AUrg1LG8UlA';

  static const String mapBoxStyleId =
      'https://api.mapbox.com/styles/v1/rohitwaghmare/clfsd2vsb004901mrrde1bawz/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1Ijoicm9oaXR3YWdobWFyZSIsImEiOiJjbGZvMTc1Zzgwcmw0M3FwNmVvc3RiZ3MyIn0.vlpN0tuVEw4AUrg1LG8UlA';

  static var myLocation = LatLng(19.8762, 75.3433);
}

class MapMarker {
  final String? title;
  final String? address;
  final LatLng? location;
  final int? rating;

  MapMarker({
    required this.title,
    required this.address,
    required this.location,
    required this.rating,
  });
}

final mapMarkers = [
  MapMarker(
      title: 'United CIIGMA Hospital',
      address:
          'Plot no 6, 7, Darga Rd, Shahnoorwadi, Aurangabad, Maharashtra 431005',
      location: LatLng(19.8594, 75.3363),
      rating: 5),
  MapMarker(
      title: 'Kamalnayan Bajaj Hospital',
      address:
          'Gut No 43 Bajaj Marg,Beed Bypass Rd,Satara Deolai Parisar,Aurangabad,Maharashtra 431010',
      location: LatLng(19.855529, 75.315202),
      rating: 4),
  MapMarker(
      title: 'Bembde Hospital',
      address: 'Beed Bypass Rd,Sangram Nagar,Aurangabad,Maharashtra 431005',
      location: LatLng(19.8498, 75.3351),
      rating: 5),
  MapMarker(
      title: 'Hedgewar Rugnalaya',
      address:
          ' Near Gajanand Maharaj Mandir,Road,Jawahar Colony,Garkheda,Aurangabad,Maharashtra 431005',
      location: LatLng(19.8693, 75.3479),
      rating: 4),
  MapMarker(
    title: 'M.G.M. Hospital',
    address: 'Gate No. 2 ,MGM Campus,N-6,Cidco,Aurangabad,Maharashtra 431003',
    location: LatLng(19.877895, 75.354164),
    rating: 4,
  ),
  MapMarker(
    title: 'Ghati Hospital',
    address:
        'V8GV+MMR, 34, Jalna Road,near Ghati hospital,Jlal Colony,Vidya Nagar,Mondha,Aurangabad,Maharashtra 431001',
    location: LatLng(19.8767, 75.3441),
    rating: 3,
  ),
];
