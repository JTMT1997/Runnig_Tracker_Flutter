import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_maps/maps.dart';

class DetailPage extends StatefulWidget {

  final int lariId;
  const DetailPage({Key? key, required this.lariId}): super(key:key);
  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
final List<MapLatLng> _dummyRoute = const[
MapLatLng(-6.125645180219318, 106.92463298789295),//ppkdjakut
MapLatLng(-6.129136532910289, 106.91790566998586),//Simpang 5 Semper
MapLatLng(-6.157063921852733, 106.90842629639342),//Mall Kelapa Gading
MapLatLng(-6.150547379137027, 106.89093689749878)//MOI

];



  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: _buildAppBar(),
      body: _buildeBody(),
    );
  }

  AppBar _buildAppBar(){
    return AppBar(title: const Text("Detail"),);
  }

  Widget _buildeBody(){
    if (_dummyRoute.isEmpty) {
      return _buildEmptyState();
    }
    return _buildMap(_dummyRoute);
  }

Widget _buildEmptyState(){
  return const Center(
    child: Text("Belum ada data"),
  );

}

Widget _buildMap(List<MapLatLng> route){
return Padding(
  padding: const EdgeInsets.all(8.0),
  child: SfMaps(
    layers:[
      MapTileLayer(
        urlTemplate : "https://tile.openstreetmap.org/{z}/{x}/{y}.png",
        initialFocalLatLng: route.first,
        initialZoomLevel: 15,
        initialMarkersCount: 1,
        markerBuilder: (BuildContext context, int index){
        return MapMarker(latitude: route.first.latitude, 
        longitude: route.first.longitude,
        child: const Icon(Icons.location_pin, color: Colors.red,),
          );
        },
         sublayers: [
          MapPolylineLayer(
            polylines: {
              MapPolyline(points: route, color: Colors.blue,width: 3),
            })
         ], 
      )
      ]
      )
      ,);
}
}