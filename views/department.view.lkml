view: department {

  derived_table: {
    sql: select DEPARTMENT_ID,
                upper(DEPARTMENT_NAME) DEPARTMENT_NAME,
                MANAGER_ID,
                LOCATION_ID,
                case when LOCATION_ID = 1400 then 'India' else 'Out of India' end LOCATION_ID_TEXT
           from application_temp.departments ;;
  }

  dimension: did {
    label: "Department Identifier"
    type: number
    primary_key: yes
    sql: ${TABLE}.DEPARTMENT_ID ;;
  }

  dimension: DEPARTMENT_NAME {
    label: "Department Name"
    type: string
    sql: ${TABLE}.DEPARTMENT_NAME ;;
  }

  dimension: MANAGER_ID {
    label: "Manager ID"
    type: number
    hidden: yes
    sql: ${TABLE}.MANAGER_ID ;;
  }

  dimension: LOCATION_ID {
    label: "Location ID"
    type: number
    sql: ${TABLE}.LOCATION_ID ;;
  }

  dimension: LOCATION_ID_TEXT {
    label: "Location ID TEXT"
    type: string
    sql: ${TABLE}.LOCATION_ID_TEXT ;;
  }
  }
