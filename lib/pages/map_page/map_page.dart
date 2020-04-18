import 'package:flutter/material.dart';
import 'package:flutter_demo_app/shared/constants.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:latlong/latlong.dart';
import 'package:amap_location/amap_location.dart';
import 'package:permission_handler/permission_handler.dart';

class MapPage extends StatefulWidget {
  const MapPage({Key key}) : super(key: key);

  @override
  _MapPageState createState() => new _MapPageState();
}

class _MapPageState extends State<MapPage> {
  static LatLng beijing = new LatLng(39.916846, 116.391220);
  static LatLng chengdu = new LatLng(30.661177, 104.063337);
  static LatLng taiwan = new LatLng(24.137639, 120.691316);
  static LatLng xian = new LatLng(34.269985, 108.942833);

  LatLng locationmPoint = new LatLng(0, 0);

  MapController mapController;

  void initState() {
    super.initState();
    mapController = new MapController();
    // iOS
    AMapLocationClient.setApiKey("fad348fc16d6404f5170d703056627b7");
  }

  void _showSnackBar(content) {
    Scaffold.of(context).showSnackBar(new SnackBar(
        content: content,
        duration: new Duration(seconds: 1),
        backgroundColor: Color.fromARGB(0, 0, 0, 0)));
  }

  void _getLocatin() async {
    var status = await Permission.locationWhenInUse.status;
    if(status.isUndetermined || status.isDenied || status.isRestricted || status.isPermanentlyDenied){
      Map<Permission, PermissionStatus> statuses = await [
        Permission.locationWhenInUse,
      ].request();

      var locationWhenInUse = statuses[Permission.locationWhenInUse];
      if(locationWhenInUse.isDenied || locationWhenInUse.isRestricted || locationWhenInUse.isPermanentlyDenied) {
        _showSnackBar(new Text('申请定位权限失败'));
      }
    }

    await AMapLocationClient.startup(new AMapLocationOption(
        desiredAccuracy: CLLocationAccuracy.kCLLocationAccuracyHundredMeters));
    AMapLocation currentLocation = await AMapLocationClient.getLocation(true);

    setState(() {
      locationmPoint =
          new LatLng(currentLocation.latitude, currentLocation.longitude);
    });

    mapController.move(
      LatLng(currentLocation.latitude, currentLocation.longitude),
      14,
    );
  }

  @override
  Widget build(BuildContext context) {
    List<Marker> markers = <Marker>[
      new Marker(
        width: 80.0,
        height: 80.0,
        point: beijing,
        builder: (ctx) => new Container(
              child: new GestureDetector(
                onTap: () {
                  _showSnackBar(new Text("Tapped on blue FlutterLogo Marker"));
                },
                child: Container(
                  child: new FlutterLogo(colors: Colors.red),
                ),
              ),
            ),
      )
    ];
    List<CircleMarker> circleMarkers = <CircleMarker>[
      new CircleMarker(
          point: chengdu,
          color: Colors.green,
          borderStrokeWidth: 200,
          borderColor: Colors.lightBlue,
          useRadiusInMeter: true,
          radius: 1000 // 1000 meters | 1 km
          ),
      new CircleMarker(
          point: taiwan,
          color: Colors.lightBlue,
          borderStrokeWidth: 200,
          borderColor: Colors.redAccent,
          useRadiusInMeter: true,
          radius: 1000 // 1000 meters | 1 km
          ),
    ];
    List<Polyline> polylines = <Polyline>[
      new Polyline(
          points: [beijing, chengdu, taiwan],
          strokeWidth: 4.0,
          color: Colors.redAccent,
          isDotted: true)
    ];
    List<Polygon> polygons = <Polygon>[
      new Polygon(
          points: [
            new LatLng(35.916846, 108.391220),
            new LatLng(39.916846, 104.391220),
            new LatLng(41.916846, 88.391220),
            new LatLng(35.916846, 91.391220),
            new LatLng(37.916846, 104.391220),
            new LatLng(35.916846, 108.391220),
          ],
          borderStrokeWidth: 10,
          color: Color(0xFFFFFFFF).withOpacity(0.5),
          borderColor: Color.fromARGB(150, 52, 33, 55))
    ];
    List<Marker> locationmMrkers = <Marker>[
      new Marker(
        width: 80.0,
        height: 80.0,
        point: locationmPoint,
        builder: (ctx) => new Container(
              child: locationmPoint == new LatLng(0, 0)
                  ? null
                  : SpinKitPulse(
                      color: Colors.blue,
                      size: 50.0,
                    ),
            ),
      )
    ];

    // 状态栏高度
    double statusBarHeight =
        MediaQueryData.fromWindow(WidgetsBinding.instance.window).padding.top;

    return Stack(
      children: <Widget>[
        FlutterMap(
          mapController: mapController,
          options: new MapOptions(
              center: new LatLng(36, 105), zoom: 2.5, minZoom: 2, maxZoom: 18),
          layers: [
            new TileLayerOptions(
                urlTemplate: TdtMapUrl.vec_w,
                backgroundColor: const Color(0xFFFFFFFF).withOpacity(0)),
            new TileLayerOptions(
                urlTemplate: TdtMapUrl.cva_w,
                backgroundColor: const Color(0xFFFFFFFF).withOpacity(0)),
            new PolylineLayerOptions(polylines: polylines),
            new CircleLayerOptions(circles: circleMarkers),
            new PolygonLayerOptions(polygons: polygons),
            new MarkerLayerOptions(markers: markers),
            new MarkerLayerOptions(markers: locationmMrkers),
          ],
        ),
        Positioned(
          left: 8.0,
          top: statusBarHeight,
          child: new Column(
            children: <Widget>[
              new RaisedButton(
                color: Colors.white,
                child: new Text("beijing"),
                padding: const EdgeInsets.all(0.0),
                onPressed: () => mapController.move(beijing, 18.0),
              ),
              new RaisedButton(
                color: Colors.white,
                child: new Text("chengdu"),
                onPressed: () => mapController.move(chengdu, 11.0),
              ),
              new RaisedButton(
                color: Colors.white,
                child: new Text("taiwan"),
                onPressed: () => mapController.move(taiwan, 10.0),
              ),
            ],
          ),
        ),
        Positioned(
          top: statusBarHeight,
          right: 8.0,
          child: new Column(
            children: <Widget>[
              new FlatButton(
                color: Colors.white,
                child: new Text("Fit Bounds"),
                onPressed: () {
                  var bounds = new LatLngBounds();
                  bounds.extend(taiwan);
                  bounds.extend(chengdu);
                  bounds.extend(beijing);
                  mapController.fitBounds(
                    bounds,
                    options: new FitBoundsOptions(
                      padding: new EdgeInsets.only(left: 20.0, right: 20.0),
                    ),
                  );
                },
              ),
              new FlatButton(
                color: Colors.white,
                child: new Text("Get Bounds"),
                onPressed: () {
                  final bounds = mapController.bounds;
                  _showSnackBar(new Text(
                    'Map bounds: \n'
                    'E: ${bounds.east} \n'
                    'N: ${bounds.north} \n'
                    'W: ${bounds.west} \n'
                    'S: ${bounds.south}',
                  ));
                },
              ),
            ],
          ),
        ),
        Positioned(
          bottom: 18.0,
          right: 0.0,
          child: RaisedButton(
            onPressed: _getLocatin,
            child: Icon(Icons.my_location, color: Colors.black54),
            shape: CircleBorder(),
            color: Colors.white,
          ),
        )
      ],
    );
  }
}
