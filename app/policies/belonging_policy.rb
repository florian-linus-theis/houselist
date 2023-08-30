class BelongingPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      scope.all
    end
  end

  def show?
    true
  end

  def create?
    user.landlord?
  end

  def edit?
    create?
  end

  def destroy?
    record.user == user
  end
end
