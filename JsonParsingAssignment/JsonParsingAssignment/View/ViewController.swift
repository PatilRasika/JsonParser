//
//  ViewController.swift
//  JsonParsingAssignment

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet var tableView: UITableView!
    var articleViewModel = ArticleViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
        tableView.tableFooterView = UIView()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
    //Load data
    func loadData() {
        self.articleViewModel.downloadJson { (dataArray, error) in
        DispatchQueue.main.async {
            self.tableView.reloadData()
            return
        }
            if error != nil {
                self.showAlert()
            }
        }
    }
    
    //MARK: TableViewMethods
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articleViewModel.serverData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "DataCell") as? DataCell else { return UITableViewCell() }
        cell.title.text = articleViewModel.serverData[indexPath.row].title
        cell.descriptionLbl.text = articleViewModel.serverData[indexPath.row].description
        let imgurl = articleViewModel.serverData[indexPath.row].urlToImage
        // retrieves image if already available in cache
        if let imageFromCache = articleViewModel.imageCache.object(forKey: imgurl as AnyObject) as? UIImage {
            cell.imgView.image = imageFromCache
        } else {
            if let imageURL = URL(string: imgurl ?? "") {
                DispatchQueue.global().async {
                    let data = try? Data(contentsOf: imageURL)
                    if let data = data {
                        let image = UIImage(data: data)
                        DispatchQueue.main.async() {
                            cell.imgView.image = image
                        }
                    }
                }
            }
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedArticleDetail = articleViewModel.serverData[indexPath.row]
        if let webUrl = URL(string: selectedArticleDetail.url ?? "") {
            if UIApplication.shared.canOpenURL(webUrl) {
                UIApplication.shared.open(webUrl, options: [:], completionHandler: { _ in
                })
            }
        } else
        {
            self.showAlert()
        }
    }
}

