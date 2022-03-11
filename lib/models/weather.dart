class WeatherApi {
  List<ConsolidatedWeather>? _consolidatedWeather;
  String? _time;
  String? _sunRise;
  String? _sunSet;
  String? _timezoneName;
  Parent? _parent;
  List<Sources>? _sources;
  String? _title;
  String? _locationType;
  int? _woeid;
  String? _lattLong;
  String? _timezone;

  WeatherApi(
      {List<ConsolidatedWeather>? consolidatedWeather,
      String? time,
      String? sunRise,
      String? sunSet,
      String? timezoneName,
      Parent? parent,
      List<Sources>? sources,
      String? title,
      String? locationType,
      int? woeid,
      String? lattLong,
      String? timezone}) {
    if (consolidatedWeather != null) {
      this._consolidatedWeather = consolidatedWeather;
    }
    if (time != null) {
      this._time = time;
    }
    if (sunRise != null) {
      this._sunRise = sunRise;
    }
    if (sunSet != null) {
      this._sunSet = sunSet;
    }
    if (timezoneName != null) {
      this._timezoneName = timezoneName;
    }
    if (parent != null) {
      this._parent = parent;
    }
    if (sources != null) {
      this._sources = sources;
    }
    if (title != null) {
      this._title = title;
    }
    if (locationType != null) {
      this._locationType = locationType;
    }
    if (woeid != null) {
      this._woeid = woeid;
    }
    if (lattLong != null) {
      this._lattLong = lattLong;
    }
    if (timezone != null) {
      this._timezone = timezone;
    }
  }

  List<ConsolidatedWeather>? get consolidatedWeather => _consolidatedWeather;
  set consolidatedWeather(List<ConsolidatedWeather>? consolidatedWeather) =>
      _consolidatedWeather = consolidatedWeather;
  String? get time => _time;
  set time(String? time) => _time = time;
  String? get sunRise => _sunRise;
  set sunRise(String? sunRise) => _sunRise = sunRise;
  String? get sunSet => _sunSet;
  set sunSet(String? sunSet) => _sunSet = sunSet;
  String? get timezoneName => _timezoneName;
  set timezoneName(String? timezoneName) => _timezoneName = timezoneName;
  Parent? get parent => _parent;
  set parent(Parent? parent) => _parent = parent;
  List<Sources>? get sources => _sources;
  set sources(List<Sources>? sources) => _sources = sources;
  String? get title => _title;
  set title(String? title) => _title = title;
  String? get locationType => _locationType;
  set locationType(String? locationType) => _locationType = locationType;
  int? get woeid => _woeid;
  set woeid(int? woeid) => _woeid = woeid;
  String? get lattLong => _lattLong;
  set lattLong(String? lattLong) => _lattLong = lattLong;
  String? get timezone => _timezone;
  set timezone(String? timezone) => _timezone = timezone;

  WeatherApi.fromJson(Map<String, dynamic> json) {
    if (json['consolidated_weather'] != null) {
      _consolidatedWeather = <ConsolidatedWeather>[];
      json['consolidated_weather'].forEach((v) {
        _consolidatedWeather!.add(new ConsolidatedWeather.fromJson(v));
      });
    }
    _time = json['time'];
    _sunRise = json['sun_rise'];
    _sunSet = json['sun_set'];
    _timezoneName = json['timezone_name'];
    _parent =
        json['parent'] != null ? new Parent.fromJson(json['parent']) : null;
    if (json['sources'] != null) {
      _sources = <Sources>[];
      json['sources'].forEach((v) {
        _sources!.add(new Sources.fromJson(v));
      });
    }
    _title = json['title'];
    _locationType = json['location_type'];
    _woeid = json['woeid'];
    _lattLong = json['latt_long'];
    _timezone = json['timezone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this._consolidatedWeather != null) {
      data['consolidated_weather'] =
          this._consolidatedWeather!.map((v) => v.toJson()).toList();
    }
    data['time'] = this._time;
    data['sun_rise'] = this._sunRise;
    data['sun_set'] = this._sunSet;
    data['timezone_name'] = this._timezoneName;
    if (this._parent != null) {
      data['parent'] = this._parent!.toJson();
    }
    if (this._sources != null) {
      data['sources'] = this._sources!.map((v) => v.toJson()).toList();
    }
    data['title'] = this._title;
    data['location_type'] = this._locationType;
    data['woeid'] = this._woeid;
    data['latt_long'] = this._lattLong;
    data['timezone'] = this._timezone;
    return data;
  }
}

class ConsolidatedWeather {
  int? _id;
  String? _weatherStateName;
  String? _weatherStateAbbr;
  String? _windDirectionCompass;
  String? _created;
  String? _applicableDate;
  double? _minTemp;
  double? _maxTemp;
  double? _theTemp;
  double? _windSpeed;
  double? _windDirection;
  double? _airPressure;
  int? _humidity;
  double? _visibility;
  int? _predictability;

  ConsolidatedWeather(
      {int? id,
      String? weatherStateName,
      String? weatherStateAbbr,
      String? windDirectionCompass,
      String? created,
      String? applicableDate,
      double? minTemp,
      double? maxTemp,
      double? theTemp,
      double? windSpeed,
      double? windDirection,
      double? airPressure,
      int? humidity,
      double? visibility,
      int? predictability}) {
    if (id != null) {
      this._id = id;
    }
    if (weatherStateName != null) {
      this._weatherStateName = weatherStateName;
    }
    if (weatherStateAbbr != null) {
      this._weatherStateAbbr = weatherStateAbbr;
    }
    if (windDirectionCompass != null) {
      this._windDirectionCompass = windDirectionCompass;
    }
    if (created != null) {
      this._created = created;
    }
    if (applicableDate != null) {
      this._applicableDate = applicableDate;
    }
    if (minTemp != null) {
      this._minTemp = minTemp;
    }
    if (maxTemp != null) {
      this._maxTemp = maxTemp;
    }
    if (theTemp != null) {
      this._theTemp = theTemp;
    }
    if (windSpeed != null) {
      this._windSpeed = windSpeed;
    }
    if (windDirection != null) {
      this._windDirection = windDirection;
    }
    if (airPressure != null) {
      this._airPressure = airPressure;
    }
    if (humidity != null) {
      this._humidity = humidity;
    }
    if (visibility != null) {
      this._visibility = visibility;
    }
    if (predictability != null) {
      this._predictability = predictability;
    }
  }

  int? get id => _id;
  set id(int? id) => _id = id;
  String? get weatherStateName => _weatherStateName;
  set weatherStateName(String? weatherStateName) =>
      _weatherStateName = weatherStateName;
  String? get weatherStateAbbr => _weatherStateAbbr;
  set weatherStateAbbr(String? weatherStateAbbr) =>
      _weatherStateAbbr = weatherStateAbbr;
  String? get windDirectionCompass => _windDirectionCompass;
  set windDirectionCompass(String? windDirectionCompass) =>
      _windDirectionCompass = windDirectionCompass;
  String? get created => _created;
  set created(String? created) => _created = created;
  String? get applicableDate => _applicableDate;
  set applicableDate(String? applicableDate) =>
      _applicableDate = applicableDate;
  double? get minTemp => _minTemp;
  set minTemp(double? minTemp) => _minTemp = minTemp;
  double? get maxTemp => _maxTemp;
  set maxTemp(double? maxTemp) => _maxTemp = maxTemp;
  double? get theTemp => _theTemp;
  set theTemp(double? theTemp) => _theTemp = theTemp;
  double? get windSpeed => _windSpeed;
  set windSpeed(double? windSpeed) => _windSpeed = windSpeed;
  double? get windDirection => _windDirection;
  set windDirection(double? windDirection) => _windDirection = windDirection;
  double? get airPressure => _airPressure;
  set airPressure(double? airPressure) => _airPressure = airPressure;
  int? get humidity => _humidity;
  set humidity(int? humidity) => _humidity = humidity;
  double? get visibility => _visibility;
  set visibility(double? visibility) => _visibility = visibility;
  int? get predictability => _predictability;
  set predictability(int? predictability) => _predictability = predictability;

  ConsolidatedWeather.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _weatherStateName = json['weather_state_name'];
    _weatherStateAbbr = json['weather_state_abbr'];
    _windDirectionCompass = json['wind_direction_compass'];
    _created = json['created'];
    _applicableDate = json['applicable_date'];
    _minTemp = json['min_temp'];
    _maxTemp = json['max_temp'];
    _theTemp = json['the_temp'];
    _windSpeed = json['wind_speed'];
    _windDirection = json['wind_direction'];
    _airPressure = json['air_pressure'];
    _humidity = json['humidity'];
    _visibility = json['visibility'];
    _predictability = json['predictability'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['weather_state_name'] = this._weatherStateName;
    data['weather_state_abbr'] = this._weatherStateAbbr;
    data['wind_direction_compass'] = this._windDirectionCompass;
    data['created'] = this._created;
    data['applicable_date'] = this._applicableDate;
    data['min_temp'] = this._minTemp;
    data['max_temp'] = this._maxTemp;
    data['the_temp'] = this._theTemp;
    data['wind_speed'] = this._windSpeed;
    data['wind_direction'] = this._windDirection;
    data['air_pressure'] = this._airPressure;
    data['humidity'] = this._humidity;
    data['visibility'] = this._visibility;
    data['predictability'] = this._predictability;
    return data;
  }
}

class Parent {
  String? _title;
  String? _locationType;
  int? _woeid;
  String? _lattLong;

  Parent({String? title, String? locationType, int? woeid, String? lattLong}) {
    if (title != null) {
      this._title = title;
    }
    if (locationType != null) {
      this._locationType = locationType;
    }
    if (woeid != null) {
      this._woeid = woeid;
    }
    if (lattLong != null) {
      this._lattLong = lattLong;
    }
  }

  String? get title => _title;
  set title(String? title) => _title = title;
  String? get locationType => _locationType;
  set locationType(String? locationType) => _locationType = locationType;
  int? get woeid => _woeid;
  set woeid(int? woeid) => _woeid = woeid;
  String? get lattLong => _lattLong;
  set lattLong(String? lattLong) => _lattLong = lattLong;

  Parent.fromJson(Map<String, dynamic> json) {
    _title = json['title'];
    _locationType = json['location_type'];
    _woeid = json['woeid'];
    _lattLong = json['latt_long'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this._title;
    data['location_type'] = this._locationType;
    data['woeid'] = this._woeid;
    data['latt_long'] = this._lattLong;
    return data;
  }
}

class Sources {
  String? _title;
  String? _slug;
  String? _url;
  int? _crawlRate;

  Sources({String? title, String? slug, String? url, int? crawlRate}) {
    if (title != null) {
      this._title = title;
    }
    if (slug != null) {
      this._slug = slug;
    }
    if (url != null) {
      this._url = url;
    }
    if (crawlRate != null) {
      this._crawlRate = crawlRate;
    }
  }

  String? get title => _title;
  set title(String? title) => _title = title;
  String? get slug => _slug;
  set slug(String? slug) => _slug = slug;
  String? get url => _url;
  set url(String? url) => _url = url;
  int? get crawlRate => _crawlRate;
  set crawlRate(int? crawlRate) => _crawlRate = crawlRate;

  Sources.fromJson(Map<String, dynamic> json) {
    _title = json['title'];
    _slug = json['slug'];
    _url = json['url'];
    _crawlRate = json['crawl_rate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this._title;
    data['slug'] = this._slug;
    data['url'] = this._url;
    data['crawl_rate'] = this._crawlRate;
    return data;
  }
}
