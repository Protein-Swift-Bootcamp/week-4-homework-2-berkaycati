//
//  LowerViewController.swift
//  homework2
//
//  Created by Berkay on 8.01.2023.
//

import UIKit

class LowerViewController: UIViewController {

    var dataa : [Datum] = []
    
    @IBOutlet weak var lowerTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        fetchData()
        lowerTableView.delegate = self
        lowerTableView.dataSource = self
        lowerTableView.separatorStyle = .none
        lowerTableView.register(.init(nibName: "LowerOneTableViewCell", bundle: nil), forCellReuseIdentifier: "LowerOneTableViewCell")
    }
    
    func fetchData() {

        if let url = URL(string: "https://api.jikan.moe/v4/top/characters") {
            var request: URLRequest = .init(url: url)
            request.httpMethod = "GET"

            let task = URLSession.shared.dataTask(with: request as URLRequest) { data, response, error in
                if error != nil {
                    return
                }

                if let data = data {
                    do {
                        let characters = try! JSONDecoder().decode(Genre.self, from: data)
                        let datumm = characters.data
                        self.dataa = datumm!
                        DispatchQueue.main.async {
                            self.lowerTableView.reloadData()
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

extension LowerViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataa.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LowerOneTableViewCell", for: indexPath) as! LowerOneTableViewCell
        cell.nameLabelSecond.text = dataa[indexPath.row].name
        return cell
    }
}

extension LowerViewController: UITableViewDelegate {
    
}
