//
//  ViewController.swift
//  CoreData Intro
//
//  Created by Syed Askari on 8/25/17.
//  Copyright © 2017 Syed Askari. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        // Sotring CoreData
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        let context = appDelegate.persistentContainer.viewContext
        
        // Saving
//        let newUsers = NSEntityDescription.insertNewObject(forEntityName: "Users", into: context)
//        
//        newUsers.setValue("Asfand", forKey: "username")
//        newUsers.setValue("12345678", forKey: "password")
//        
//        do {
//            try context.save()
//            print ("successful inserting data into coreData")
//        } catch _ {
//            print ("Error with CoreData")
//        }
        
        // Viewing
        
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Users")
        
        request.returnsObjectsAsFaults = false
        
        do {
            let results = try context.fetch(request)
            if results.count > 0 {
                for result in results as! [NSManagedObject] {
                    if let userName = result.value(forKey: "username") as? String {
                        print("userName: \(userName)")
                    }
                    if let password = result.value(forKey: "password") as? String {
                        print("password: \(password)")
                    }
                }
            } else {
                print ("No data in CoreData")
            }
        } catch _ {
            print ("Error with CoreData")
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

