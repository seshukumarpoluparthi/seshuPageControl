//
//  TableViewController.swift
//  seshuPageControl
//
//  Created by apple on 9/2/18.
//  Copyright © 2018 apple. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    let users = [User(name: "seshu", email: "seshu@gmail.com"),User(name: "naveen", email: "naveen@gmail.com"),User(name: "kumar", email: "kumar@gmail.com"),User(name: "seshu", email: "seshu@gmail.com"),User(name: "naveen", email: "naveen@gmail.com"),User(name: "kumar", email: "kumar@gmail.com")]
    

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: UserCell.identifier) as? UserCell else {
            return UITableViewCell()
        }
        let user = users[indexPath.row]
//        cell.nameLabel.text = user.name
//        cell.emailLabel.text = user.email
        cell.populate(with: user)
        return cell
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
}
