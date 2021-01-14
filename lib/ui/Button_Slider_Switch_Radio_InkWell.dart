import 'package:flutter/material.dart';
import 'package:study_project/ui/Advanced_tab.dart';
import 'package:study_project/res/themes.dart';

void main() => runApp(Home());

class Home extends StatelessWidget {
  const Home({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return App();
  }
}

class App extends StatefulWidget {
  App({Key key}) : super(key: key);

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  bool isDarkMode = false;
  bool isValue = false;
  double sliderValue = 0.0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "title of app",
      theme: isDarkMode ? darkTheme : lightTheme,
      home: Scaffold(
        appBar: AppBar(
          title: Text("My test app"),
        ),
        body: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 30,
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    isDarkMode = true;
                  });
                },
                child: Text("Go dark side"),
              ),
              OutlineButton(
                onPressed: () {
                  setState(() {
                    isDarkMode = false;
                  });
                },
                child: Text("no, i don't like cookies"),
              ),
              TextButton(
                onPressed: () {
                  setState(() {
                    isValue = !isValue;
                    isDarkMode = !isDarkMode;
                  });
                },
                child: Text("inverse isValue and theme"),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: ListTile(
                  title: Text("<- isValue"),
                  leading: Text(isValue.toString()),
                  subtitle: Text("subtitle"),
                  trailing: Text("trailing"),
                ),
              ),
              Switch(
                  value: isValue,
                  onChanged: (value) {
                    setState(() {
                      isValue = value;
                    });
                  }),
              Slider(
                  value: sliderValue,
                  divisions: 5,
                  onChanged: (value) {
                    setState(() {
                      sliderValue = value;
                    });
                  }),
              // Slider.adaptive меняет внешний вид в зависимости от OC
              ListTile(
                subtitle: Radio(
                    value: 0.2,
                    groupValue: sliderValue,
                    onChanged: (value) {
                      setState(() {
                        sliderValue = value;
                      });
                    }),
                leading: Radio(
                  value: 0.4,
                  groupValue: sliderValue,
                  onChanged: (value) {
                    setState(() {
                      sliderValue = value;
                    });
                  },
                ),
              ),
              Text(sliderValue.toString()),
              InkWell(
                onTap: () {
                  setState(() {
                    print("Работает!");
                  });
                },
                child: Container(
                  width: 200,
                  height: 200,
                  color: Colors.red,
                ),
              )
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.add),
              label: "test 1",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.face_outlined),
              label: "test 2",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.dangerous),
              label: "test 3",
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
            child: Text(
              isDarkMode ? "to light" : "to Dark",
            ),
            onPressed: () {
              setState(() {
                isDarkMode = !isDarkMode;
              });
            }),
      ),
    );
  }
}
