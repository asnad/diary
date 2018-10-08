class Teacher < User
  default_scope -> { where(user_type: User.user_types['teacher']) }
end
