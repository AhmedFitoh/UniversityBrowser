//
//  UniversityTableCell.swift

//
//  Created by AhmedFitoh on 6/2/24.
//

import UIKit

class UniversityTableCell: UITableViewCell {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var stateLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        self.setupCell()
    }
    
    private func setupCell() {
        selectionStyle = .none
    }
    
    func setupCellWith(university: University) {
        nameLabel.text = university.name
        stateLabel.text = university.stateProvince
    }
}
