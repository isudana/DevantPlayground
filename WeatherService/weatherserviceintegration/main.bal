import ballerina/http;

final http:Client geoClient = check new ("http://api.openweathermap.org");
final http:Client weatherClient = check new ("https://api.openweathermap.org");

service / on new http:Listener(8080) {
    resource function get weather/[string cityName]() returns anydata|error {
        // Get geographic coordinates for the city
        string geoPath = string `/geo/1.0/direct?q=${cityName}&limit=1&appid=${weatherApiKey}`;
        GeoLocation[] locations = check geoClient->get(path = geoPath);

        if locations.length() == 0 {
            return error("City not found");
        }

        GeoLocation location = locations[0];
        decimal latitude = location.lat;
        decimal longitude = location.lon;

        // Get weather data using coordinates
        string weatherPath = string `/data/2.5/weather?lat=${latitude}&lon=${longitude}&appid=${weatherApiKey}&units=metric`;
        MyType weatherData = check weatherClient->get(weatherPath);

        return weatherData;
    }
}
