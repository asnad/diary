class Administrator < User
  default_scope -> { where(user_type: User.user_types['administrator']) }
end
