//
//  Entity+CoreDataProperties.swift
//  RestaurantsAppCoreData
//
//  Created by GenericDevTexas on 7/25/25.
//
//

import Foundation
import CoreData


extension RestaurantEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<RestaurantEntity> {
        return NSFetchRequest<RestaurantEntity>(entityName: "RestaurantEntity")
    }

    @NSManaged public var id: String?
    @NSManaged public var name: String?
    @NSManaged public var address: String?
    @NSManaged public var imageURL: String?
    @NSManaged public var rating: Double
    @NSManaged public var latitude: Double
    @NSManaged public var longitude: Double

}

extension RestaurantEntity : Identifiable {

}
