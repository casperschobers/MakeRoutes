# iOS 7 Logboek
## De app
Ik heb gekozen om de app Make Routes te gaan maken de doel van deze app is dat je m.b.v. een kaartje een route kan uitstippelen. Deze routes moet je kunnen opslaan en later terug kunnen kijken.

## Dag 1

Als eerste heb ik heb start project gemaakt. Met een `MKMapView` erin. Hier voeg ik op een `LongPressedGesture` een `MKPointAnnotation` (Marker) toe aan de kaart. 
```
let tappedPoint = sender.location(in: self.mapView)
let tappedCoordinate = mapView.convert(tappedPoint, toCoordinateFrom: self.mapView)
let tapMarker = MKPointAnnotation()
tapMarker.coordinate = tappedCoordinate
self.mapView.addAnnotation(tapMarker)

```
Als er meer dan 2 markers op de kaart staan teken in een `MKPolyline` tussen deze markers. Van de route die ontstaat door de geplaatste markers wordt de lengte berekend. 
![Screenshot 1](images/app-w1.png)

En tot slot heb ik nog een appicon gemaakt voor de app.
![Appicon](images/appicon.png)