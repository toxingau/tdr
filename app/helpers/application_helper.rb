module ApplicationHelper
  def current_user_activity_owner? a
    current_user.id == a.owner.id
  end
end
