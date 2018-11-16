import 'dart:async';
import 'package:flutter/material.dart';
import 'profilePage.dart';
import 'inbox.dart';
import 'main.dart';
import 'profile.dart';
import 'package:map_view/map_view.dart';
import 'package:flutter_search_bar/flutter_search_bar.dart';
import 'keys.dart';

import 'profile_picture.dart';
import 'widget_test.dart';
//import 'package:location/location.dart';
//import 'package:flutter_map/flutter_map.dart';

const API_KEY = googleMapsKey;

class MapPage extends StatefulWidget {

  @override
  MapPageState createState() {
    //MapView.setApiKey(API_KEY);
  return new MapPageState();
  }
}

class MapPageState extends State<MapPage> {
  MapView mapView;
  SearchBar searchBar;
  StaticMapProvider staticMapProvider;
  Uri imageUri;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  var latitude = 35.766538;
  var longitude = -78.673005;
  var currentlocation = new Location(35.766538, -78.673005);


  @override
  void initState() {
    super.initState();
    MapView.setApiKey(API_KEY); // -----------------new
    mapView = new MapView();
    fetchData();
    //currentlocation;

  }

  fetchData() async {}

  AppBar buildAppBar(BuildContext context) {
    return new AppBar(
      title: new Text('Search'),
      actions: [searchBar.getSearchAction(context)],
      backgroundColor: Colors.orange,);
  }

  MapPageState() {
    searchBar = new SearchBar(
        inBar: false,
        buildDefaultAppBar: buildAppBar,
        setState: setState,
        onSubmitted: onSubmitted);
  }

  void onSubmitted(String value) {
    setState(() =>
        _scaffoldKey.currentState
            .showSnackBar(
            new SnackBar(content: new Text('You wrote $value!'))));
  }

  void _showMapView() {
    mapView.show(
        new MapOptions(
            mapViewType: MapViewType.normal,
            showUserLocation: true,
            initialCameraPosition: new CameraPosition(currentlocation, 14.0),
//            initialCameraPosition: new CameraPosition(
//              // if user hasn't selected a location, we show current location and vice versa.
//                selectedLocation != null ?
//                new Location(selectedLocation.latitude, selectedLocation.longitude)
//                    : new Location(currentLocation.latitude, currentLocation.longitude),
//                14.0 // zoom level
//            ),
            title: "Your location"),
        toolbarActions: [
          new ToolbarAction("Close", 1), new ToolbarAction("Confirm", 2)]);

    mapView.onMapReady.listen((Null _) {
      mapView.setMarkers([new Marker("1", "selected", latitude, longitude)]);
    });

    mapView.onMapTapped.listen((location) {
      print("tapped location is $location");
      mapView.setMarkers([new Marker("1", "selected", latitude, longitude)]);
      print(mapView.markers.length);
    });

    mapView.onToolbarAction.listen((id) {
      if (id == 1) {
        mapView.dismiss();
      } else if (id == 2) {
        print("len is: " + mapView.markers.length.toString());
        if (mapView.markers.isNotEmpty) {
          setState(() {
            imageUri =
                staticMapProvider.getStaticUriWithMarkers(mapView.markers);
            currentlocation = Location(latitude, longitude);
          });

          mapView.dismiss();
        }
      }
    });
  }


  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: searchBar.build(context),
      key: _scaffoldKey,
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: new Center(
                child: ClipRRect(



                  borderRadius: new BorderRadius.all(new Radius.circular(20.0)),
                ),
              ),
            ),


            new MaterialButton(
              height: 40.0,
              minWidth: 100.0,
              color: Colors.teal,
              textColor: Colors.white,
              child: new Text("widget test"),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => widgetTest())
                );
              },
              splashColor: Colors.amber,

            ),

          ],

        )
        ,
      ),

      floatingActionButton: new FloatingActionButton(
        onPressed: _showMapView,
        tooltip: 'show map',
        child: new Icon(Icons.map),
      ),




    );
  }

}