# Bitcharts

## Usage

* Generate a chart

~~~
rails g bitcharts:chart user_logins
# or a scoped chart:
rails g bitcharts:scoped_chart user_logins
~~~

* Implement chart's value method in `app/charts/user_logins_chart.rb`
* Include canvas into your view

~~~
<%= bitchart 'user_logins', from: 7.days.ago, to: Date.today %>
<%# Check Bitcharts::ApplicationHelper for more options %>
~~~
