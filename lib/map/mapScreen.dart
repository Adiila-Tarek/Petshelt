import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:petshelt/provider/locationProvider.dart';
import 'package:provider/provider.dart';

class mapScreen extends StatefulWidget {
  const mapScreen({Key? key}) : super(key: key);
  static const String routeName = "mapScreen";

  @override
  State<mapScreen> createState() => _mapScreenState();
}

class _mapScreenState extends State<mapScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<locationProvider>(context, listen: false).initalization();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Map')), body: googleMapUi());
  }

  Widget googleMapUi() {
    return Consumer<locationProvider>(builder: (consumerContext, model, child) {
      if (model.locationPosition != null) {
        return Column(
          children: [
            const TextField(
              decoration: InputDecoration(hintText: 'Search Location'),
            ),
            Expanded(
              child: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: GoogleMap(
                  mapType: MapType.normal,
                  myLocationEnabled: true,
                  initialCameraPosition:
                      CameraPosition(target: model.locationPosition, zoom: 14),
                  myLocationButtonEnabled: true,
                  onMapCreated: (GoogleMapController controller) {},
                ),
              ),
            ),
          ],
        );
      } else {
        return Container(
          child: const Center(
            child: CircularProgressIndicator(),
          ),
        );
      }
    });
  }
}
