//
//  ViewController.swift
//  Core Data Demo
//
//  Created by Сергей Голенко on 27.12.2020.
//

import UIKit
import CoreData


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        let context = appDelegate?.persistentContainer.viewContext
         //create new user
        let newUser = NSEntityDescription.insertNewObject(forEntityName: "Users", into: context!)
        newUser.setValue("rob", forKey: "username")
        newUser.setValue("myparol", forKey: "password")
        newUser.setValue(31, forKey: "age")
        
        do {
            try context?.save()
            print("Save there")
            
        } catch {
            print("There was an error")
        }
        
        
        
        //grab saved info with coreData
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Users")
        request.returnsObjectsAsFaults = false
        do {
            let results = try context?.fetch(request)
            
            if results!.count > 0 {
                
                for i in results as! [NSManagedObject]{
                    if let userName = i.value(forKey: "username") as? String{
                        print(userName)
                    }
                    if let parol = i.value(forKey: "password") as? String {
                        print(parol)
                    }
                    if let age = i.value(forKey: "age") as? Int{
                        print(age)
                    }
                }
            }
        } catch {
            print("Could not fetch results")
        }
        
    }


}

