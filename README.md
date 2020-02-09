# iOSCoreUsefulSDK

### A most useful SDK written for iOS Projects.

Check out the `docs/index.html` file to explore all useful methods.

## Installation

**iOSCoreUsefulSDK** uses new Swift Package Manager which is easiest way introduced for iOS projects since from the beginning. 

From Xcode simply select `File > Swift Packages > Add Package Dependency...` and paste `https://github.com/exozet/iOSCoreUsefulSDK` to search field. You can specify rules according to your preferences and you are ready to use. 

## Useful Extensions Collection

The library itself contains more than **100** extensions, which are not only as a *placeholder*, but really **useful** to contain. 
### Still in progress. 

### Array Extensions (Available iOS, Apple TV, watchOS, macOS)


```swift
func get(index: Int) -> Element?
```
Returns element at the index, if index is valid.
<br><br>


```swift
func insert(_ nullableElement: Element?)
```
Appends element to array if its not `nil`. So that, you don't need to check beforehand.
<br><br>

```swift
func insert(_ nullableArray: [Element]?) 
```
Appends elements into the current array.
<br><br>


```swift
static func + (Array<Element>, Element?) -> Array<Element>

// example usage
let newArray = ["1", "2", "3"] + "4"
```
Inserts the element into given array by using `+` operator.
<br><br>


```swift
static func += (Array<Element>, Element?)

// example usage
var array = ["1", "2", "3"]
array += "4"
```
Inserts the element into given array by using `+=` operator.
<br><br>



### AVPlayer Extensions (Available iOS, Apple TV, macOS)

```swift
var isPlaying: Bool
```
Checks rate and error state of the player, and returns `true` if player conforms and started to play.
<br><br>



### Bundle Extensions (Available iOS, Apple TV, watchOS, macOS)

```swift
class var versionInfo: String
```
Returns user friendly app version string.
<br><br>



### CGSize Extensions (Available iOS, Apple TV, watchOS, macOS)

```swift
static func - (CGSize, CGFloat) -> CGSize
```
 Reduces the width and height with the given amount.
 
```swift
// How to use:
let size = CGSize(width: 5, height: 5)
let newSize = size - 3
```
<br>


```swift
static func + (CGSize, CGFloat) -> CGSize
```
Increases the width and height with the given amount.
 
```swift
// How to use:
let size = CGSize(width: 5, height: 5)
let newSize = size + 3
```
<br>


```swift
static func += (CGSize, CGSize) -> CGSize
```
Adds right handside to left handside.
 
```swift
// How to use:
var size = CGSize(width: 5, height: 5)
size += CGSize(width: 3, height: 3)
```
<br>


```swift
static func -= (CGSize, CGSize) -> CGSize
```
Decreases the size with the given right handside.
 
```swift
// How to use:
var size = CGSize(width: 5, height: 5)
size -= CGSize(width: 3, height: 3)
```
<br>


```swift
static func += (CGSize, CGFloat) -> CGSize
static func += (CGSize, Double) -> CGSize
static func += (CGSize, Int) -> CGSize
```
Adds right handside to left handside.
 
```swift
// How to use:
var size = CGSize(width: 5, height: 5)
size += 3
```
<br>


```swift
static func -= (CGSize, CGFloat) -> CGSize
static func -= (CGSize, Double) -> CGSize
static func -= (CGSize, Int) -> CGSize
```
Decreases the size with the given right handside.
 
```swift
// How to use:
var size = CGSize(width: 5, height: 5)
size -= 3
```
<br>



### CGPoint Extensions (Available iOS, Apple TV, watchOS, macOS)


```swift
static func + (CGPoint, CGFloat) -> CGPoint
```
Increases the X and Y points with the given amount.
 
```swift
// How to use:
let point = CGPoint(x: 5, y: 5)
let newPoint = point + 3
```
<br>


```swift
static func - (CGPoint, CGFloat) -> CGPoint
```
Reduces the X and Y points with the given amount.
 
```swift
// How to use:
let point = CGPoint(x: 5, y: 5)
let newPoint = point - 3
```
<br>


```swift
static func + (CGPoint, CGPoint) -> CGPoint
```
Adds two point.
 
```swift
// How to use:
let newPoint = CGPoint(x: 5, y: 5) + CGPoint(x: 3, y:3)
```
<br>


```swift
static func - (CGPoint, CGPoint) -> CGPoint
```
Reduces the point with the given point.
 
```swift
// How to use:
let newPoint = CGPoint(x: 5, y: 5) - CGPoint(x: 3, y:3)
```
<br>


```swift
func += (CGPoint, CGPoint) -> CGPoint
```
Adds right handside to left handside.
 
```swift
// How to use:
var point = CGPoint(x: 5, y: 5)
point += CGPoint(x: 3, y: 3)
```
<br>


```swift
static func -= (CGPoint, CGPoint) -> CGPoint
```
Decreases left handside with right handside.
 
```swift
// How to use:
var point = CGPoint(x: 5, y: 5)
point -= CGPoint(x: 3, y: 3)
```
<br>


```swift
static func += (CGPoint, CGFloat) -> CGPoint
static func += (CGPoint, Double) -> CGPoint
static func += (CGPoint, Int) -> CGPoint
```
Adds right handside to left handside.
 
```swift
// How to use:
var point = CGPoint(x: 5, y: 5)
point += 3
```
<br>


```swift
static func -= (CGPoint, CGFloat) -> CGPoint
static func -= (CGPoint, Double) -> CGPoint
static func -= (CGPoint, Int) -> CGPoint
```
Decreases the size with the given right handside.
 
```swift
// How to use:
var point = CGPoint(x: 5, y: 5)
point -= 3
```
<br>


### CLLocation Extensions (Available iOS, Apple TV, watchOS, macOS)

```swift
init(coordinate: CLLocationCoordinate2D)
```
Initializes the location object with the given coordinates.
<br><br>


### CLLocationCoordinate2D Extensions (Available iOS, Apple TV, watchOS, macOS)

```swift
var logDescription: String
```
Represents latitude and longitude information in a readable way.
<br><br>


```swift
static func == (CLLocationCoordinate2D, CLLocationCoordinate2D) -> Bool
```
CLLocationCoordinate conforms equality, and gives possibility to compare two of them.
<br><br>


### CLLocationDegrees Extensions (Available iOS, Apple TV, watchOS, macOS)

```swift
var inMeters: Double
```
Converts Degrees into meters value.
<br><br>


### CMTime Extensions (Available iOS, Apple TV, macOS)
```swift
func getTimeLabel() -> String
```
Returns readable time tabel from minutes and seconds. (e.g. XX:XX)
<br><br>


```swift
static func + (CMTime, TimeInterval) -> CMTime
```
Returns CMTime with adding specified interval.
 
```swift
// How to use:
let newTime = CMTime(seconds: 50, preferredTimescale: .min) + 50
```
<br>


```swift
static func - (CMTime, TimeInterval) -> CMTime
```
Returns CMTime with decreasing specified interval.
 
```swift
// How to use:
let newTime = CMTime(seconds: 50, preferredTimescale: .min) - 50
```
<br>


```swift
static func += (CMTime, TimeInterval) -> CMTime
```
Adds time interval to CMTime object.
 
```swift
// How to use:
var time = CMTime(seconds: 50, preferredTimescale: .min)
time += 50
```
<br>


```swift
static func -= (CMTime, TimeInterval) -> CMTime
```
Decreases CMTime object with the given time interval.
 
```swift
// How to use:
var time = CMTime(seconds: 50, preferredTimescale: .min)
time -= 50
```
<br>


### Date Extensions (Available iOS, Apple TV, watchOS, macOS)

```swift
func isSameDay(Date) -> Bool
```
Returns `true`, if it belongs to the same day with the given date value.
<br><br>


```swift
func format(String) -> String
```
Returns date object with the given format as string.
<br><br>


```swift
var isToday: Bool
```
Returns `true` if date corresponds today.
<br><br>


```swift
var isYesterday: Bool
```
Returns `true` if date corresponds yesterday.
<br><br>


```swift
var isTomorrow: Bool
```
Returns `true` if date corresponds tomorrow.
<br><br>


```swift
var isTheDayAfterTomorrow: Bool
```
Returns `true` if date corresponds the day after tomorrow.
<br><br>


### Double Extensions (Available iOS, Apple TV, watchOS, macOS)

```swift
func rounded(Int) -> Double
```
Rounds the double to decimal places value.
<br><br>

### Int Extensions (Available iOS, Apple TV, watchOS, macOS)

```swift
var asFahrenheit: Int
```
Converts the integer format Celcius into the Fahrenheit.
<br><br>


```swift
var asCelcius: Int
```
Converts the integer format Fahrenheit into the Celcius.
<br><br>

### MKMapView Extensions (Available iOS, Apple TV, macOS)

```swift
func setCenter(offset: CGPoint, coordinate: CLLocationCoordinate2D, animated: Bool) -> Double
```
Sets center of the mapview with the given offset.
<br><br>


```swift
func edgePoints(dx: CGFloat, dy: CGFloat) -> Edges
```
Converts Edge points with the given insets.
<br><br>

### NSAttributedString Extensions (Available iOS, Apple TV, watchOS, macOS)
### Dictionary Extensions (Available iOS, Apple TV, watchOS, macOS)
### NSError Extensions (Available iOS, Apple TV, watchOS, macOS)
### NSObject Extensions (Available iOS, Apple TV, watchOS, macOS)
### String Extensions (Available iOS, Apple TV, watchOS, macOS)
### UIAlertAction Extensions (Available iOS, Apple TV)
### UIAlertController Extensions (Available iOS, Apple TV)
### UIApplication Extensions (Available iOS, Apple TV)
### UICollectionView Extensions (Available iOS, Apple TV)
### UIColor Extensions (Available iOS, Apple TV, watchOS)
### UIDevice Extensions (Available iOS, Apple TV)
### UIFont Extensions (Available iOS, Apple TV, watchOS)
### UILabel Extensions (Available iOS, Apple TV)
### UIStatusBarStyle Extensions (Available iOS)
### UITableView Extensions (Available iOS, Apple TV)
### UIView Extensions (Available iOS, Apple TV)
### URL Extensions (Available iOS, Apple TV, watchOS, macOS)
### UIKit Localizations Extensions (Available iOS, Apple TV)
All UI elements, have inspectable variable for the texts that might useful to have direct setter for `localized` string.

## Logging Manager
All services that are part of the **UsefulSDK** or any other service in the app level can use, `LoggingManager` service to pass messages.

The listener class from the app-level should be set into `LoggingManager.delegate` property, which also needs to conform `LoggingDelegate` protocol, and can receive messages via `log:message:level:domain:source:` method.

### LogLevel
Each messages from the `LoggingManager` carry their level, e.g. importance.

```swift
/// minimum level of logs
case verbose

/// standard level of logs
case info

/// warning level
case warning

/// level for error logs
case error
```

### LogDomain
In order to messages do more sense, also all messages carry their specified domain informations, e.g. which kind of part of the application/service responsible for it.

```swift
/// app domain
case app

/// view domain
case view

/// layout domain
case layout

/// controller domain
case controller

/// routing domain
case routing

/// service domain
case service

/// network domain
case network

/// data model domain
case model

/// cache domain
case cache

/// database domain
case db

/// input/output domain
case io
```
