connection: "bigquery_publicdata_standard_sql"

# # include all the views
include: "ecomm*.view"
include: "finance*.view"


explore: financial_data {}

explore: order_items {
  join: users {
    sql_on: ${users.id} = ${order_items.user_id} ;;
    type: left_outer
    relationship: many_to_one
  }
  join: inventory_items {
    type: left_outer
    sql_on: ${order_items.inventory_item_id} = ${inventory_items.id} ;;
    relationship: many_to_one
  }

  join: products {
    type: left_outer
    sql_on: ${inventory_items.product_id} = ${products.id} ;;
    relationship: many_to_one
  }
#   join: weather_facts_month {
#     relationship: many_to_one
#     sql_on: ${users.zip} = ${weather_facts_month.zip_code}
#     and ${order_items.created_month} = ${weather_facts_month.date_month};;
#   }
  join: inflation {
    from: financial_data
    sql_on:
     cast(${order_items.created_month} as string) =  cast(${inflation.indicator_month} as string)
      and ${inflation.dataset_code} = 'CPIAUCSL'
    ;;
    type: left_outer
    relationship: many_to_one
  }

  join: unemployment {
    from: financial_data
    sql_on:
     cast(${order_items.created_month} as string) =  cast(${unemployment.indicator_month} as string)
      and ${unemployment.dataset_code} = 'UNEMPLOY'
    ;;
    type: left_outer
    relationship: many_to_one
  }
}


#        ${order_items.created_month} >=  ${financial_data.indicator_date}
#       and ${order_items.created_date} <  ${financial_data.next_indicator_date}
