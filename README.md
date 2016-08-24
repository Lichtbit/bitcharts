= Bitcharts =

== Usage ==

1. Generate a chart

~~~
rails g bitcharts:chart user_logins
# or a scoped chart:
rails g bitcharts:scoped_chart user_logins
~~~

2. Implement chart's value method in `app/charts/user_logins_chart.rb`
3. Include canvas into your view

~~~
<%= bitchart 'user_logins', from: 7.days.ago, to: Date.today %>
<%# Check Bitcharts::ApplicationHelper for more options %>
~~~