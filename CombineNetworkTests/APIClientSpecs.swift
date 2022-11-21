final class APIClientSpecs: QuickSpec {
    override func spec() {
        describe("calls requestObject with request") {
            context("with a valid response") {
                it("publishes the object") {
                    let client = APIClient()
                    let url = URL(string: StarWarsAPI.main.path)!
                    let request = URLRequest(url: url)
                    let result: PublisherResult<StarWars?, APIError> =
                    client.requestObject(using: request)
                        .test()
                    expect(result.outputs.first??.people)
                        .toEventually(equal(Self.peopleEndpoint),
                                      timeout: Self.timeout)
                    expect(result.failure)
                        .toEventually(beNil(),
                                      timeout: Self.timeout)
                }
            }
        }
        describe("calls requestObject with api") {
            context("with a valid response") {
                it("publishes the object") {
                    let client = APIClient()
                    let result: PublisherResult<StarWars?, APIError> =
                    client.requestObject(from: StarWarsAPI.main)
                        .test()
                    expect(result.outputs.first??.people)
                        .toEventually(equal(Self.peopleEndpoint),
                                      timeout: Self.timeout)
                    expect(result.failure)
                        .toEventually(beNil(),
                                      timeout: Self.timeout)
                }
            }
        }
        describe("calls requestObject with details") {
            context("with a valid response") {
                it("publishes the object") {
                    let client = APIClient()
                    let url = URL(string: StarWarsAPI.main.path)!
                    let result: PublisherResult<StarWars?, APIError> =
                    client.requestObject(from: url, using: .get)
                        .test()
                    expect(result.outputs.first??.people)
                        .toEventually(equal(Self.peopleEndpoint),
                                      timeout: Self.timeout)
                    expect(result.failure)
                        .toEventually(beNil(),
                                      timeout: Self.timeout)
                }
            }
        }
    }
}

private extension APIClientSpecs {
    static let timeout = DispatchTimeInterval.seconds(5)
    static let peopleEndpoint = "https://swapi.dev/api/people/"
}

import CombineUtility
import Quick
import Nimble
import Foundation
@testable import CombineNetwork
