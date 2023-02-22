connection: "thelook"
include:"/views/test1.view.lkml"
include: "/views/dept.view.lkml"


explore: test1 {
  description: "This explore is for Employee details"
  view_label: "Employee Data"
  sql_always_where: ${test1.eid} > 2  ;;
  fields: [ALL_FIELDS*,
    -test1.did]

  join: dept {
    view_label: "Department"
    type: left_outer
    relationship:  many_to_one
    sql_on: ${test1.did} = ${dept.dept_dept_id} ;;
  }
}

               # include all views in the views/ folder in this project
# include: "/**/*.view.lkml"                 # include all views in this project
# include: "my_dashboard.dashboard.lookml"   # include a LookML dashboard called my_dashboard

# # Select the views that should be a part of this model,
# # and define the joins that connect them together.
#
# explore: order_items {
#   join: orders {
#     relationship: many_to_one
#     sql_on: ${orders.id} = ${order_items.order_id} ;;
#   }
#
#   join: users {
#     relationship: many_to_one
#     sql_on: ${users.id} = ${orders.user_id} ;;
#   }
# }
