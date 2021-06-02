//
//  StudentViewModel.swift
//  RC_RxDataSource
//
//  Created by 박형석 on 2021/06/02.
//

import Foundation
import RxSwift
import RxDataSources

class StudentViewModel {
    
    
    
    let dataSource: RxTableViewSectionedReloadDataSource<StudentSection> = {
        
        let ds = RxTableViewSectionedReloadDataSource<StudentSection>(configureCell: { (dataSource, tableView, indexPath, student) -> UITableViewCell in
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "basicCell", for: indexPath)
            
            cell.textLabel?.text = student.name
           
            cell.detailTextLabel?.text = "\(student.age)"
           
            return cell
        })
        return ds
    }()
    
    
    
}
