view: dept {
  derived_table: {
    sql: SELECT
          dept.DeptID  AS `dept.dept_id`,
          dept.DeptName  AS `dept.dept_name`,
          dept.DeptID  AS `dept.location_id`
          case when LOCATION_ID = 2 then 'India' else 'Out of India' end LOCATION_ID_TEXT
      FROM demo_db.dept  AS dept

       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: dept_dept_id {
    type: number
    sql: ${TABLE}.`dept.dept_id` ;;
  }

  dimension: dept_dept_name {
    type: string
    sql: ${TABLE}.`dept.dept_name` ;;
  }

  dimension: dept_location_id {
    type: number
    sql: ${TABLE}.`dept.location_id` ;;
  }

  set: detail {
    fields: [dept_dept_id, dept_dept_name, dept_location_id]
  }

  dimension: LOCATION_ID_TEXT {
    label: "Location ID TEXT"
    type: string
    sql: ${TABLE}.LOCATION_ID_TEXT ;;
  }
}
