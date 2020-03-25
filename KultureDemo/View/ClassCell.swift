//
//  ClassCell.swift
//  KultureDemo
//
//  Created by Aleksei Chupriienko on 25.03.2020.
//  Copyright © 2020 Aleksei Chupriienko. All rights reserved.
//

import UIKit

class ClassCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var dateTimeLabel: UILabel!
    
    @IBOutlet weak var teacherLabel: UILabel!
        override func prepareForReuse() {
            nameLabel.text = ""
            dateTimeLabel.text = ""
            teacherLabel.text = ""
    }
    
    func configure(with myClass: AllDayClass) {
        let teacherName = myClass.classes.teacher.name
        let className = teacherName == "Jae Ang" ? String(myClass.classes.name.dropLast(5)) : String(myClass.classes.name.dropLast(teacherName.count + 2))
        nameLabel.text = className
        dateTimeLabel.text = myClass.date + " " + myClass.startTime
        teacherLabel.text = teacherName
    }
}
