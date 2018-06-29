class Coordinator < User
  default_scope -> { where(user_type: User.user_types['coordinator']) }
end
