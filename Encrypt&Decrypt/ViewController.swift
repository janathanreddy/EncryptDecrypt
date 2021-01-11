//
//  ViewController.swift
//  Encrypt&Decrypt
//
//  Created by Janarthan Subburaj on 11/01/21.
//

import UIKit
import RNCryptor
class ViewController: UIViewController {
    
    @IBOutlet weak var userName: UITextField!
    @IBOutlet weak var passWord: UITextField!
    let encryptionKEY = "$3N2@C7@pXp"

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    
    func encrypt(plainText : String, password: String) -> String {
        
        let data: Data = plainText.data(using: .utf8)!
        let encryptedData = RNCryptor.encrypt(data: data, withPassword: encryptionKEY)
        let encryptedString : String = encryptedData.base64EncodedString()
        return encryptedString
    }
    
    
    func decrypt(encryptedText : String, password: String) -> String {
        do  {
            let data: Data = Data(base64Encoded: encryptedText)!
            let decryptedData = try RNCryptor.decrypt(data: data, withPassword: password)
            let decryptedString = String(data: decryptedData, encoding: .utf8) 
            return decryptedString ?? ""
        }
        catch {
            return "FAILED"
        }
    }
    
    @IBAction func SignIn(_ sender: Any) {
        let encryptedUsernameText =  self.encrypt(plainText: userName.text!, password: encryptionKEY)
        let encryptedPasswordText =  self.encrypt(plainText: passWord.text!, password: encryptionKEY)
        let decryptedText1 = self.decrypt(encryptedText: encryptedUsernameText, password: encryptionKEY)
        let decryptedText2 = self.decrypt(encryptedText: encryptedPasswordText, password: encryptionKEY)
        print("Encrypted UserName : \(encryptedUsernameText)")
        print("Encrypted Password : \(encryptedPasswordText)")
        print("Original Username : \(decryptedText1)")
        print("Original Password : \(decryptedText2)")
        userName.text = ""
        passWord.text = ""

    }
    
}

