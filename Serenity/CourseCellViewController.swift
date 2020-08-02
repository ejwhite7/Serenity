//
//  CourseCellViewController.swift
//  Serenity
//
//  Created by Edward White on 7/31/20.
//

import UIKit

class CourseCellViewController: UITableViewCell {
    
    @IBOutlet private var courseNo: UILabel!
    @IBOutlet private var titleLabel: UILabel!
    @IBOutlet private var subHeading: UILabel!
    
    func populate(course: Course) {
        courseNo.text = course.documentID
        titleLabel.text = course.title
        subHeading.text = course.subheading
    }
    
    override func prepareForReuse() {
      super.prepareForReuse()
    }
}
