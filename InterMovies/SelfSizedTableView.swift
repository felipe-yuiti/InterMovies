//
//  SelfSizedTableView.swift
//  InterMovies
//
//  Created by Felipe Yuiti on 22/03/22.
//

import UIKit

class SelfSizedTableView: UITableView {

      var maxHeight: CGFloat = UIScreen.main.bounds.size.height
      
      override func reloadData() {
        super.reloadData()
        self.invalidateIntrinsicContentSize()
        self.layoutIfNeeded()
      }
      
      override var intrinsicContentSize: CGSize {
        let height = min(contentSize.height, maxHeight)
        return CGSize(width: contentSize.width, height: height + 188)
      }
}
