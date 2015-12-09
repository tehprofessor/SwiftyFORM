//
//  ButtonCell.swift
//  SwiftyFORM
//
//  Created by Simon Strandgaard on 08/11/14.
//  Copyright (c) 2014 Simon Strandgaard. All rights reserved.
//

import UIKit

public struct ButtonCellModel {
	var title: String = ""
  var subtitle: String = ""
  var textAlignment: NSTextAlignment = NSTextAlignment.Left
  var detailAlignment: NSTextAlignment = NSTextAlignment.Right
  var styleBlock: ((ButtonCell) -> Void)? = nil
	var action: Void -> Void = {
		DLog("action")
	}

}

public class ButtonCell: UITableViewCell, SelectRowDelegate {
	public let model: ButtonCellModel
	
	public init(model: ButtonCellModel) {
		self.model = model
		super.init(style: UITableViewCellStyle.Default, reuseIdentifier: nil)
		loadWithModel(model)
	}
	
	public required init(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	public func loadWithModel(model: ButtonCellModel) {
		textLabel?.text = model.title
		textLabel?.textAlignment = model.textAlignment
    detailTextLabel?.text = model.subtitle
    detailTextLabel?.textAlignment = model.detailAlignment
    // Apply styles
    model.styleBlock?(self)
	}

	public func form_didSelectRow(indexPath: NSIndexPath, tableView: UITableView) {
		// hide keyboard when the user taps this kind of row
		tableView.form_firstResponder()?.resignFirstResponder()
		
		model.action()
		
		tableView.deselectRowAtIndexPath(indexPath, animated: true)
	}
	
}
