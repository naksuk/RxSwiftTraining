//
//  ViewController.swift
//  RxSwiftTraining
//
//  Created by naksuk on 2021/12/04.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var button: UIButton!
    
    private let count: BehaviorRelay<Int> = BehaviorRelay(value: 0)
    private let disposedBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupBidings()
    }
    
    private func setupBidings() {
        
        button.rx.tap
            .subscribe (onNext: { [ weak self] _ in
                self?.increment()
            })
            .disposed(by: disposedBag)
        
        count.asObservable()
             .subscribe(onNext: { [weak self] count in
                 self?.label.text = String(count) })
             .disposed(by: disposedBag)
        
    }
    
    private func increment() {
        count.accept(count.value + 1)
    }
    
}

