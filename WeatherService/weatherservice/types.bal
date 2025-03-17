type LocalNames record {|
    string ascii;
    string feature_name;
    string...;
|};

type GeoLocation record {|
    string name;
    LocalNames local_names?;
    decimal lat;
    decimal lon;
    string country;
    string state?;
|};

type Coordinates record {|
    decimal lon;
    decimal lat;
|};

type Weather record {|
    int id;
    string main;
    string description;
    string icon;
|};

type MainWeather record {|
    decimal temp;
    decimal feels_like;
    decimal temp_min;
    decimal temp_max;
    int pressure;
    int humidity;
    int sea_level?;
    int grnd_level?;
|};

type Wind record {|
    decimal speed;
    int deg;
    decimal gust?;
|};

type Clouds record {|
    int all;
|};

type System record {|
    int 'type;
    int id;
    string country;
    int sunrise;
    int sunset;
|};

type WeatherResponse record {|
    Coordinates coord;
    Weather[] weather;
    string base;
    MainWeather main;
    int visibility;
    Wind wind;
    Clouds clouds;
    int dt;
    System sys;
    int timezone;
    int id;
    string name;
    int cod;
|};