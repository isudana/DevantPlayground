import ballerina/http;

service / on new http:Listener(9090) {
    resource function get greeting(string name) returns Greeting {
        return {
            message: string:'join(" ", "Hello", name + "!")
        };
    }
}