require 'test_helper'

class TasksControllerTest < ActionDispatch::IntegrationTest
  test 'Get index' do
    get tasks_path
    assert_response :success
  end

  test 'Should get right count tasks in index' do
    get tasks_path
    assert_select 'div.task', Task.count
  end

  test 'Success create task' do
    post '/tasks',
         params: { task: { name: 'Nikita', description: 'Hehe', status: 'NEW', creator: 'dsasda', performer: 'dsadsa',
                           completed: true } }
    assert_response :redirect
  end

  test 'Sucess delete task' do
    task = Task.all.first
    delete "/tasks/#{task.id}"
    assert_redirected_to tasks_path
  end
end
