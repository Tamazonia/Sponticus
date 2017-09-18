class EventPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def new?
    return true
  end

  def create?
    user.organizer
  end

  def update?
    record.organizer.user == user
  end

  def deactivate?
    record.organizer.user == user
  end

end
