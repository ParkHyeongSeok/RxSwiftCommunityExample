//
//  AnimatableTableViewCell.swift
//  RC_RxDataSource
//
//  Created by 박형석 on 2021/06/02.
//

import UIKit

class AnimatableTableViewCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    func updateUI(teacher: Teacher) {
        self.nameLabel.text = teacher.name
        self.ageLabel.text = "\(teacher.age)"
    }
}
