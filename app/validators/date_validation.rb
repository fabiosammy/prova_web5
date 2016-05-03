class DateValidation < ActiveModel::Validator
  def validate(object)
    if object.birthday > Date.today
      object.errors.add :birthday, 'data de nascimento inválida'
    end
  end

  private
    def some_complex_logic
      # ...
    end
end