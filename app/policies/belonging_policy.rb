class BelongingPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      scope.all
    end
  end

  def show?
    if user.landlord?
      record.flat.user = user # landlords can only see their belongings
    elsif user.tenant?
      # Tenants can only see belongings of flats where they are added
      # record.flat.tenants.any? { |tenant| tenant.user == user }

      # tenants cannot go to belongings show page
      false
    end
  end

  def create?
    user.landlord?
  end

  def edit?
    create?
  end

  def update?
    record.flat.user == user
  end

  def destroy?
    record.flat.user == user
  end
end
