class OrderPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  def show?
    record.user == user
  end

  def new?
    return true
  end

  def create?
    return true
  end

  def update?
    return true
  end

end
