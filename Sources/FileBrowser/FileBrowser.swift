//
//  FileBrowser.swift
//  FileBrowser
//
//  Created by Roy Marmelstein on 14/02/2016.
//  Copyright © 2016 Roy Marmelstein. All rights reserved.
//

import UIKit

/// File browser containing navigation controller.
open class FileBrowser: UINavigationController {
    
    let parser = FileParser.sharedInstance
    
    var fileList: FileListViewController?

    /// File types to exclude from the file browser.
    open var excludesFileExtensions: [String]? {
        didSet {
            parser.excludesFileExtensions = excludesFileExtensions
        }
    }
    
    open var fileExtensions: [String]? {
        didSet {
            parser.fileExtensions = fileExtensions
        }
    }
    
    /// File paths to exclude from the file browser.
    open var excludesFilepaths: [URL]? {
        didSet {
            parser.excludesFilepaths = excludesFilepaths
        }
    }
    
    open var isDisplayDirectory = true {
        didSet {
            parser.isDisplayDirectory = isDisplayDirectory
        }
    }
    
    open var isDisplaySearchBar = false {
        didSet {
            fileList?.isDisplaySearchBar = isDisplayDirectory
        }
    }
    
    /// Override default preview and actionsheet behaviour in favour of custom file handling.
    open var didSelectFile: ((FBFile) -> ())? {
        didSet {
            fileList?.didSelectFile = didSelectFile
        }
    }
    
    /// Closure to be executed when close button is tapped
    open var didClose: (() -> ())? {
        didSet {
            fileList?.didClose = didClose
        }
    }

    public convenience init() {
        let parser = FileParser.sharedInstance
        let path = parser.documentsURL()
        self.init(initialPath: path, allowEditing: true)
    }

    /// Initialise file browser.
    ///
    /// - Parameters:
    ///   - initialPath: NSURL filepath to containing directory.
    ///   - allowEditing: Whether to allow editing.
    ///   - showCancelButton: Whether to show the cancel button.
    ///   - showSize: Whether to show size for files and directories.
    @objc public convenience init(initialPath: URL? = nil,
                                  allowEditing: Bool = false,
                                  showCancelButton: Bool = true,
                                  showSize: Bool = true) {
        
        let validInitialPath = initialPath ?? FileParser.sharedInstance.documentsURL()
        
        let fileListViewController = FileListViewController(initialPath: validInitialPath,
                                                            showCancelButton: showCancelButton,
                                                            allowEditing: allowEditing,
                                                            showSize: showSize)

        self.init(rootViewController: fileListViewController)
        self.view.backgroundColor = UIColor.fileBrowserBackground()
        self.fileList = fileListViewController
    }
}
