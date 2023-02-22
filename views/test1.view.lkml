view: test1 {
  # You can specify the table name if it's different from the view name:
  sql_table_name: demo_db.users ;;

  # Define your dimensions and measures here, like this:
  dimension: eid {
    label: "Employee Identifier"
    description: "Unique ID for each user that has ordered"
    type: number
    primary_key: yes
    sql: ${TABLE}.id ;;
  }

  dimension: first_name {
    group_label: "Names"
    label: "Employee First Name"
    description: "First Name of the Emaployee"
    type: string
    sql: upper(${TABLE}.first_name) ;;
  }

  dimension: did {
    label: "Department Identifier"
    description: "Unique ID for each user that has ordered"
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: last_name {
    group_label: "Names"
    label: "Employee First Name"
    description: "Last Name of the Emaployee"
    type: string
    sql: upper(${TABLE}.last_name) ;;
  }

  dimension: full_name {
    group_label: "Names"
    label: "Employee Full Name"
    description: "Full Name of the Emaployee"
    type: string
    sql: ${first_name} || ${last_name} ;;
  }



  dimension_group: hire_date {
    type: time
    timeframes: [date,month,year,month_name]
    sql: ${TABLE}.created_at ;;
  }

  measure: salary {
    label: "Salary"
    description: "Salary"
    type: sum
    sql: ${TABLE}.age ;;
  }


}
