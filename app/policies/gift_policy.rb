class GiftPolicy < ApplicationPolicy
  def index?
    true
  end

  def show?
    true
  end

  def edit?
    true
  end

  def new?
    true
  end

  def create?
    true
  end

  def update?
    true
  end

  def add_assignee_email?
    !record.has_assignee?
  end

  def add_assignee?
    !record.has_assignee?
  end

  def assigned_gifts?
    true
  end

  def destroy?
    true
    # record.user == user
    # - record: the list passed to the `authorize` method in controller
    # - user:   the `current_user` signed in with Devise.
  end

  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
     scope
    end
  end
end
