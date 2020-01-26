
import Foundation
import UIKit

extension BenchmarkViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        viewModel.didSelectTimer(row: indexPath.row)
        //updateTimerBehavior.didSelectTimer(indexPath, timers[indexPath.row])
        //updateCell(indexPath)
    }
    
}
