import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sleep_clock_app/clock_view.dart';

class HomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var now = DateTime.now();
    var formattedTime = DateFormat('HH:mm').format(now);
    var formattedDate = DateFormat('EEE, d MMM').format(now);
    var timezoneString = now.timeZoneOffset.toString().split('.')[0];
    var offsetSign = '';
    if (!timezoneString.startsWith("-")) offsetSign = ('+');

    return Scaffold(
      backgroundColor: Color(0xFF2d2f41),
      body: Row(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              buildNewMenu('Clock', 'assets/clock_icon.png'),
              buildNewMenu('Alarm', 'assets/alarm_icon.png'),
              buildNewMenu('Timer', 'assets/timer_icon.png'),
              buildNewMenu('Stopwatch', 'assets/stopwatch_icon.png'),
            ],
          ),
          const VerticalDivider(
            color: Colors.white54,
            width: 1,
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(32),
              alignment: Alignment.center,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Flexible(
                    flex: 1,
                    fit: FlexFit.tight,
                    child: Text(
                      "Clock",
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                        fontSize: 24,
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 2,
                    fit: FlexFit.tight,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          formattedTime,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 64,
                          ),
                        ),
                        Text(
                          formattedDate,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Flexible(
                      flex: 5,
                      fit: FlexFit.tight,
                      child: Align(
                          alignment: Alignment.center,
                          child: ClockView(
                            size: MediaQuery.of(context).size.height / 4,
                          ))),
                  Flexible(
                    flex: 2,
                    fit: FlexFit.tight,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Time Zone",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Row(
                          children: <Widget>[
                            const Icon(
                              Icons.language,
                              color: Colors.white,
                            ),
                            const SizedBox(width: 16),
                            Text(
                              "UTC$offsetSign$timezoneString",
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Padding buildNewMenu(String title, String image) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: (16.0)),
      child: TextButton(
          onPressed: () {},
          child: Column(
            children: [
              Image.asset(
                image,
                scale: 1.5,
              ),
              Text(
                title,
                style: TextStyle(color: Colors.white, fontSize: 14),
              ),
            ],
          )),
    );
  }
}
