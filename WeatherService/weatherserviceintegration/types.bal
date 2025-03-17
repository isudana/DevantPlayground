// Geo Location API response types
type GeoLocation record {|
    string name;
    record {|
        string...;
    |} local_names?;
    decimal lat;
    decimal lon;
    string country;
    string state?;
|};

// Weather API response types
type WeatherInfo record {|
    int id;
    string main;
    string description;
    string icon;
|};

type MainWeatherData record {|
    decimal temp;
    decimal feels_like;
    decimal temp_min;
    decimal temp_max;
    int pressure;
    int humidity;
|};

type WindInfo record {|
    decimal speed;
    int deg;
|};

type WeatherResponse record {|
    WeatherInfo[] weather;
    MainWeatherData main;
    WindInfo wind;
    int visibility;
    string name;
|};

type MyType record {|
    record {|
        decimal lon;
        decimal lat;
        json...;
    |} coord;
    record {|
        int id;
        string main;
        string description;
        string icon;
        json...;
    |}[] weather;
    string base;
    record {|
        decimal temp;
        decimal feels_like;
        decimal temp_min;
        decimal temp_max;
        int pressure;
        int humidity;
        int sea_level;
        int grnd_level;
        json...;
    |} main;
    int visibility;
    record {|
        decimal speed;
        int deg;
        decimal gust;
        json...;
    |} wind;
    record {|
        int all;
        json...;
    |} clouds;
    int dt;
    record {|
        int 'type;
        int id;
        string country;
        int sunrise;
        int sunset;
        json...;
    |} sys;
    int timezone;
    int id;
    string name;
    int cod;
    json...;
|};
