import 'dart:async';

import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart' as geolo;
import 'package:location/location.dart';

import 'constants.dart';

Future<void> checkLocationServicesInDevice() async {
    // ignore: unused_local_variable
    Timer _timer;

    Location location = new Location();

    var _serviceEnabled = await location.serviceEnabled();

    if(_serviceEnabled)
    {
    
      var _permissionGranted = await location.hasPermission();

      if(_permissionGranted == PermissionStatus.granted)
      {
        
        // _location = await location.getLocation();

        // print(_location.latitude.toString() + " " + _location.longitude.toString());

        
        location.onLocationChanged.listen((LocationData currentLocation) {
          
          print(currentLocation.latitude.toString() + " " + currentLocation.longitude.toString());
        });

      }else{

        _permissionGranted = await location.requestPermission();

        if(_permissionGranted == PermissionStatus.granted)
        {
           Future.delayed(Duration(seconds: 1), () async {
      _timer = await geolo.Geolocator()
          .getCurrentPosition(desiredAccuracy: geolo.LocationAccuracy.high)
          .then((value) {
        print(value);
        pos=value;
        // setState(() {
        //           pos = value;   
                  print("!!!!!!!!!!!!!!!postion $pos");
        //         });
                       
        return ;
      });
      
});
          print('user allowed');
          // print("=============?????????????/++++++===============}}}}}}}}}}}}}}}]");

        }else{

          SystemNavigator.pop();
          // print("=============?????????????/++++++===============}}}}}}}}}}}}}}}]");

        }

      }
    
    }else{

      _serviceEnabled = await location.requestService();

      if(_serviceEnabled)
      {
        
        var _permissionGranted = await location.hasPermission();

        if(_permissionGranted == PermissionStatus.granted)
        {
          
          print('user allowed before');
          // print("=============?????????????/++++++===============}}}}}}}}}}}}}}}]");

        }else{

          _permissionGranted = await location.requestPermission();

          if(_permissionGranted == PermissionStatus.granted)
          {
            
            print('user allowed');
            // print("=============?????????????/++++++===============}}}}}}}}}}}}}}}]");

          }else{

            SystemNavigator.pop();
            // print("=============?????????????/++++++===============}}}}}}}}}}}}}}}]");
          }

        }

      
      }else{

        SystemNavigator.pop();
        // print("=============?????????????/++++++===============}}}}}}}}}}}}}}}]");
      }

    }
    
  }