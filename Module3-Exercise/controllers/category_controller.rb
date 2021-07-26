require 'erb'
require './models/category'

class CategoryController
  def create_catagory(param)
    category = Category.new({
                      name:param['name']
                    })
    category.save
  end

  def index_category
    category = Category.get_all_categories
    renderer = ERB.new(File.read("./views/index_category.erb"))
    renderer.result(binding)
  end

  def add_category
    renderer = ERB.new(File.read("./views/create.erb"))
    renderer.result(binding)
  end

  def form_add
    renderer = ERB.new(File.read("./views/new_category.erb"))
    renderer.result()
  end

  def get_all_category
    category = Category.get_all_categories
    category
  end

  def get_category_of_an_item(id)
    category = Category.find_by_item(id)
    category
  end

end
