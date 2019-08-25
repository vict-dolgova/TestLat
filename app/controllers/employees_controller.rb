class EmployeesController < ApplicationController

  def create
    @library = Library.find(params[:library_id])
    @employee = @library.employees.create(employee_params)
    if @employee.save
      redirect_to library_path(@library)
    else render inline: "<div>
        <h2>Возникли ошибки! Список условий для успешного сохранения сотрудника:</h2>
        <ul>
          <li>Фамилия сотрудника не может быть пустой;</li>
          <li>Имя сотрудника не может быть пустым;</li>
          <li>Должность сотрудника не может быть пустой.</li>
        </ul>
        <h2>Попробуйте еще раз</h2>
        <%= link_to 'Назад', library_path(@library) %>
      </div>"
    end
  end

  def edit
    @employee =  Employee.find(params[:id])
  end

  def update
    @employee =  Employee.find(params[:id])
    if @employee.update(employee_params)
        redirect_to library_path(Library.find(@employee.library_id))
    else
      render action: :edit
    end
  end

  def destroy
    @employee = Employee.find(params[:id])
    @library = Library.find(@employee.library_id)
    @employee.destroy
    redirect_to library_path(@library)
  end

private
  def employee_params
    params.require(:employee).permit(:surname, :name, :middleName, :birthDate, :employmentDate, :position, :education)
  end

end
