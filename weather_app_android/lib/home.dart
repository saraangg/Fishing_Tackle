import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:intl/intl.dart';
import 'const/colors.dart';
import 'const/images.dart';
import 'const/strings.dart';
import 'controllers/main_controller.dart';
import 'models/current_weather.dart';
import 'models/hourly_weather.dart';

class WeatherApp extends StatelessWidget {
  const WeatherApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // var date = DateTime.now();
    var theme = Theme.of(context);
    var date = DateFormat.yMMMMd('en_US').format(DateTime.now());
    var controller = Get.put(MainController());

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: AppBar(
        leading: Builder(builder: (context)=>
            IconButton(onPressed: (){Scaffold.of(context).openDrawer();},
                icon: Obx(()=>Icon(Icons.menu,color: controller.isDark.value ? Colors.white : Colors.black,)))
        ),
        title: date.text.color(theme.primaryColor).xl.make(),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        actions: [
          Obx(
                () => IconButton(
              onPressed: () {
                // Get.changeThemeMode(ThemeMode.dark);
                controller.changeTheme();
              },
              icon: Icon(
                  controller.isDark.value ? Icons.light_mode : Icons.dark_mode),
              color: theme.iconTheme.color,
            ),
          ),
          IconButton(
              onPressed: () {},
              icon: const Icon(Icons.more_vert),
              color: theme.iconTheme.color),
        ],
      ),
      drawer: Drawer(
        // backgroundColor: controller.isDark.value ? Colors.black : Colors.white,
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.only(top: 50.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const [
                CircleAvatar(
                  radius: 50.0,
                  backgroundImage: AssetImage("assets/icons/ayaz.png"),              ),
                SizedBox(
                  height: 5.0,
                ),
                Text(
                  "Ayaz Khan",
                  style: TextStyle(
                    fontSize: 22.0,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                SizedBox(
                  height: 5.0,
                ),
                Text(
                  "Software Engineer",
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20.0,
          ),
          //Now let's Add the button for the Menu
          //and let's copy that and modify it
          ListTile(
            onTap: () {},
            leading: const Icon(
              Icons.person,
              color: Colors.black,
            ),
            title: const Text("Your Profile"),
          ),

          ListTile(
            onTap: () {},
            leading: const Icon(
              Icons.inbox,
              color: Colors.black,
            ),
            title: const Text("Your Inbox"),
          ),

          ListTile(
            onTap: () {},
            leading: const Icon(
              Icons.assessment,
              color: Colors.black,
            ),
            title: const Text("Your Dashboard"),
          ),

          ListTile(
            onTap: () {},
            leading: const Icon(
              Icons.settings,
              color: Colors.black,
            ),
            title: const Text("Settings"),
          ),
        ]),
      ),
      body: Obx(() => controller.isloaded == true
          ? Container(
        padding: EdgeInsets.all(12),
        child: FutureBuilder(
          future: controller.currentWeatherData,
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              print('-----------------------------------------------');
              CurrentWeatherData data = snapshot.data;
              return SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      "${data.name}"
                          .toUpperCase()
                          .text
                          .xl3
                          .color(theme.primaryColor)
                          .fontFamily("Poppins-Bold")
                          .make(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image.asset(
                            "assets/weather/${data.weather![0].icon}.png",
                            width: 80,
                            height: 80,
                          ),
                          RichText(
                            text: TextSpan(children: [
                              TextSpan(
                                text: "${data.main!.temp}$degree",
                                style: TextStyle(
                                  color: theme.primaryColor,
                                  fontSize: 64,
                                  fontFamily: "Poppins",
                                ),
                              ),
                              TextSpan(
                                text: "${data.weather![0].main}",
                                style: TextStyle(
                                  color: theme.primaryColor,
                                  fontSize: 14,
                                  letterSpacing: 3,
                                  fontFamily: "Poppins-Light",
                                ),
                              ),
                            ]),
                          ),
                        ],
                      ),
                      10.heightBox,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton.icon(
                              onPressed: null,
                              icon: Icon(
                                Icons.expand_less_rounded,
                                color: theme.primaryColor,
                              ),
                              label: "${data.main!.tempMin}$degree"
                                  .text
                                  .color(theme.primaryColor)
                                  .make()),
                          TextButton.icon(
                              onPressed: null,
                              icon: Icon(
                                Icons.expand_more_rounded,
                                color: theme.primaryColor,
                              ),
                              label: "${data.main!.tempMax}$degree"
                                  .text
                                  .color(
                                theme.primaryColor,
                              )
                                  .make()),
                        ],
                      ),
                      10.heightBox,
                      Row(
                          mainAxisAlignment:
                          MainAxisAlignment.spaceAround,
                          children: List.generate(3, (index) {
                            var iconList = [clouds, humidity, windSpeed];
                            var values = [
                              "${data.clouds!.all}%",
                              "${data.main!.humidity}%",
                              "${data.wind!.speed} km/h"
                            ];
                            return Column(
                              children: [
                                Image.asset(
                                  iconList[index],
                                  height: 80,
                                  width: 80,
                                )
                                    .box
                                    .color(Vx.gray200)
                                    .padding(const EdgeInsets.all(8))
                                    .roundedSM
                                    .make(),
                                10.heightBox,
                                values[index].text.gray400.make(),
                              ],
                            );
                          })),
                      const Divider(),
                      10.heightBox,
                      FutureBuilder(
                          future: controller.hourlyWeatherData,
                          builder: (BuildContext context,
                              AsyncSnapshot snapshot) {
                            if (snapshot.hasData) {
                              print(
                                  "-==========================================-");
                              HourlyWeatherData hourlyData =
                                  snapshot.data;
                              print(
                                  "-==========================================-");
                              return SizedBox(
                                height: 160,
                                child: ListView.builder(
                                    shrinkWrap: true,
                                    physics:
                                    const BouncingScrollPhysics(),
                                    scrollDirection: Axis.horizontal,
                                    itemCount: hourlyData.list!.length > 6
                                        ? 6
                                        : hourlyData.list!.length,
                                    itemBuilder: (BuildContext context,
                                        int index) {
                                      var time = DateFormat()
                                          .add_jm()
                                          .format(DateTime
                                          .fromMillisecondsSinceEpoch(
                                          hourlyData.list![index]
                                              .dt!
                                              .toInt() *
                                              1000));
                                      return Container(
                                        margin: const EdgeInsets.only(
                                            right: 2),
                                        decoration: BoxDecoration(
                                          color: cardColor,
                                          borderRadius:
                                          BorderRadius.circular(12),
                                        ),
                                        child: Column(
                                          children: [
                                            SizedBox(
                                              height: 10,
                                            ),
                                            "${time}"
                                                .text
                                                .bold
                                                .gray100
                                                .make(),
                                            Image.asset(
                                              "assets/weather/${hourlyData.list![index].weather![0].icon}.png",
                                              height: 80,
                                              width: 80,
                                            ),
                                            "${hourlyData.list![index].main!.temp}$degree"
                                                .text
                                                .bold
                                                .color(
                                              theme.primaryColor,
                                            )
                                                .white
                                                .make(),
                                          ],
                                        ),
                                      );
                                    }),
                              );
                            } else {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            }
                          }),
                      10.heightBox,
                      const Divider(),
                      10.heightBox,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          "Next 7 Days"
                              .text
                              .color(
                            theme.primaryColor,
                          )
                              .semiBold
                              .size(16)
                              .make(),
                          TextButton(
                              onPressed: () {},
                              child: "View All".text.make()),
                        ],
                      ),
                      ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: 7,
                          itemBuilder: (BuildContext context, int index) {
                            var day = DateFormat("EEEE").format(
                                DateTime.now()
                                    .add(Duration(days: index + 1)));
                            return Card(
                              color: theme.cardColor,
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 8, vertical: 12),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: day.text
                                          .color(
                                        theme.primaryColor,
                                      )
                                          .make(),
                                    ),
                                    Expanded(
                                      child: TextButton.icon(
                                          onPressed: null,
                                          icon: Image.asset(
                                            "assets/icons/moon.png",
                                            width: 40,
                                          ),
                                          label: "21$degree"
                                              .text
                                              .color(
                                            theme.primaryColor,
                                          )
                                              .make()),
                                    ),
                                    RichText(
                                      text: TextSpan(
                                        children: [
                                          const TextSpan(
                                            text: "37$degree /",
                                            style: TextStyle(
                                              color: Vx.gray800,
                                              fontFamily: "poppins",
                                              fontSize: 16,
                                            ),
                                          ),
                                          TextSpan(
                                            text: "26$degree ",
                                            style: TextStyle(
                                              color: theme.primaryColor,
                                              fontFamily: "poppins",
                                              fontSize: 16,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          })
                    ],
                  ),
                ),
              );
    } else if (snapshot.hasError) {
    return Center(child: Text('Error: ${snapshot.error}'));
    } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ),
      )
          : Center(child: CircularProgressIndicator())),
    );
  }
}