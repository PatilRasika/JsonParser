//
//  DataCell.swift
//  JsonParsingAssignment

import UIKit

class DataCell: UITableViewCell {

    @IBOutlet var title: UILabel!
    @IBOutlet var descriptionLbl: UILabel!
    @IBOutlet var imgView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
