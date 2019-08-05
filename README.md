# WeatherApp

API:

http://api.openweathermap.org/data/2.5/forecast/daily 

 

This API is not available on free versions of API. Hence not using it in sample weather app.

Using API
http://api.openweathermap.org/data/2.5/forecast

Instructions:


Go To Folder: WeatherApp/ WeatherApp and then execute pod install. It will install all the required frameworks and libraries.

Open WeatherApp.xworkspace and run the code.
 
Simply run the App with XCODE 10.0 

It will show Auckland’s weather. App will get Forecast for 5 days.

Project Structure and Model:

I have used MVC model for this project. There are two components

Main 
In main there is MVC folders with 

•	Model for this component
•	Views used in this component
•	Controller used in this component

Detail

a


In Detail there is MVC folders with 

•	Model for this component
•	Views used in this component
•	Controller used in this component



Network calls and API Calls:

WebServices

In class weather services using URLSession api to call webservices

•	func weather(forCity city: String, completionHandler: @escaping (WeatherResult) -> Void)

•	func weather(forCity city: String, fromJsonData data: Data) -> WeatherResult 


WeatherResult returns Parsed JSON Data from API

For Parsing JSON using Library SwiftyJSON


