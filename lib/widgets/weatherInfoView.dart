import 'package:flutter/material.dart';
import 'package:hash_srm/model/weather_data.dart';

class WeatherInfoView extends StatefulWidget {
  const WeatherInfoView({Key? key}) : super(key: key);

  @override
  _WeatherInfoViewState createState() => _WeatherInfoViewState();
}

class _WeatherInfoViewState extends State<WeatherInfoView> {
  WeatherLocations weather=WeatherData.weather;

  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Color(0xffb7c881),
          borderRadius: BorderRadius.circular(40),
          border: Border.all(color: Colors.white),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.8),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0,3),
            )
          ]
      ),
      height: MediaQuery.of(context).size.height*0.25,
      margin: EdgeInsets.all(8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        // mainAxisSize: MainAxisSize.max,
        children: [
          ListTile(
            trailing: Image.network("http://openweathermap.org/img/wn//${weather.iconUrl}@4x.png"),
            // leading: Icon(Icons.album),
            title: Text(
              weather.city,
              style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold
              ),
            ),
            subtitle: Text(
              "\nTemperature: \t"+weather.temperature+
                  "\nWeather Type: \t"+weather.weatherType+
                  "\nHumidity: \t"+weather.humidity.toString()+
                  "\nPressure: \t"+weather.pressure.toString(),
              style: TextStyle(
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.end,
          //   children: [
          //     TextButton(
          //       child: Text('Check Details'),
          //       onPressed: () {/* ... */},
          //     ),
          //     const SizedBox(width: 8),
          //     TextButton(
          //       child: Text('Delete'),
          //       onPressed: () {/* ... */},
          //     ),
          //     const SizedBox(width: 8),
          //   ],
          // ),
        ],
      ),
    );
  }
}
