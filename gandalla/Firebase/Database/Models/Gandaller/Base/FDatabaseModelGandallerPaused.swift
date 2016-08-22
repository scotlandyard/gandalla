import Foundation

class FDatabaseModelGandallerPaused:FDatabaseModelGandaller
{
    init()
    {
        let status:FDatabaseModelGandallerStatus = FDatabaseModelGandallerStatus.Paused
        super.init(status:status)
    }
}