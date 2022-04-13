//
//  DeliveryApi.swift
//  DeliveryAppChallenge
//
//  Created by Rodrigo Borges on 27/10/21.
//

import Foundation

struct DeliveryApi {

    func fetchRestaurants(_ completion: @escaping ([Restaurant]?) -> Void) {

        let url = URL(string: "https://raw.githubusercontent.com/devpass-tech/challenge-viewcode-delivery/main/api/home_restaurant_list.json")!

        let dataTask = URLSession.shared.dataTask(with: url) { data, response, error in

            guard error == nil else {
                completion(nil)
                return
            }

            guard let data = data else {
                completion(nil)
                return
            }

            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let restaurants = try decoder.decode([Restaurant].self, from: data)
                completion(restaurants)
            } catch {
                print(error)
                completion(nil)
            }
        }

        dataTask.resume()
    }

    func searchAddresses(_ completion: @escaping ([Address]?) -> Void) {

        let url = URL(string: "https://raw.githubusercontent.com/devpass-tech/challenge-viewcode-delivery/main/api/address_search_results.json")!

        let dataTask = URLSession.shared.dataTask(with: url) { data, response, error in

            guard error == nil else {
                completion(nil)
                return
            }

            guard let data = data else {
                completion(nil)
                return
            }

            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let addresses = try decoder.decode([Address].self, from: data)
                completion(addresses)
            } catch {
                print(error)
                completion(nil)
            }
        }

        dataTask.resume()
    }

    func fetchRestaurantDetails(_ completion: @escaping (RestaurantDetails?) -> Void) {

        let url = URL(string: "https://raw.githubusercontent.com/devpass-tech/challenge-viewcode-delivery/main/api/restaurant_details.json")!

        let dataTask = URLSession.shared.dataTask(with: url) { data, response, error in

            guard error == nil else {
                completion(nil)
                return
            }

            guard let data = data else {
                completion(nil)
                return
            }

            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let restaurantDetails = try decoder.decode(RestaurantDetails.self, from: data)
                completion(restaurantDetails)
            } catch {
                print(error)
                completion(nil)
            }
        }

        dataTask.resume()
    }
}
