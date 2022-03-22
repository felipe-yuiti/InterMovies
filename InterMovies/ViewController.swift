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


class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: SelfSizedTableView!
    
    let listaDeFilmes = ["Homem Aranha", "Batmam", "Hulk"]
    var listaDeFilmesFiltradas: [String] = []
    
    let searchController = UISearchController(searchResultsController: nil)
    
    let data = ["acao","aventura","drama","suspense", "terror"]
    var hearder = [HeardOnTable(title: "feijao", subTitle: "roxo"),
                   HeardOnTable(title: "arroz", subTitle: "com feijao"),
                   HeardOnTable(title: "salada", subTitle: "de tomate")]
    var heightOfHearder: CGFloat = 44
    
    private func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        let nib = UINib(nibName: "HeaderView", bundle: nil)
        tableView.register(nib, forHeaderFooterViewReuseIdentifier: "HeaderView")
    }
    
    private func setupSearch() {
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Pesquise seu filme..."
        navigationItem.searchController = searchController
        listaDeFilmesFiltradas = listaDeFilmes
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()               
        setupTableView()
        setupSearch()
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listaDeFilmesFiltradas.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("linha\(indexPath.row),section\(indexPath.section)")
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

extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let collectionCell = collectionView.dequeueReusableCell(withReuseIdentifier: "Detalhes", for: indexPath) as! CollectionViewCell
        return collectionCell
    }
    
    
    
}
