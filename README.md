# time_logger

Time logger is a time logging application for small businesses. Employees use the application to log their hours on-the-go, and managers use the application to keep track of their employees' time and business mileage. The application is written in Ruby on Rails.

##Database Creation

1. Clone the repository
2. Run 'bundle'
3. Run 'rake db:create:all'
4. Run 'rake db:migrate'
5. Run 'rake db:seed'

To see the app from an admin/manager view, log in as:

```
  user: admin@gmail.com
```

```
pass: password
```

You'll start out on a reporting dashboard displaying your employees' hours. Click the 'Filtered by Month' and 'Filtered by Year' buttons to expand the time range of employee hours displayed. As an administrator, you can also add Clients and Categories under which your employees can log time.


To see the app from an employee/user view, log in as:

```
  user: johndoe@gmail.com
```

```
  pass: password
```

You'll start out on a reporting dashboard displaying your logged hours. Click the 'Filtered by Month' and 'Filtered by Year' buttons to expand the time range of hours displayed. As an employee, you can log hours by clicking the 'Log Time' link and completing the time entry form.
