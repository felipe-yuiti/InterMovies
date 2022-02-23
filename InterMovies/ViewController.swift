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
    
    @IBOutlet weak var tableView: UITableView!
    
    let data = ["acao","aventura","drama","suspense", "terror"]
    var hearder = [HeardOnTable(title: "feijao", subTitle: "lulu"),
                   HeardOnTable(title: "arroz", subTitle: "lulu"),
                   HeardOnTable(title: "salada", subTitle: "lulu")]
    var heightOfHearder: CGFloat = 44
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        
//        hearder = [HeardOnTable.init(title: "Continuar assistindo", subTitle: "Ver todos")]
        
    }
}

extension ViewController: UITableViewDataSource {
//        func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//            return hearder[section].title
//        }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return hearder.count
    }
    
    private func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat{
        return heightOfHearder
    }
    private func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView?{
        let hearderView = Bundle.main.loadNibNamed("HearderViewTableViewCell", owner: self, options: nil)?.first as! HearderViewTableViewCell

        hearderView.leftHearderLabel.text = hearder[section].title
        hearderView.rightHearderLabel.text = hearder[section].subTitle

        return hearderView
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Continuarassistindo", for: indexPath) as! MovieCell
        cell.movieLabel.text = "Após a captura de Merry e Pippy pelos orcs, a Sociedade do Anel é dissolvida. Frodo e Sam seguem sua jornada rumo à Montanha da Perdição para destruir o anel e descobrem que estão sendo perseguidos pelo misterioso Gollum. Enquanto isso, Aragorn, o elfo e arqueiro Legolas e o anão Gimli partem para resgatar os hobbits sequestrados e chegam ao reino de Rohan, onde o rei Theoden foi vítima de uma maldição mortal de Saruman."
        cell.timeLabel.text = "AAAAAArooo"
        return cell
    }

}
