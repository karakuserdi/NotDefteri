//
//  NotTableViewCell.swift
//  NotDefteri
//
//  Created by Riza Erdi Karakus on 27.12.2021.
//

import UIKit

class NotTableViewCell: UITableViewCell {

    @IBOutlet weak var cellView: UIView!
    @IBOutlet weak var notBasligiLabel: UILabel!
    @IBOutlet weak var notTarihLabel: UILabel!
    @IBOutlet weak var notTypeView: UIView!
    @IBOutlet weak var notTypeLabel: UILabel!
    @IBOutlet weak var notIcerikLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureCellUI()
        
    }
    
    //Cell için görsel ayarlar
    func configureCellUI(){
        cellView.layer.cornerRadius = 10
        cellView.layer.masksToBounds = false
        cellView.layer.shadowOffset = CGSize(width: 0, height: 0)
        cellView.layer.shadowColor = UIColor.orange.cgColor
        cellView.layer.shadowOpacity = 0.50
        cellView.layer.shadowRadius = 5
        
        notTypeView.layer.cornerRadius = 5
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
