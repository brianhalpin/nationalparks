# nationalparks
An iOS app to get data from the US National Parks API and display the results.

- The data is downloaded from a public API, and persisted in Core Data. 
- It only updates the Core Data model once; on a scaled up project, this should compare the JSON with Core Data to check if new entities should be added.
- Includes Unit Testing to check if the NationalPark model file conforms to a test JSON result.
