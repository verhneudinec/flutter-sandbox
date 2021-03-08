class Country {
  final String name;
  final String flagPath;
  Country(this.name, this.flagPath);
}

class CountryInteractor {
  List<Country> getCountries() {
    return _countryList;
  }
}

var _countryList = <Country>[
  Country('Genovia', 'assets/images/Genovia.png'),
  Country('Кекистан', 'assets/images/Genovia.png'),
  Country('Замунда', 'assets/images/Genovia.png'),
  Country('Бартовия', 'assets/images/Genovia.png')
];
