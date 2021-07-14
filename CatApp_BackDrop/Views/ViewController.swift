//
//  ViewController.swift
//  CatApp_BackDrop
//
//  Created by Decagon on 7/10/21.
//

import UIKit
import RealmSwift

class ViewController: UIViewController {
    var viewModel = ViewModel()
    
    @IBOutlet weak var catTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        catTable.delegate = self
        catTable.dataSource = self
        viewModel.getMethod()
        setupListeners()
    }
    override func viewDidAppear(_ animated: Bool) {
        viewModel.get()
        setupListeners()
    }
}

extension ViewController: UITableViewDataSource , UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.catData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = catTable
                .dequeueReusableCell(withIdentifier: "cell",
                                     for: indexPath) as? TableViewCell else {
            return UITableViewCell()
        }
        cell.delegate = self
        cell.configure(with: viewModel.catData[indexPath.row])
        return cell
    }
}

extension ViewController: TableViewCellDelegate {
    func didTapAddBtn(with item: CatModelF) {
        viewModel.create(item: item)
        self.catTable.reloadData()
    }
    
    func didTapRemoveBtn(with item: CatModelF) {
        viewModel.delete(item: item)
        self.catTable.reloadData()
    }
    
    fileprivate func setupListeners() {
        viewModel.completion = {
            DispatchQueue.main.async {
                self.viewModel.get()
                self.catTable.reloadData()
            }
    }
        viewModel.completions = {
            DispatchQueue.main.async {
                self.catTable.reloadData()
            }
    }
    }
}



