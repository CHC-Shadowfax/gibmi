class ListPolicy < ApplicationPolicy
  def show?
    true
  end

  def new?
    true
  end

  def create?
    true
  end

  def update?
    record.user == user
  end

  def destroy?
    record.user == user
    # - record: the list passed to the `authorize` method in controller
    # - user:   the `current_user` signed in with Devise.
  end

  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
     scope.where(user: user)
    end
  end
end
