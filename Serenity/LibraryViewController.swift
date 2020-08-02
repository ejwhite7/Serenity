//
//  ViewController.swift
//  Meditation_Library
//
//  Created by Edward White on 7/22/20.
//  Copyright © 2020 EJ White. All rights reserved.
//

import Firebase
import UIKit

class LibraryViewController: UITableViewController {
    
    var courses: [Course] = []
    
    override func viewDidLoad() {
        super .viewDidLoad()
        reload()
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
            return 1 
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return courses.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CourseCell",
                                                            for: indexPath) as! CourseCellViewController
        let item = courses[indexPath.row]
        cell.populate(course: item)
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowCourseSegue" {
            if let destination = segue.destination as? CourseViewController {
            destination.course = courses[tableView.indexPathForSelectedRow!.row]
            }
        }
    }
    
    func reload() {
        CourseManager.main.getAllCourses() { [self] (allCourses) in
            courses = allCourses
            CourseManager.main.stopGettingAllCourses()
            tableView.reloadData()
        }
    }
}

