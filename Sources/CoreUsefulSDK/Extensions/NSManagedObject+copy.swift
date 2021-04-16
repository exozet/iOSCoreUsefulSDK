//
//  NSManagedObject+Utils.swift
//  DigitalAssortmentPlanner
//
//  Created by Philipp Homann on 29.04.20.
//  Copyright © 2020 Endava. All rights reserved.
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

import CoreData

extension NSManagedObject {
    
    
    public struct CopyOption : OptionSet {
        public init(rawValue: Int) {
            self.rawValue = rawValue
        }
        
        public let rawValue: Int
        
        public static let copyPrimitveDataTypes  = CopyOption(rawValue: 1 << 0)
        public static let copyOneToOneRelations = CopyOption(rawValue: 1 << 1)
        public static let copyOneToManyRelations  = CopyOption(rawValue: 1 << 2)
        public static let copyAll  = CopyOption(rawValue: 1 << 3)
        public static let deleteExistingOneToManySets  = CopyOption(rawValue: 1 << 4) // deleteDeathReferencesFromDB to avoid to have still existing but no more referenced data in DB
    }
    
    

	/// copies all properties of a given NSManagedObject to this instance.
    /// Attention, the properties should have the same name, or better would be that this instance and the given one should have the same type
    /// Properties which are no releations in core data will be copied just by putting the values of the given NSManagedObject properties
    /// to the properties of this  instance.
    /// For releations this would not be possible. Relations are reverences and should not be references mored than one time.
    ///
    /// To identify releations, logic assumes that they are from type NSManagesObject (1 to 1) or Set<NSManagedObject> (1 to many)
    ///
    /// 1 to 1 relations:
    /// For the case that the property it self is NOT nil, we just update the values, else  we create a copy of these releations
    /// by creation of new managed objects, fill with the data and then put to this instance.
    ///
    /// 1 to many relations:
    /// We just insert a new entity filled with the given data to the value. But in case of the property of self was not nil, than we would have a dead data set in DB.
    /// So for this case you could use option deleteExistingOneToManySets,  than maybe exisitng data will be deleted before we insert new
    /// But attention, also maybe existing sub relations will be deleted
    ///
    /// You have the possibility to mark a property as not copyable. For that just add copyable=NO to UserInfo in Core Data editor or manipulate
    /// the property description of entity description by setting this to userInfo dictionary
    public func copy(from givenEntity: NSManagedObject, options: CopyOption = .copyAll , ignore: [String] = []) throws {
           
        // get all available properties of given object by name
        if let propertyNames = givenEntity.propertyNames() {
            // iterate through the properties
            for propertyName in propertyNames {
                
                if ignore.contains(propertyName) {
                    continue
                }
                    
                // we don't want to copy all properties, for e.g. inverse relations as property which we don't need
                // so if the developer in core data editor marked an attribute as not copyable
                // we find out this here and will ignore this property
                let givenEntityDescription = givenEntity.entity
                let givenPropertyDescription = givenEntityDescription.propertiesByName[propertyName]
                if let isCopyable = givenPropertyDescription?.userInfo?["copyable"] as? String, isCopyable == "NO" {
                    continue
                }

                // now we have the value object of a property
                let givenValueObj = givenEntity.value(forKey: propertyName);
                   
                   // is it a 1to1 releation ?
                if (options.contains(.copyOneToOneRelations) || options.contains(.copyAll)) &&  givenValueObj is NSManagedObject  {
                   // we need to create a new entity and put the property values from given one into this new one
                   if let givenValueManagedObj = givenValueObj as! NSManagedObject? {
                    
                        // check do we have a value for given property in self
                        if let selfPropertyValue = self.value(forKey: propertyName) as? NSManagedObject {
                            // yes, so just lets update this
                            // but it is a NSManagedObject, so we have to call this copy function on self to copy all non managed objects
                            try selfPropertyValue.copy(from: givenValueManagedObj)
                        } else {
                            // we don't have an object in self, so lets create one
                            // init new managed object which we will use to write the values inside
                            let newEntity = NSManagedObject.init(entity: givenValueManagedObj.entity, insertInto: self.managedObjectContext)
                            do {
                                   // to write the values inside we just call the copy function again
                                   try newEntity.copy(from: givenValueManagedObj)

    //                            print ("#####prop Key : \(propertyName)")
    //                            print ("*****valueObj : \(String(describing: valueObj))")
    //                            print ("+++++copy from entity: \(entity)")
    //                            print ("-----copy into: \(self)")
                                
                                   // now set the new entity to this instance property
                                   self.setValue(newEntity, forKey: propertyName)
                                
                                   //print("copied value of property\(propertyName) as relation")
                            } catch {
                                throw(error)
                            }
                        }
                   }
                // is it a 1 to many releation?
                } else if (options.contains(.copyOneToManyRelations) || options.contains(.copyAll)) && givenValueObj is Set<NSManagedObject> {
                    if let givenValuesSet = givenValueObj as! Set<NSManagedObject>? {
                        
                        // maybe we still have a set in self, so let's delete them
                        if options.contains(.deleteExistingOneToManySets) {
                            if let oldPropertyValue = self.value(forKey: propertyName) as? Set<NSManagedObject> {
                                for item in oldPropertyValue {
                                    self.managedObjectContext?.delete(item)
                                }
                            }
                        }
                        
                        // we get it from a Set,so we also have to write it back into a set, lets create one
                        var newSet:Set<NSManagedObject> = []
                        for givenValueSetItem in givenValuesSet {
                      
                            // init new managed object which we will use to write the values inside
                            let newEntity = NSManagedObject.init(entity: givenValueSetItem.entity, insertInto: self.managedObjectContext)
                            do {
                                // to write the values inside we just call the copy function again
                                try newEntity.copy(from: givenValueSetItem)
                                // put the entity into the new Set
                                newSet.insert(newEntity)
                                //print("copied value of property\(propertyName) as one to many relation")
                            } catch {
                                throw(error)
                            }
                        }
                        // now set the new entity to this instance property
                        // print ("#####prop Key : \(propertyName)")
                        // print ("+++++copy from entity: \(entity)")
                        // print ("-----copy into: \(self)")
                        
                        self.setValue(newSet, forKey: propertyName)
                    }
                // or is it just a property ?
                } else if options.contains(.copyPrimitveDataTypes) || options.contains(.copyAll){
                       // just set the value of given property to this instance property
                       self.setValue(givenValueObj, forKey: propertyName)
                       //print("copied value of proerty \(propertyName)")
                }
             }
           } else {
              throw(NSError(domain:"NSManagedObject - Copy", code:501, userInfo:[ NSLocalizedDescriptionKey: "could not unwrap property names"]))
           }
       }
    

}

