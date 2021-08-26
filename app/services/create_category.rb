class CreateCategory

  def initialize(params)
    @category_params = params[:category_params]
  end

  def call
    category = Category.create(@category_params)
  end
end