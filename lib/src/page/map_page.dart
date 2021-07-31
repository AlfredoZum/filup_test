import 'dart:async';

import 'package:filup_test/src/component/drawer_customer.dart';
import 'package:filup_test/src/util/size_config.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MapPage extends StatelessWidget {

  final Completer<GoogleMapController> _controller = Completer();

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  static const CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(37.43296265331129, -122.08832357078792),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);

  Future<void> _goToTheLake() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
  }

  @override
  Widget build(BuildContext context) {

    final double heightAB = AppBar().preferredSize.height;

    SizeConfig().init(context);

    ScreenUtil.init(
        BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width,
            maxHeight: MediaQuery.of(context).size.height),
        designSize: const Size(750, 1334));

    return Scaffold(
      drawer: DrawerCustomer(),
      body: Stack(
        children: <Widget>[
          _showMap(),
          _appBar(context),
          _search(context, heightAB),
          _footer(context),
          // _appBar(),
        ],
      ),
    );
  }

  Widget _appBar(BuildContext ctx) => Positioned(
    top: 0.0,
    left: 0.0,
    right: 0.0,
    child: AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      actions: <Widget>[
        Container(
          width: 65.0,
          margin: EdgeInsets.only(right: SizeConfig.row20),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: ElevatedButton(
              onPressed: () => print('click'),
              style: ElevatedButton.styleFrom(
                primary: Colors.grey[100],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
              ),
              child: const Icon(Icons.send, color: Colors.green, size: 18.0),
            ),
          ),
        ),
      ],
    ),
  );

  Widget _showMap() => GoogleMap(
    mapType: MapType.normal,
    initialCameraPosition: _kGooglePlex,
    onMapCreated: (GoogleMapController controller) {
      _controller.complete(controller);
    },
  );

  Widget _search(BuildContext ctx, double heightAB){

    final TextStyle _styleAddress = Theme.of(ctx).textTheme.subtitle2!;

    return Positioned(
      top: heightAB + 10.0,
      left: 0.0,
      right: 0.0,
      child: SafeArea(
        child: Container(
          height: SizeConfig.row10 * 5,
          margin: EdgeInsets.symmetric(horizontal: SizeConfig.row20),
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: SizeConfig.row10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    // ignore: prefer_const_literals_to_create_immutables
                    children: <Widget>[
                      Icon(Icons.location_pin, color: Colors.grey[400]),
                      SizedBox(width: SizeConfig.row10),
                      Text('102 Fordham Rd', style: _styleAddress)
                    ],
                  ),
                  Row(
                    // ignore: prefer_const_literals_to_create_immutables
                    children: <Widget>[
                      Icon(Icons.close, color: Colors.grey[400]),
                      SizedBox(width: SizeConfig.row10),
                      Icon(Icons.settings, color: Colors.grey[400]),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );

  }

  Widget _footer(BuildContext ctx){
    return Positioned(
      left: 0.0,
      right: 0.0,
      bottom: 10.0,
      child: SafeArea(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: SizeConfig.row20),
          child: Column(
            children: [
              _cardAddress(ctx),
              SizedBox(height: SizeConfig.row10),
              _buttom(ctx),
            ],
          ),
        ),
      ),
    );
  }

  Widget _cardAddress(BuildContext ctx){
    return SizedBox(
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Container(
          margin: EdgeInsets.symmetric(
            horizontal: SizeConfig.row20,
            vertical: SizeConfig.row20,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              _cardAddressTop(ctx),
              Divider( thickness: 1, height: SizeConfig.row10 * 3),
              _cardAddressBottom(ctx),
            ],
          ),
        ),
      ),
    );
  }

  Widget _cardAddressTop(BuildContext ctx){

    final TextStyle _styleTime = Theme.of(ctx).textTheme.headline5!.copyWith(
      fontWeight: FontWeight.bold
    );
    final TextStyle _styleAddress = Theme.of(ctx).textTheme.subtitle2!;
    final TextStyle _styleCity = Theme.of(ctx).textTheme.caption!;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        RichText(
          text: TextSpan(
            text: '\$5',
            style: _styleTime,
            children: <TextSpan>[
              TextSpan(text: '/hr', style: _styleCity),
            ],
          ),
        ),
        Column(
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Icon(Icons.star, color: Colors.grey[400], size: 18.0),
                    SizedBox(width: SizeConfig.row10 / 2),
                    Text('102 Fordham Rd', style: _styleAddress),
                  ],
                ),
                SizedBox(height: SizeConfig.row10 / 5),
                Text('San Jose', style: _styleCity),
              ],
            )
          ],
        )
      ],
    );
  }

  Widget _cardAddressBottom(BuildContext ctx) {

    final TextStyle _styleGeneral = Theme.of(ctx).textTheme.caption!;
    final TextStyle _styleNumber = Theme.of(ctx).textTheme.subtitle2!;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text('Avaliable space', style: _styleGeneral),
        SizedBox(height: SizeConfig.row10 / 2),
        Row(
          children: <Widget>[
            Container(
              width: 150.0,
              height: 10.0,
              padding: const EdgeInsets.only(right: 75.0),
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(20)),
                color: Colors.grey[300],
              ),
              child: Container(
                height: 10.0,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  color: Color(0xff3cd458),
                ),
              ),
            ),
            SizedBox(width: SizeConfig.row10),
            Text('4', style: _styleNumber.copyWith(
                fontWeight: FontWeight.bold
            )),
          ],
        ),
        SizedBox(height: SizeConfig.row10 ),
        Row(
          children: <Widget>[
            Icon(Icons.directions_run, color: Colors.grey[400], size: 20.0),
            SizedBox(width: SizeConfig.row10 / 2),
            Text('124 meters walk', style: _styleGeneral),
          ],
        ),
      ],
    );
  }

  Widget _buttom(BuildContext ctx) => Container(
    height: SizeConfig.row10 * 4,
    width: double.infinity,
    child: ElevatedButton(
      onPressed: () => print('click'),
      style: ElevatedButton.styleFrom(
        primary: Theme.of(ctx).primaryColor,
        textStyle: TextStyle(
            fontSize: 32.sp,
            fontWeight: FontWeight.bold
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
      ),
      child: Text('Go!'),
    ),
  );

}
