//
//  UpperViewController.swift
//  homework2
//
//  Created by Berkay on 8.01.2023.
//

import UIKit

class UpperViewController: UIViewController {

    @IBOutlet weak var upperTableView: UITableView!
    var data : [Datum] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        fetchData()
        upperTableView.delegate = self
        upperTableView.dataSource = self
        upperTableView.separatorStyle = .none
        upperTableView.register(.init(nibName: "UpperOneTableViewCell", bundle: nil), forCellReuseIdentifier: "UpperOneTableViewCell")
    }
    

    func fetchData() {

        if let url = URL(string: "https://api.jikan.moe/v4/genres/anime") {
            var request: URLRequest = .init(url: url)
            request.httpMethod = "GET"

            let task = URLSession.shared.dataTask(with: request as URLRequest) { data, response, error in
                if error != nil {
                    return
                }

                if let data = data {
                    do {
                        let animes = try! JSONDecoder().decode(Genre.self, from: data)
                        let datum = animes.data
                        self.data = datum!
                        DispatchQueue.main.async {
                            self.upperTableView.reloadData()
                        }
                    } catch {
                        print("decoding error")
                    }
                }
            }
            task.resume()
        }
    }
    
    private func activityIndicator(style: UIActivityIndicatorView.Style = .medium,
                                   frame: CGRect? = nil,
                                   center: CGPoint? = nil) -> UIActivityIndicatorView {
  
        let activityIndicatorView = UIActivityIndicatorView(style: style)
  
        if let frame = frame {
            activityIndicatorView.frame = frame
        }
    
        if let center = center {
            activityIndicatorView.center = center
        }
        
        return activityIndicatorView
    }
    
    
    @IBAction func backButtonClicked(_ sender: Any) {
    dismiss(animated: true)
    }
    
}
extension UpperViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UpperOneTableViewCell", for: indexPath) as! UpperOneTableViewCell
        cell.nameLabel?.text = data[indexPath.row].name
        return cell
    }
}

extension UpperViewController: UITableViewDelegate {
    
}
