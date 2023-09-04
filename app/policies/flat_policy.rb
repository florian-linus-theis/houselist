# frozen_string_literal: true

class FlatPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      if user.landlord?
        scope.where(user:) # landlords can only see their flats
      elsif user.tenant?
        # Tenants can see the flats where they are added (must join tables here)
        scope.includes(:tenants).where(tenants: { user: })
      end
    end
  end

  def show?
    if user.landlord?
      record.user == user
    elsif user.tenant?
      !record.tenants.find_by(tenants: { user: }).nil?
    end
  end

  def new?
    # Only a landlord can create a flat
    user.landlord?
  end

  def create?
    # Only a landlord can create a flat
    user.landlord?
  end

  def update?
    # Only the owner of the flat can update and edit the flat
    record.user == user
  end

  def destroy?
    # Only the owner of a flat can delete the flat
    record.user == user
  end

  def find_tenant?
    true
  end
end
