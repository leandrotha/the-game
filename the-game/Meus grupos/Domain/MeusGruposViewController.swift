//
//  MeusGruposViewController.swift
//  the-game
//
//  Created by Leandro Bartsch Tha on 12/02/19.
//  Copyright © 2019 Leandro B Tha. All rights reserved.
//

import UIKit

class MeusGruposViewController: UIViewController {

    //MARK: - Outlets
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    //MARK: - Properties
    
    var grupos: [Grupo] = [Grupo]()
    private let itemsPerRow: CGFloat = 3
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: "GrupoCell", bundle: nil), forCellWithReuseIdentifier: "GrupoCell")
        
        for index in 0..<10 {
            grupos.append(Grupo(title: "Grupo \(index)"))
        }
        collectionView.backgroundColor = .black
        collectionView.reloadData()
    }

}

extension MeusGruposViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (UIScreen.main.bounds.width / 2) - 16
        
        return CGSize(width: width, height: width)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    }

}

extension MeusGruposViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return grupos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GrupoCell", for: indexPath) as? GrupoCell else {return UICollectionViewCell()}
        
        cell.lblTitle.text = grupos[indexPath.row].title
        cell.backgroundColor = .black
        
        return cell
    }
    
    
}
