import Foundation

class FDatabaseModelGandallerSocial
{
    var facebook:String?
    var twitter:String?
    var instagram:String?
    var hashtags:[FDatabaseModelGandallerSocialHashtag]
    
    init()
    {
        hashtags = []
    }
}