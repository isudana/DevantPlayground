import ballerina/http;
import ballerina/lang.value;

final http:Client geoClient = check new ("http://api.openweathermap.org/geo/1.0");
final http:Client weatherClient = check new ("https://api.openweathermap.org/data/2.5");

service / on new http:Listener(8080) {
    resource function get weather/[string cityName]() returns WeatherResponse|error {
        // Get geo coordinates
        json geoResponse = check geoClient->/direct(q = cityName, appid = weatherApiKey);
        json[] locations = check value:ensureType(geoResponse);
        if locations.length() == 0 {
            return error("City not found");
        }

        GeoLocation location = check locations[0].cloneWithType();

        // Get weather data
        json weatherResponse = check weatherClient->/weather(
            lat = location.lat,
            lon = location.lon,
            appid = weatherApiKey
        );

        return check weatherResponse.cloneWithType();
    }
}