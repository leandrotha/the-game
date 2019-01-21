//
//  MeusAmigosTableViewCell.swift
//  the-game
//
//  Created by Livetouch on 18/01/19.
//  Copyright © 2019 Leandro B Tha. All rights reserved.
//

import UIKit

class MeusAmigosTableViewCell: UITableViewCell {

    //MARK: - Outlets
    
    @IBOutlet weak var ivFoto: UIImageView!
    @IBOutlet weak var lblNome: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
}
