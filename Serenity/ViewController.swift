//
//  ViewController.swift
//  Meditation_Library
//
//  Created by Edward White on 7/22/20.
//  Copyright © 2020 EJ White. All rights reserved.
//

import FirebaseFirestore
import UIKit

class LibraryViewController: UITableViewController {
    let db = Firestore.firestore()
    var courses: [Course] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        getAllCourses()
    }

    func getAllCourses() {
        print("Arrived")
        db.collection("courses").getDocuments{ (querySnapshot, error) in
        if let error = error {
            print("\(error.localizedDescription)")
        } else {
            for document in (querySnapshot?.documents)! {
                //self.courses = document.results
                //self.id = document.data()["id"] as? String
                //self.title = document.data()["title"] as? String
                //self.subtitle = document.data()["subtitle"] as? String
                //self.description = document.data()["description"] as? String
                //self.link = document.data()["link"] as? String
                //self.courses.append(self.course)
                }
            }
        }
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
            return 1
        }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return self.courses.count
        }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let item = self.courses[indexPath.row]
        //cell.textLabel!.text = item.courseInfo.title
            return cell
    }
}
