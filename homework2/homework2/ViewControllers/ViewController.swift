//
//  ViewController.swift
//  homework2
//
//  Created by Berkay on 8.01.2023.
//

import UIKit

class ViewController: UIViewController {
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    
    @IBAction func toUpperVC(_ sender: Any) {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        if let vc = storyBoard.instantiateViewController(withIdentifier: "UpperViewController") as? UpperViewController {
            vc.modalPresentationStyle = .fullScreen
            present(vc, animated: true)
            
        }
    }
    
    
    @IBAction func toLowerVC(_ sender: Any) {
        
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        if let vc = storyBoard.instantiateViewController(withIdentifier: "LowerViewController") as? LowerViewController {
            vc.modalPresentationStyle = .fullScreen
            present(vc, animated: true)
        }
        
    }
}

