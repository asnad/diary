class Manager < User
  default_scope -> { where(user_type: User.user_types['manager']) }
end
