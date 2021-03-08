import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:study_project/model/country.dart';

class AdaptingWidgets extends StatefulWidget {
  AdaptingWidgets({Key key}) : super(key: key);

  @override
  _AdaptingWidgetsState createState() => _AdaptingWidgetsState();
}

class _AdaptingWidgetsState extends State<AdaptingWidgets> {
  List<Country> _countryList = CountryInteractor().getCountries();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Demo of adapting widgets"),
        ),
        body: ListView.builder(
          itemBuilder: (_, index) {
            return CountryWidget(
              data: _countryList[index],
            );
          },
          itemCount: _countryList.length,
        ));
  }
}

class CountryWidget extends StatelessWidget {
  final Country data;
  const CountryWidget({Key key, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MediaQuery.of(context).orientation == Orientation.portrait
        ? _CountryPortraitWidget(
            name: data.name,
            flagPath: data.flagPath,
          )
        : _CountryLandscapeWidget(
            name: data.name,
            flagPath: data.flagPath,
          );
  }
}

class _CountryPortraitWidget extends StatelessWidget {
  final String name;
  final String flagPath;
  const _CountryPortraitWidget({Key key, this.name, this.flagPath})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Stack(
        children: [
          ClipRRect(
            child: Container(
              height: 200,
              width: double.infinity,
              child: Image.network(
                "https://img-fotki.yandex.ru/get/151986/405846350.1bc/0_1a9751_3fb6ece2_XXL.jpg",
                fit: BoxFit.cover,
              ),
              // child: Image.asset("assets/images/Zamunda.png"),
              transform: Matrix4.rotationZ(-0.2)
                ..scale(1.2)
                ..translate(-20.0),
            ),
          ),
          Positioned(
            right: 10,
            bottom: 10,
            child: Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(4)),
              child: Text(
                name,
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _CountryLandscapeWidget extends StatelessWidget {
  final String name;
  final String flagPath;
  const _CountryLandscapeWidget({Key key, this.name, this.flagPath})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              border: Border.all(
                color: Theme.of(context).primaryColor,
                width: 3,
              ),
              borderRadius: BorderRadius.circular(50.0),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(50.0),
              child: Image.network( // TODO Image.asset
                "https://img-fotki.yandex.ru/get/151986/405846350.1bc/0_1a9751_3fb6ece2_XXL.jpg",
                fit: BoxFit.cover,
                width: 100,
                height: 100,
              ),
            ),
          ),
          Text(
            name,
            style: Theme.of(context).textTheme.subtitle1,
          ),
          if (Platform.isIOS)
            Expanded(
              child: Align(
                alignment: Alignment.centerRight,
                child: CupertinoButton(
                  child: Text("Открыть в Apple Map"),
                  onPressed: () {},
                ),
              ),
            ),
        ],
      ),
    );
  }
}
