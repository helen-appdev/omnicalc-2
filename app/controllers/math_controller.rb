class MathController < ApplicationController 
  def add_results
      # parameters wizard_add?first_num=2&second_num=4
      @first = params.fetch("first_num").to_f
      @second = params.fetch("second_num").to_f
      @result = @first + @second
    render({:template => "math_templates/addition_results.html.erb"})
  end

  def add_form
    render({:template => "math_templates/addition_form.html.erb" })
  end

  def subtract_form
    render({:template => "math_templates/subtract_form.html.erb"})
  end

  def subtract_results
    @first = params.fetch("first_num").to_f
    @second = params.fetch("second_num").to_f  
    @result = @first - @second
    render({:template => "math_templates/subtraction_results.html.erb"})
  end
end
