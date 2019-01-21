//
//  ViewController.swift
//  PDFReader
//
//  Created by MAC on 21/1/19.
//  Copyright © 2019 cagdaseksi. All rights reserved.
//

import UIKit
import PDFKit

class ViewController: UIViewController {

    @IBOutlet weak var pdfView: PDFView!
    
    @IBOutlet weak var imgThumbnail1: UIImageView!
    @IBOutlet weak var imgThumbnail2: UIImageView!
    @IBOutlet weak var imgThumbnail3: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        if let path = Bundle.main.path(forResource: "sample", ofType: "pdf") {// read resource name: pdf.pdf
            let url = URL(fileURLWithPath: path)
            if let pdfDocument = PDFDocument(url:url) {
                pdfView.autoScales = true
                pdfView.displayMode = .singlePageContinuous
                pdfView.displayDirection = .vertical
                pdfView.document = pdfDocument
                
                captureThumbnail(pdfDocument: pdfDocument)
            }
        }
        
    }
    
    func captureThumbnail(pdfDocument: PDFDocument) {
        if let page1 = pdfDocument.page(at:1) {
            imgThumbnail1.contentMode = .scaleAspectFit
            imgThumbnail1.image = page1.thumbnail(of: CGSize(width: imgThumbnail1.frame.size.width, height:imgThumbnail1.frame.size.height), for: .artBox)
        }
        if let page2 = pdfDocument.page(at:1) {
            imgThumbnail2.contentMode = .scaleAspectFit
            imgThumbnail2.image = page2.thumbnail(of: CGSize(width: imgThumbnail2.frame.size.width, height:imgThumbnail2.frame.size.height), for: .artBox)
        }
        if let page3 = pdfDocument.page(at:1) {
            imgThumbnail3.contentMode = .scaleAspectFit
            imgThumbnail3.image = page3.thumbnail(of: CGSize(width: imgThumbnail3.frame.size.width, height:imgThumbnail3.frame.size.height), for: .artBox)
        }
    }


}

