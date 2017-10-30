view: products {
  sql_table_name: thelook_web_analytics.products ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: brand {
    sql: ${TABLE}.brand ;;
    link: {
      label: "Brand Analytics Dashboard"
      url: "/dashboards/944?Brand%20Name={{ value | encode_uri }}&Date={{
      _filters['order_items.created_date'] | url_encode }}"
      icon_url: "http://www.looker.com/favicon.ico"
    }}

  measure: brand_list {
    type: list
    list_field: brand
  }

  dimension: category {
    type: string
    sql: ${TABLE}.category ;;
  }

  measure: category_list {
    type: list
    list_field: category
  }

  dimension: cost {
    type: number
    sql: ${TABLE}.cost ;;
  }

  dimension: department {
    type: string
    sql: ${TABLE}.department ;;
  }

  dimension: distribution_center_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.distribution_center_id ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: retail_price {
    type: number
    sql: ${TABLE}.retail_price ;;
  }

  dimension: sku {
    type: string
    sql: ${TABLE}.sku ;;
  }

  measure: count {
    type: count
    drill_fields: [id, name, distribution_centers.name, distribution_centers.id, inventory_items.count]
  }
}
