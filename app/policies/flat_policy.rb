class FlatPolicy < ApplicationPolicy
  class Scope < Scope
    # def resolve
    #   scope.where(user: user) # users can only see their flats
    # end
  end

  def index
  end

  def show
  end

  def new?
    create?
  end

  def create?
    # Only a landlord can create a flat
    user.landlord?
  end

  def edit?
    update?
  end

  def update?
    # Only the owner of the flat can update and edit the flat
    record.user == user
  end

  def destroy?
    # Only the owner of a flat can delete the flat
    record.user == user
  end
end
