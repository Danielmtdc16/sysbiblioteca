module UsersHelper
    def listUsersAll
        @users = User.order(:nome)
    end
end
