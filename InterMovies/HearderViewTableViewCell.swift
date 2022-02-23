//
//  HearderViewTableViewCell.swift
//  InterMovies
//
//  Created by Felipe Yuiti on 18/02/22.
//

import UIKit

class HearderViewTableViewCell: UITableViewCell {

    @IBOutlet weak var leftHearderLabel: UILabel!
    
    @IBOutlet weak var rightHearderLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
