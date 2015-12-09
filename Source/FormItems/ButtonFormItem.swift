//
//  ButtonFormItem.swift
//  SwiftyFORM
//
//  Created by Simon Strandgaard on 20-06-15.
//  Copyright © 2015 Simon Strandgaard. All rights reserved.
//

import Foundation

public class ButtonFormItem: FormItem {
	override func accept(visitor: FormItemVisitor) {
		visitor.visitButton(self)
	}
	
	public var title: String = ""
  public var subtitle: String = ""
  public func title(title: String, subtitle: String = "") -> Self {
		self.title = title
    self.subtitle = subtitle
		return self
	}

  public var textAlignment: NSTextAlignment = NSTextAlignment.Left
  public var detailAlignment: NSTextAlignment = NSTextAlignment.Right
  public var styleBlock: ((ButtonCell) -> Void)? = nil
	public var action: Void -> Void = {}
}
