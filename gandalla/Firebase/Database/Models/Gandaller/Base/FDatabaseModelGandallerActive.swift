import Foundation

class FDatabaseModelGandallerActive:FDatabaseModelGandaller
{
    init()
    {
        let status:FDatabaseModelGandallerStatus = FDatabaseModelGandallerStatus.Active
        super.init(status:status)
    }
}