////
////  DrawingsViewController.swift
////  RSTask8Final
////
////  Created by Gleb Tregubov on 19.07.2021.
////
//
//import UIKit
//
//class DrawingsViewController: UIViewController {
//
//    @objc var drawinView:DrawingView = DrawingView()
//
//    @objc var planetButton: DrawingButton = DrawingButton.init(frame: CGRect.init(x: 88.0, y: 114.0, width: 200.0, height: 40.0), title: "Planet", andPictureTypeEnum: .planet)
//
//     @objc var headButton = DrawingButton.init(frame: CGRect.init(x: 88.0, y: 169.0, width: 200.0, height: 40.0), title: "Head", andPictureTypeEnum: .head)
//
//     @objc var treeButton = DrawingButton.init(frame: CGRect.init(x: 88.0, y: 224.0, width: 200.0, height: 40.0), title: "Tree", andPictureTypeEnum: .tree)
//
//     @objc var landscapeButton = DrawingButton.init(frame: CGRect.init(x: 88.0, y: 279.0, width: 200.0, height: 40.0), title: "Landscape", andPictureTypeEnum: .landscape)
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        self.view.backgroundColor = UIColor.white
//        self.view.tintColor = UIColor(named: "Light Green Sea")
//
//        self.configuringDrawingButtons()
//    }
//
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//        self.setupNavigationItems()
//    }
//
//    func setupNavigationItems() {
//        self.navigationItem.title = "Drawings"
//    }
//
//    func configuringDrawingButtons() {
//
////        self.planetButton.delegate = self
////        self.headButton.delegate = self
////        self.treeButton.delegate = self
////        self.landscapeButton.delegate = self
//
//        self.view.addSubview(planetButton)
//        self.view.addSubview(headButton)
//        self.view.addSubview(treeButton)
//        self.view.addSubview(landscapeButton)
//    }
//    
//    func drawingButtonTapped(sender: DrawingButton) {
//        self.drawinView.pictureType = sender.pictureType.rawValue
//        self.navigationController?.popViewController(animated: true)
//    }
//
//
//    /*
//    // MARK: - Navigation
//
//    // In a storyboard-based application, you will often want to do a little preparation before navigation
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        // Get the new view controller using segue.destination.
//        // Pass the selected object to the new view controller.
//    }
//    */
//
//}
