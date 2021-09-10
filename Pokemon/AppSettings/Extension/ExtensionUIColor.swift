
//  ExtensionUIColor.swift
//  Biometria
//
//  Created by Felipe Glautier  on 21/05/21.


import Foundation
import UIKit
extension UIColor {
    
    /* colorPrimary */
    static var colorPrimaryLighten: UIColor { return UIColor(hex: "#f3f9ed") }
    static var colorPrimaryLightDesaturate: UIColor { return UIColor(hex: "#afca98") }
    static var colorPrimaryPressed: UIColor { return UIColor(hex: "#70aa3e") }
    static var colorPrimaryDarken: UIColor { return UIColor(hex: "#54862a") }
    static var colorCheckmarkImage: UIColor { return UIColor(hex: "#639d31") }
    static var colorWebViewHB: UIColor { return UIColor(hex: "#777777") }
    static var colorBackgroundWhite: UIColor { return UIColor(hex: "#F7F8FA") }
    
    /* colorSecondary */
    static var colorSecondaryLighten: UIColor { return UIColor(hex: "#fff2e6") }
    static var colorSecondaryDarken: UIColor { return UIColor(hex: "#e17200") }
    
    /* colorFinancial */
    static var colorFinancialLighten: UIColor { return UIColor(hex: "#f7f8ea") }
    static var colorFinancialDarken: UIColor { return UIColor(hex: "#aaba39") }
    
    /* colorBond */
    static var colorBondLighten: UIColor { return UIColor(hex: "#edeff9") }
    static var colorBondDarken: UIColor { return UIColor(hex: "#3e51b3") }
    
    /* colorFund */
    static var colorFundLighten: UIColor { return UIColor(hex: "#e6fcfc") }
    static var colorFundDarken: UIColor { return UIColor(hex: "#0f8a8d") }
    
    /* colorPrivatePension */
    static var colorPrivatePensionLighten: UIColor { return UIColor(hex: "#e2e3f4") }
    static var colorPrivatePensionDarken: UIColor { return UIColor(hex: "#282f6c") }
    
    // Other colors
    
    /* erro */
    static var colorError: UIColor { return UIColor(hex: "#ff002a") }
    static var colorErrorLighten: UIColor { return UIColor(hex: "#fff0f2") }
    static var colorErrorDarken: UIColor { return UIColor(hex: "#eb0027") }
    
    /* success */
    static var colorSuccessLighten: UIColor { return UIColor(hex: "#def0ce") }
    static var colorSuccessDarken: UIColor { return UIColor(hex: "#598d2c") }
    
    /* gray */
    /** hex: 424242 */
    static var colorGrayPrimary: UIColor { return UIColor(hex: "#424242") }
    /** hex: ededed */
    static var colorGrayDefaultBackground: UIColor { return UIColor(hex: "#ededed") }
    /** hex: 9b9b9b */
    static var colorGrayLighten35: UIColor { return UIColor(hex: "#9b9b9b") }
    /** hex: bababa */
    static var colorGrayLighten47: UIColor { return UIColor(hex: "#bababa") }
    /** hex: dbdbdb */
    static var colorGrayLighten60: UIColor { return UIColor(hex: "#dbdbdb") }
    /** hex: efefef */
    static var colorGrayLighten68: UIColor { return UIColor(hex: "#efefef") }
    /** hex: fcfcfcf | rgb: 252*/
    static var colorGrayLighten70: UIColor { return UIColor(hex: "#fcfcfc") }
    static var colorGrayLighten80: UIColor { return UIColor(hex: "#9B9B9B") }
    static var colorGrayLighten90: UIColor { return UIColor(hex: "#fafafa") }
    
    /* further colors */
    static var colorFacebook: UIColor { return UIColor(hex: "#3a589a") }
    static var colorFacebookClicked: UIColor { return UIColor(hex: "#3f60ab") }
    static var colorLinkedIn: UIColor { return UIColor(hex: "#0073b5") }
    static var colorLinkedInClicked: UIColor { return UIColor(hex: "#208cca") }
    
    static var transparent: UIColor { return UIColor(hex: "#00ffffff") }
    static var simpletooltip_background: UIColor { return .colorGrayPrimary }
    
    static var simpletooltip_text: UIColor { return .white }
    static var simpletooltip_arrow: UIColor { return .colorGrayPrimary }
    
    static var colorAlertAttention: UIColor { return UIColor(hex: "#f57c00") }
    static var colorAlertAttentionAlpha: UIColor { return UIColor(hex: "#fff2e6") }
    static var colorAlert: UIColor { return UIColor(hex: "#C19B0E") }
    
    static var colorStatementCredit: UIColor { return UIColor(hex: "#639d31") }
    static var colorStatementDebit: UIColor { return UIColor(hex: "#ff002a") }
    static var BannerB2BBackground: UIColor { return UIColor(hex: "#e3e3e3") }
    
    // Fund Balance Colors
    static var colorBalanceManager: [UIColor] = {
        let colors = [UIColor(hex: "#F27800"),
                      UIColor(hex: "#2E7CC7"),
                      UIColor(hex: "#279B3D"),
                      UIColor(hex: "#7531B6"),
                      UIColor(hex: "#B0B0B0")]
        return colors
    }()
    
    // Fund Strategy Colors
    static var colorBalanceStrategy: [UIColor] = {
        let colors = [UIColor(hex: "#4C5FBE"),
                      UIColor(hex: "#0DB292"),
                      UIColor(hex: "#EFBF15")]
        return colors
    }()
    
    // Domestic Bond Balance Colors
    static var colorDomesticBondBalanceIndexer: [UIColor] = {
        let colors = [UIColor(hex: "#00C2A7"),
                      UIColor(hex: "#F3CC00"),
                      UIColor(hex: "#40B3CF"),
                      UIColor(hex: "#F79000"),
                      UIColor(hex: "#754DB8")]
        return colors
    }()
    
    // Domestic Bond Balance Colors Cupons
    static var colorDomesticBondBalanceCupons: [UIColor] = {
        let colors = [UIColor(hex: "#F79000"),
                      UIColor(hex: "#754DB8"),
                      UIColor(hex: "#40B3CF"),
                      UIColor(hex: "#F79000"),
                      UIColor(hex: "#754DB8")]
        return colors
    }()
    
    
    // Helper functions
    
    func toHexString() -> String {
        var r:CGFloat = 0
        var g:CGFloat = 0
        var b:CGFloat = 0
        var a:CGFloat = 0
        
        getRed(&r, green: &g, blue: &b, alpha: &a)
        
        let rgb:Int = (Int)(r*255)<<16 | (Int)(g*255)<<8 | (Int)(b*255)<<0
        
        return String(format:"#%06x", rgb)
    }
    
    convenience init(hex: String) {
        
        let _hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int = UInt32()
        Scanner(string: _hex).scanHexInt32(&int)
        let a, r, g, b: UInt32
        switch _hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (255, 0, 0, 0)
        }
        self.init(red: CGFloat(r) / 255, green: CGFloat(g) / 255, blue: CGFloat(b) / 255, alpha: CGFloat(a) / 255)
    }
    
    func lighten2(byPercentage: CGFloat) -> UIColor?
    {
        var h = CGFloat(0)
        var s = CGFloat(0)
        var b = CGFloat(0)
        var a = CGFloat(0)
        
        if self.getHue(&h, saturation: &s, brightness: &b, alpha: &a)
        {
            if byPercentage > 0
            {
                b = min(b + byPercentage, 1.0)
            }
            
            return UIColor(hue: h, saturation: s, brightness: b, alpha: a)
        }
        
        
        return nil
    }
    
    func colorWithAlpha(byPercentage: CGFloat) -> UIColor?
    {
        var h = CGFloat(0)
        var s = CGFloat(0)
        var b = CGFloat(0)
        var a = CGFloat(0)
        
        if self.getHue(&h, saturation: &s, brightness: &b, alpha: &a)
        {
            if byPercentage > 0
            {
                a = min(byPercentage, 1.0)
            }
            
            return UIColor(hue: h, saturation: s, brightness: b, alpha: a)
        }
        
        return nil
    }
    
    func cColor(_ hex:String) -> UIColor {
        var cString:String = hex.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines as CharacterSet).uppercased()
        
        if (cString.hasPrefix("#")) {
            cString = cString.substring(from: cString.index(cString.startIndex, offsetBy: 1))
        }
        
        if ((cString.count) != 6) {
            return UIColor.gray
        }
        
        var rgbValue:UInt32 = 0
        Scanner(string: cString).scanHexInt32(&rgbValue)
        
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
    
    /**
     Create a darker color
     */
    func darker(by percentage: CGFloat = 30.0) -> UIColor {
        return self.adjustBrightness(by: -abs(percentage))
    }
    
    /**
     Try to increase brightness or decrease saturation
     */
    func adjustBrightness(by percentage: CGFloat = 30.0) -> UIColor {
        var h: CGFloat = 0, s: CGFloat = 0, b: CGFloat = 0, a: CGFloat = 0
        if self.getHue(&h, saturation: &s, brightness: &b, alpha: &a) {
            if b < 1.0 {
                let newB: CGFloat = max(min(b + (percentage/100.0)*b, 1.0), 0,0)
                return UIColor(hue: h, saturation: s, brightness: newB, alpha: a)
            } else {
                let newS: CGFloat = min(max(s - (percentage/100.0)*s, 0.0), 1.0)
                return UIColor(hue: h, saturation: newS, brightness: b, alpha: a)
            }
        }
        return self
    }
    
}
