import UIKit

/// A subclass of `UITableViewCell` that displays an address within its content view.
final class AddressCell: UITableViewCell {
  
  let street1Label, street2Label, cityLabel, regionLabel, zipLabel: UILabel
  
  private var addressValue: Address?
  var address: Address? {
    get {
      return self.addressValue
    }
    set {
      self.addressValue = newValue
      self.street1Label.text = newValue?.street1
      self.street2Label.text = newValue?.street2
      self.cityLabel.text = newValue?.city
      if let region = newValue?.region {
        self.regionLabel.text = ", \(region) "
      }
      self.zipLabel.text = newValue?.zip
    }
  }
  
  override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
    self.street1Label = UILabel()
    self.street2Label = UILabel()
    self.cityLabel = UILabel()
    self.regionLabel = UILabel()
    self.zipLabel = UILabel()
    
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    
    self.contentView.addSubview(self.street1Label)
    self.street1Label.autoPinEdgesToSuperviewMarginsExcludingEdge(.Bottom)
    
    self.contentView.addSubview(self.street2Label)
    self.street2Label.autoPinEdgeToSuperviewMargin(.Left)
    self.street2Label.autoPinEdgeToSuperviewMargin(.Right)
    self.street2Label.autoPinEdge(.Top, toEdge: .Bottom, ofView: self.street1Label)
    
    self.contentView.addSubview(self.cityLabel)
    self.contentView.addSubview(self.regionLabel)
    self.contentView.addSubview(self.zipLabel)

    self.cityLabel.autoPinEdgeToSuperviewMargin(.Left)
    self.cityLabel.autoPinEdge(.Top, toEdge: .Bottom, ofView: self.street2Label)
    self.cityLabel.autoPinEdge(.Right, toEdge: .Left, ofView: self.regionLabel)
    self.cityLabel.autoPinEdgeToSuperviewMargin(.Bottom)
    
    self.regionLabel.autoPinEdge(.Top, toEdge: .Bottom, ofView: self.street2Label)
    self.regionLabel.autoPinEdgeToSuperviewMargin(.Bottom)
    
    self.zipLabel.autoPinEdge(.Left, toEdge: .Right, ofView: self.regionLabel)
    self.zipLabel.autoPinEdge(.Top, toEdge: .Bottom, ofView: self.street2Label)
    self.zipLabel.autoPinEdgeToSuperviewMargin(.Bottom)
  }
  
  @available(*, unavailable)
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
