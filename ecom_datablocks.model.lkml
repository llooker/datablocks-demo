connection: "bigquery_publicdata_standard_sql"

# include: "ecomm.view.lkml"         # include all views in this project
include: "weather.*.lkml"
include: "*.dashboard.lookml"  # include all dashboards in this project

explore: weather_facts {}
