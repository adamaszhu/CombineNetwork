# CombineNetwork

![Platform](https://img.shields.io/badge/platform-iOS%2013.0+-9a9a9a.svg)
![Cocoapods](https://img.shields.io/badge/pod-v1.0.0-3a7db8.svg)
![PM](https://img.shields.io/badge/swift%20package%20manager-v1.0.0-72c147.svg)

`CombineNetwork` provides simple interfaces for making a network call using `Combine.framework`.

## Installation
### Cocoapods
Include the following line in the `Podfile`

`pod CombineNetwork`

### Swift package manager
Add a `Package Dependency` using the current Github URL

## Reference
- [Documentation](https://adamaszhu.github.io/CombineNetwork/)

## Sample

### Test JSON file
`https://swapi.co/api`

### JSON model
```
struct StarWars: Decodable {
    let films: String
}
```

### Retrieve data from the JSON file
```
let client = APIClient()
let url = URL(string: "https://swapi.dev/api/")!
let subscriber = Subscribers.Sink<StarWars?, APIError>(
    receiveCompletion: { print($0) },
    receiveValue: { print($0) })
client.requestObject(from: url, using: .get)
    .subscribe(subscriber)
```
