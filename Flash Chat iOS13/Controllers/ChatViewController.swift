//
//  ChatViewController.swift
//  Flash Chat iOS13
//

//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit
import Firebase

class ChatViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var messageTextfield: UITextField!
    
<<<<<<< HEAD
    let db = Firestore.firestore()
    
    var messages: [Messages] = []
=======
    var messages: [Messages] = [
      Messages(sender: "1@2.de", body: "Hi"),
      Messages(sender: "2@3.de", body: "Hey"),
      Messages(sender: "1@2.de", body: "What's up?")
    ]
>>>>>>> 68dfdd19f4af45055921348f04d85a7217617d4d
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        title = K.appName
        navigationItem.hidesBackButton = true
        tableView.register(UINib(nibName: K.cellNibName, bundle: nil), forCellReuseIdentifier: K.cellIdentifier)
<<<<<<< HEAD
        
        loadMessages()
    }
    
    func loadMessages() {
        messages = []
        db.collection(K.FStore.collectionName).getDocuments { (querySnapshot, error) in
            if let e = error {
                print("There was an issue retriving data from FireStore. \(e)")
            } else {
                if let snapshopDocuments = querySnapshot?.documents {
                    for doc in snapshopDocuments {
                        let data = doc.data()
                        if let messageSender = data[K.FStore.senderField] as? String, let messageBody = data[K.FStore.bodyField] as? String {
                            let newMessage = Messages(sender: messageSender, body: messageBody)
                            self.messages.append(newMessage)
                            
                            DispatchQueue.main.async {
                                self.tableView.reloadData()
                            }
                        }
                    }
                }
            }
        }
=======
>>>>>>> 68dfdd19f4af45055921348f04d85a7217617d4d
    }
    
    @IBAction func sendPressed(_ sender: UIButton) {
        if let messageBody = messageTextfield.text, let messageSender = Auth.auth().currentUser?.email {
            db.collection(K.FStore.collectionName).addDocument(data: [
                K.FStore.senderField : messageSender,
                K.FStore.bodyField : messageBody]) { error in
                    if let e = error {
                        print("There was an issue saving data to Firestore,\(e)")
                    } else {
                        print("Successfully saved data")
                    }
                }
        }
    }
    
    @IBAction func logOutPressed(_ sender: UIBarButtonItem) {
        do {
            try Auth.auth().signOut()
            navigationController?.popToRootViewController(animated: true)
        } catch let signOutError as NSError {
            print("Error signing out: %@", signOutError)
        }
    }
}

extension ChatViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: K.cellIdentifier, for: indexPath)
        as! MessageCell
        cell.label.text = messages[indexPath.row].body
        return cell
<<<<<<< HEAD
    }
=======
        
    }
    
    
>>>>>>> 68dfdd19f4af45055921348f04d85a7217617d4d
}

