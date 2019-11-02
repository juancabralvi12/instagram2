//
//  FeedControllerHelper.swift
//  lasttest
//
//  Created by Juan Cabral on 26/10/19.
//  Copyright © 2019 Juan Cabral. All rights reserved.
//

import UIKit
import CoreData

extension FeedController {
    
    func setupData() {
        insertPost(userName: "Juan Gabriel", userImage: UIImage(named: "joker")!, postImage: UIImage(named: "juanga")!, text: "A chuchita la bolsearon 1")
        insertPost(userName: "Slipknot Sanchez", userImage: UIImage(named: "slipknot")!, postImage: UIImage(named: "gatito")!, text: "A chuchita la bolsearon 2")
    }
    
    func insertPost(userName:String, userImage:UIImage, postImage:UIImage, text:String) {
        guard
            let appDelegate = UIApplication.shared.delegate as? AppDelegate
            else { return }
        let managedContext = appDelegate.persistentContainer.viewContext
        guard
            let postEntity = NSEntityDescription.entity(forEntityName: "MPost", in: managedContext)
            else { return }
        
        let userImageFileName = UUID().uuidString
        let postImageFileName = UUID().uuidString
        //Save
        let status =
            saveImage(image: userImage, fileName: userImageFileName) &&
            saveImage(image: postImage, fileName: postImageFileName)
        
        if status {
            let post = NSManagedObject(entity: postEntity, insertInto: managedContext)
            post.setValue(userName, forKey: "userName")
            post.setValue(userImageFileName, forKey: "userImage")
            post.setValue(postImageFileName, forKey: "postImage")
            post.setValue(text, forKey: "text")
            post.setValue(Date(), forKey: "date")
            
            commit(managedContext: managedContext)
            print("Successfuly! commited")
        }
    }
    
    func saveImage(image:UIImage, fileName:String) -> Bool {
        guard
            let data = image.jpegData(compressionQuality: 1) ?? image.pngData()
            else { return false }
        guard
            let directory = try? FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
            else { return false }
        
        let urls = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        print("This is the url:\(urls[urls.count-1] as URL)")
        
        do {
            try data.write(to: directory.appendingPathComponent("\(fileName).png"))
            print("Successfuly! saved image")
            return true
        } catch let error as NSError {
            print("Failed! Error details: ", error)
            return false
        }
    }
    
    func purge() {
        guard
            let appDelegate = UIApplication.shared.delegate as? AppDelegate
            else { return }
        let managedContext = appDelegate.persistentContainer.viewContext
        //select * from MPost => Lista de NSManagedObject
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "MPost")
        //where userName = 'Juan Gabriel'
        //fetchRequest.predicate = NSPredicate(format: "userName = %@ and userImage = %@", "Juan Gabriel", "joker")
        fetchRequest.includesPropertyValues = false
        
        do {
            let items = try managedContext.fetch(fetchRequest) as! [NSManagedObject]
            for item in items {
                managedContext.delete(item)
            }
            commit(managedContext: managedContext)
        } catch let error as NSError {
            print("Failed! Error details: ", error)
        }
    }
    
    fileprivate func commit(managedContext:NSManagedObjectContext) {
        do {
            try managedContext.save()
            print("Successfuly! Save changes")
        } catch let error as NSError {
            print("Failed! Error details: ", error)
        }
    }
    
    func fetchData() {
        guard
            let appDelegate = UIApplication.shared.delegate as? AppDelegate
            else { return }
        
        let managedContext = appDelegate.persistentContainer.viewContext
        //select * from MPost => Lista de NSManagedObject
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "MPost")
        //Genera la consulta:
        do {
            let result = try managedContext.fetch(fetchRequest)
            //Recorre por cada NSManagedObject:
            for data in result as! [NSManagedObject] {
                posts.append(data)
            }
        } catch let error as NSError {
            print("Failed! Error details: ", error)
        }
    }
}
