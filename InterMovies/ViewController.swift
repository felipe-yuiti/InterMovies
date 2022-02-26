//
//  ViewController.swift
//  InterMovies
//
//  Created by Felipe Yuiti on 11/02/22.
//

import UIKit

struct HeardOnTable{
    var title: String
    var subTitle: String
}

class SelfSizedTableView: UITableView {
    var maxHeight: CGFloat = UIScreen.main.bounds.size.height
    
    override func reloadData() {
        super.reloadData()
        self.invalidateIntrinsicContentSize()
        self.layoutIfNeeded()
    }
    
    override var intrinsicContentSize: CGSize {
        let height = min(contentSize.height, maxHeight)
        return CGSize(width: contentSize.width, height: height)
    }
}

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: SelfSizedTableView!
    
    let listaDeFilmes = ["Homem Aranha", "Batmam", "Hulk"]
    var listaDeFilmesFiltradas: [String] = []
    
    let searchController = UISearchController(searchResultsController: nil)
    
    let data = ["acao","aventura","drama","suspense", "terror"]
    var hearder = [HeardOnTable(title: "feijao", subTitle: "lulu"),
                   HeardOnTable(title: "arroz", subTitle: "lulu"),
                   HeardOnTable(title: "salada", subTitle: "lulu")]
    var heightOfHearder: CGFloat = 44
    
    override var prefersStatusBarHidden: Bool {
        return false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.setToolbarHidden(true, animated: true)
        
        // tableView Setup
        tableView.dataSource = self
        tableView.delegate = self
        let nib = UINib(nibName: "HeaderView", bundle: nil)
        tableView.register(nib, forHeaderFooterViewReuseIdentifier: "HeaderView")
        
        // serachBar Setup
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Pesquise seu filme..."
        navigationItem.searchController = searchController
        listaDeFilmesFiltradas = listaDeFilmes
        
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listaDeFilmesFiltradas.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return hearder.count
    }
    
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let hearderView = tableView.dequeueReusableHeaderFooterView(withIdentifier: "HeaderView") as! HearderViewTableViewCell
        hearderView.leftHearderLabel.text = hearder[section].title
        hearderView.rightHearderLabel.text = hearder[section].subTitle
        
        return hearderView
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Continuarassistindo", for: indexPath) as! MovieCell
        cell.movieLabel.text = listaDeFilmesFiltradas[indexPath.row]
        cell.timeLabel.text = "Tempo restante"
        return cell
    }
}

extension ViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        if let filtro = searchController.searchBar.text, filtro.count > 0 {
            listaDeFilmesFiltradas = listaDeFilmesFiltradas.filter { filme in
                return filme.uppercased().contains(filtro.uppercased())
            }
        } else {
            listaDeFilmesFiltradas = listaDeFilmes
        }
        
        tableView.reloadData()
    }
}
