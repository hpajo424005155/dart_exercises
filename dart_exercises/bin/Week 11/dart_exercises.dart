import 'dart:async';

abstract class Vehicle {
  void startEngine();
}

class PublicTransport {
  String route;
  int capacity;

  PublicTransport(this.route, this.capacity);

  void displayInfo() {
    print('Route: $route | Capacity: $capacity passengers');
  }
}

mixin AirConditioned {
  void turnOnAircon() {
    print('Aircon is ON. Brrr! (Cooling the passengers)');
  }
}

class Jeepney extends PublicTransport with AirConditioned implements Vehicle {
  Jeepney(String route, int capacity) : super(route, capacity);

  @override
  void startEngine() {
    print('Jeepney Engine: "Broooommm! Bababa ba"');
  }

  Future<void> fetchRouteData() async {
    print('    [System] Fetching route data from server...');

    await Future.delayed(Duration(seconds: 2));

    print('    [System] Data fetched successfully for route $route!');
  }
}

void main() async {
  print('= Week 11: Async Jeepney System =\n');

  Jeepney jeep1 = Jeepney('Quiapo - Cubao', 16);

  jeep1.displayInfo();
  jeep1.startEngine();
  jeep1.turnOnAircon();

  print('\n- Loading Data -');

  print('The app is still responsive! You can still tap buttons.');

  await jeep1.fetchRouteData();

  print('\nLoading complete. Done!');
}
