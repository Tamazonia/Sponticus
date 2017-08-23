class TicketPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  def create?
    user.organizer
  end

  def update?
    record.event.organizer.user == user
  end
end
