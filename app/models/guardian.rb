class Guardian < User
  default_scope -> { where(user_type: User.user_types['guardian']) }
end
