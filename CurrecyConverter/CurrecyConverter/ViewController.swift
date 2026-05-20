//
//  ViewController.swift
//  CurrecyConverter
//
//  Created by Deniz Yuca on 1.09.2025.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var cadLabel: UILabel!
    @IBOutlet weak var chfLabel: UILabel!
    @IBOutlet weak var gbpLabel: UILabel!
    @IBOutlet weak var jpyLabel: UILabel!
    @IBOutlet weak var tryLabel: UILabel!
    @IBOutlet weak var usdLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func getRatesClicked(_ sender: Any) {
        
        // 1) Request & Session "web adresine gitme isteği"
        // 2) Response & Data "data almak"
        // 3) Parsing & JSON Serialization "datayı işlemek"
        
        // 1.
        let url = URL(string: "https://data.fixer.io/api/latest?access_key=66bec679b3edbd58ab2bc0ffc0c3d389")
        // Fixer.io API'sinden döviz kurlarını çekmek için URL oluşturuyoruz
        let session = URLSession.shared // URLSession: HTTP istekleri yapmak için kullanılan sınıf
        // Closure
        let task = session.dataTask(with: url!) { (data, response, error) in  // dataTask: Arka planda veri indirme görevi oluşturur
            // HATA KONTROLÜ
            if error != nil {
                let alert = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: UIAlertController.Style.alert)
                let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
                alert.addAction(okButton)
                self.present(alert, animated: true , completion: nil)
            } else {
                // 2. VERİ KONTROLÜ
               if data != nil {
                    do {
                        let jsonResponse = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as! Dictionary<String, Any>
                        // JSONSerialization: JSON string'ini Swift objesine çevirir
                            // ASYNC
                        DispatchQueue.main.async { // ANA THREAD'E GEÇİŞ (UI GÜNCELLEMESİ İÇİN)
                            if let rates = jsonResponse["rates"] as? [String : Any] {
                               // print(rates)
                                if let cad = rates["CAD"] as? Double { /* rates sözlüğünden "CAD" değerini Double olarak almayı dene */
                                    self.cadLabel.text = "CAD : \(cad)"
                                }
                                if let chf = rates["CHF"] as? Double {
                                    self.chfLabel.text = "CHF : \(chf)"
                                }
                                if let gbp = rates["GBP"] as? Double {
                                    self.gbpLabel.text = "GBP : \(gbp)"
                                }
                                if let jpy = rates["JPY"] as? Double {
                                    self.jpyLabel.text = "JPY : \(jpy)"
                                }
                                if let try1 = rates["TRY"] as? Double {
                                    self.tryLabel.text = "TRY : \(try1)"
                                }
                                if let usd = rates["USD"] as? Double {
                                    self.usdLabel.text = "USD : \(usd)"
                                }
                            }
                        }
                    } catch {
                        print("error")
                    }
                }
            }
        }; task.resume() // Görevi başlatıyoruz - bu satır olmazsa istek gönderilmez!
    }
    
}
/*1. Kullanıcı "Get Rates" butonuna tıklar
        ↓
2. getRatesClicked() fonksiyonu çalışır
        ↓
3. Fixer.io API'sine internet isteği gönderilir
        ↓
4. Sunucu JSON formatında döviz kurlarını gönderir
        ↓
5. JSON verisi Swift Dictionary'ye çevrilir
        ↓
6. Her para biriminin değeri çıkarılır
        ↓
7. Label'lar güncellenir (ekranda görünür) */
