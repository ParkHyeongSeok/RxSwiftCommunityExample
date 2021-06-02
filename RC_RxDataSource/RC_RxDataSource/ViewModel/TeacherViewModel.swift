//
//  TeacherViewModel.swift
//  RC_RxDataSource
//
//  Created by 박형석 on 2021/06/02.
//

import Foundation
import RxSwift
import RxDataSources

class TeacherViewModel {
    typealias TeacherSectionModel = RxTableViewSectionedAnimatedDataSource<TeacherSection>
    
    let dataSource : TeacherSectionModel = {
        
        let ds = TeacherSectionModel(configureCell: { dataSource, tableView, indexPath, teacher -> UITableViewCell in
            
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "animatableCell", for: indexPath) as? AnimatableTableViewCell else { return UITableViewCell() }
            
            cell.updateUI(teacher: teacher)
            
            return cell
        })
        
        ds.titleForHeaderInSection = { dataSource, index in
          return dataSource.sectionModels[index].header
        }

//        ds.titleForFooterInSection = { dataSource, index in
//          return dataSource.sectionModels[index].footer
//        }

        ds.canEditRowAtIndexPath = { dataSource, indexPath in
          return true
        }

        ds.canMoveRowAtIndexPath = { dataSource, indexPath in
          return true
        }
        
        return ds
    }()
    
    
    
    
}
