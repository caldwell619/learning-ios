import UIKit

class Pet: NSObject {
    
    var thumbnailImageName: String?
    var avatarImageName: String?
    var nameOfPet: String?
    var typeOfPet: String?
    
    init(thumbnailImageName: String?, avatarImageName: String?, nameOfPet: String?, typeOfPet: String?) {
        self.thumbnailImageName = thumbnailImageName
        self.avatarImageName = avatarImageName
        self.nameOfPet = nameOfPet
        self.typeOfPet = typeOfPet
    }
}
