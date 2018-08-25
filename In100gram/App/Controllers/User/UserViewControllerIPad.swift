//
//  UserViewControllerIPad.swift
//  In100gram
//
//  Created by Артем Полушин on 25.08.2018.
//  Copyright © 2018 Артем Полушин. All rights reserved.
//

import UIKit

class UserViewControllerIPad: UIViewController {

    @IBOutlet weak var userNameLabel: UILabel!
    
    private let factory = AuthRequestFactory()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        userNameLabel.text = "Loading..."
        
        factory.getCurrentUser() { [weak self] response in
            let user = response.value?.data
            self?.userNameLabel.text = user?.name
        }
    }
}
