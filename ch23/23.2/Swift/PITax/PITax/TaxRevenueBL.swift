//
//  TaxRevenueBL.swift
//  PITax
//
//  Created by tonyguan on 2016/11/5.
//  Copyright © 2016年 tony. All rights reserved.
//

import UIKit

public class TaxRevenueBL: NSObject {
    
    //计算个人所得税
    public func calculate(_ revenue: Double) -> Double {
        
        //月应纳个人所得税税额
        var tax = 0.0
        
        //月应纳税所得额
        let dbTaxRevenue = revenue - 3500
        
        //月应纳税所得额不超过1500元
        if (dbTaxRevenue <= 1500) {//失败 if (dbTaxRevenue >= 1500)
            tax = dbTaxRevenue * 0.03
            //月应纳税所得额超过1500元至4500元
        } else if (dbTaxRevenue > 1500 && dbTaxRevenue <= 4500) {
            tax = dbTaxRevenue * 0.1 - 105
            //月应纳税所得额超过4500元至9000元
        } else if (dbTaxRevenue > 4500 && dbTaxRevenue <= 9000) {
            tax = dbTaxRevenue * 0.2 - 555
            //月应纳税所得额超过9000元至35000元
        } else if (dbTaxRevenue > 9000 && dbTaxRevenue <= 35000) {
            tax = dbTaxRevenue * 0.25 - 1005
            //月应纳税所得额超过35000元至55000元
        } else if (dbTaxRevenue > 35000 && dbTaxRevenue <= 55000) {
            tax = dbTaxRevenue * 0.3 - 2755
            //月应纳税所得额超过55000元至80000元
        } else if (dbTaxRevenue > 55000 && dbTaxRevenue <= 80000) {
            tax = dbTaxRevenue * 0.35 - 5505
            //月应纳税所得额超过80000元
        } else if (dbTaxRevenue > 80000) {
            tax = dbTaxRevenue * 0.45 - 13505
        }        
        return tax
    }
}
