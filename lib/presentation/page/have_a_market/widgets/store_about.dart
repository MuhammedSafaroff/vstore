import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:vstore_appl/presentation/page/have_a_market/widgets/custom_text_row.dart';
import 'package:vstore_appl/presentation/page/have_a_market/widgets/social_media_part.dart';

class StoreAbout extends StatefulWidget {
  StoreAbout({Key? key}) : super(key: key);

  @override
  _StoreAboutState createState() => _StoreAboutState();
}

class _StoreAboutState extends State<StoreAbout> {
  CameraPosition? _kGooglePlex;

  Completer<GoogleMapController> _controller = Completer();

  CameraPosition? _kLake;

  Future<void> _goToTheLake() async {
    final GoogleMapController controller = await _controller.future;
    await controller.animateCamera(CameraUpdate.newCameraPosition(_kLake!));
  }

  @override
  void initState() {
    super.initState();
    _kLake = CameraPosition(
        bearing: 192.8334901395799,
        target: LatLng(40.3841528, 49.879997),
        tilt: 59.440717697143555,
        zoom: 19.151926040649414);

    _kGooglePlex = CameraPosition(
      target: LatLng(40.3841528, 49.879997),
      zoom: 14.4746,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextRow(
          title: "İş vaxtı",
          description: "Hər gün 09:00 - 21:00",
        ),
        const SizedBox(height: 10),
        CustomTextRow(
          title: "Ünvan",
          description: "Azadlıq pr 124 B",
        ),
        CustomTextRow(
          title: "Əlaqə nömrəsi",
          isText: false,
          widget: IconButton(onPressed: () {}, icon: Icon(Icons.phone)),
        ),
        SocialMediaPart(),
        Container(
          margin: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
          height: 400,
          width: double.infinity,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 2,
                blurRadius: 7,
                offset: Offset(0, 3), // changes position of shadow
              ),
            ],
            borderRadius: BorderRadius.circular(30),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: GoogleMap(
              mapType: MapType.normal,
              initialCameraPosition: _kGooglePlex!,
              compassEnabled: true,
              mapToolbarEnabled: true,
              myLocationButtonEnabled: true,
              rotateGesturesEnabled: true,
              onMapCreated: (GoogleMapController controller) {
                _controller.complete(controller);
                _goToTheLake();
              },
            ),
          ),
        ),
      ],
    );
  }
}
