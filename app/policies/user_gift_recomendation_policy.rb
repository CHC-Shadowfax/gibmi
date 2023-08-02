class UserGiftRecomendationPolicy < ApplicationPolicy
  def index?
    true
  end

  def show?
    true
  end

  def create?
    user.present?
  end

  def update?
    user.present? && (record.user == user || user.admin?)
  end

  def destroy?
    user.present? && (record.user == user || user.admin?)
  end

  def add_assignee_email?
    !record.has_assignee?
  end

  def add_assignee?
    !record.has_assignee?
  end

  private

  def post
    record
  end

  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
     scope
    end
  end

end
