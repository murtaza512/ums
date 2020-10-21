# frozen_string_literal: true

class UsersController < ApplicationController
  def index
    respond_to do |format|
      format.html
      format.js { render json: user_data }
    end
  end

  def create
    @user = User.new(user_params)
    @user.save
  end

  private

    def user_data
      column_names = [:name, :email, :phone, :title, :status, :updated_at]

      users = User.
        limit(params[:length]).
        offset(params[:start]).
        search(params.dig(:search, :value))

      users = users.order(order_params_formating(column_names)) if params.dig(:order).present?
      {
        'iTotalRecords': User.count,
        'iTotalDisplayRecords': User.count,
        'aaData': users.pluck(column_names)
      }
    end

    def order_params_formating(column_names)
      sort_params = params.dig(:order)
      params.dig(:order).keys.map { |val| [column_names[sort_params.dig(val, 'column').to_i], sort_params.dig(val, 'dir')].join(' ')}.join(', ')
    end

    def user_params
      params.require(:user).permit(:name, :email, :phone, :title, :status)
    end
end
