import Vapor

final class UserController {
    
    func list(_ req: Request) throws -> Future<[User]> {
        return User.query(on: req).all()
    }
    
    func create(_ req: Request) throws -> Future<User> {
        return try req.content.decode(User.self).flatMap { user in
            return user.save(on: req)
        }
    }
}
