# A nested module to organize all admin-related controllers
  class CategoriesController < ApplicationController
    
    # Lists all categories
    def index
      @categories = Category.all
      # Fetch all Category records from the database and store them in an instance variable `@categories`
    end

    # Shows a form for creating a new category
    def new
      @category = Category.new
      # Initialize a new instance of the Category model and store it in `@category`
    end

    # Handles the form submission for creating a new category
    def create
      @category = Category.new(category_params)
      # Create a new Category instance with the permitted parameters from the form

      if @category.save
        # If the category is successfully saved to the database...
        redirect_to admin_categories_path, notice: 'Category was successfully created.'
        # ...redirect to the categories index page with a success notice
      else
        # If the category failed to save...
        render :new
        # ...re-render the new category form with validation errors
      end
    end

    private
    # The following method is private and can't be accessed from outside of this class

    # Strong parameters: only allow the permitted attributes (`:name`) to be used in mass assignment
    def category_params
      params.require(:category).permit(:name)
      # Ensure that `params` contains a `:category` key, and permit only the `:name` attribute
    end
  end