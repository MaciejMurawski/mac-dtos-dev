# variable "TARGET_SUBSCRIPTION_ID" {
#   description = "ID of a subscription to deploy infrastructure"
#   type        = string
# }

# variable "DEVOPS_SUBSCRIPTION_ID" {
#   description = "ID of a DevOps subscription to deploy infrastructure"
#   type        = string
# }
variable "application" {
  description = "Project/Application code for deployment"
  type        = string
  default     = "DToS"
}
variable "environment" {
  description = "Environment code for deployments"
  type        = string
  default     = "DEV"
}

variable "location" {
  description = "Location code for deployments"
  type        = string
  default     = "uksouth"
}

variable "tags" {
  description = "Default tags to be applied to resources"
  type        = map(string)
}

variable "resource_groups" {
  description = "Map of resource groups"
  type = map(object({
    name = optional(string, "rg-dtos-dev-suk-baseline")
  }))
}

variable "storage_accounts" {
  description = "Configuration for the Storage Account, currently used for Function Apps"
  type = object({
    fnapp = object({
      name_suffix                   = optional(string, "fnappstor")
      resource_group_key            = optional(string, "cohman")
      account_tier                  = optional(string, "Standard")
      replication_type              = optional(string, "LRS")
      public_network_access_enabled = optional(bool, true)
    })
    file_exceptions = object({
      name_suffix                   = optional(string, "filexptns")
      resource_group_key            = optional(string, "cohman")
      account_tier                  = optional(string, "Standard")
      replication_type              = optional(string, "LRS")
      public_network_access_enabled = optional(bool, true)
      cont_name                     = optional(string, "file-exceptions")
      cont_access_type              = optional(string, "private")
    })
  })
}

variable "key_vault" {
  description = "Configuration for the baseline key vault"
  type = object({
    resource_group_key = optional(string, "baseline")
    disk_encryption    = optional(bool, true)
    soft_del_ret_days  = optional(number, 7)
    purge_prot         = optional(bool, false)
    sku_name           = optional(string, "standard")
  })
}

variable "sqlserver" {
  description = "Configuration for the Azure MSSQL server instance and a default database "
  type = object({

    sql_uai_name       = optional(string, "dtos-cohort-manager-sql-adm")
    sql_adm_group_name = optional(string, "sqlsvr_cohman_dev_uks_admin")
    ad_auth_only       = optional(bool, true)

    # Server Instance
    server = object({
      resource_group_key            = optional(string, "baseline")
      sqlversion                    = optional(string, "12.0")
      tlsversion                    = optional(number, 1.2)
      azure_services_access_enabled = optional(bool, true)
    })

    # Database
    dbs = map(object({
      db_name_suffix = optional(string, "baseline")
      collation      = optional(string, "SQL_Latin1_General_CP1_CI_AS")
      licence_type   = optional(string, "LicenseIncluded")
      max_gb         = optional(number, 5)
      read_scale     = optional(bool, false)
      sku            = optional(string, "S0")
    }))

    # FW Rules
    fw_rules = map(object({
      fw_rule_name = optional(string, "AllowAccessFromAzure")
      start_ip     = optional(string, "0.0.0.0")
      end_ip       = optional(string, "0.0.0.0")
    }))
  })

}

variable "app_service_plan" {
  description = "Configuration for the app service plan"
  type = object({
    resource_group_key = optional(string, "baseline")
    sku_name           = optional(string, "B1")
    os_type            = optional(string, "Windows")

    autoscale = object({
      memory_percentage = object({
        metric              = optional(string, "MemoryPercentage")
        capacity_min        = optional(string, "1")
        capacity_max        = optional(string, "5")
        capacity_def        = optional(string, "1")
        time_grain          = optional(string, "PT1M")
        statistic           = optional(string, "Average")
        time_window         = optional(string, "PT10M")
        time_aggregation    = optional(string, "Average")
        inc_operator        = optional(string, "GreaterThan")
        inc_threshold       = optional(number, 70)
        inc_scale_direction = optional(string, "Increase")
        inc_scale_type      = optional(string, "ChangeCount")
        inc_scale_value     = optional(number, 1)
        inc_scale_cooldown  = optional(string, "PT5M")
        dec_operator        = optional(string, "LessThan")
        dec_threshold       = optional(number, 25)
        dec_scale_direction = optional(string, "Decrease")
        dec_scale_type      = optional(string, "ChangeCount")
        dec_scale_value     = optional(number, 1)
        dec_scale_cooldown  = optional(string, "PT5M")
      })
    })
  })
}

variable "function_app" {
  description = "Configuration for the function app"
  type = object({
    resource_group_key       = optional(string, "baseline")
    gl_worker_32bit          = optional(bool, false)
    gl_docker_env_tag        = optional(string, "development")
    gl_docker_CI_enable      = optional(string, "cohort-manager")
    gl_docker_img_prefix     = optional(string, "false")
    gl_cont_registry_use_mi  = optional(bool, true)
    gl_enable_appsrv_storage = optional(string, "false")

    fa_config = map(object({
      name_suffix = string
    }))
  })
}

variable "event_grid" {
  description = "Configuration for the event grid"
  type = object({
    topic = object({
      resource_group_key = optional(string, "baseline")
      name_suffix        = optional(string, "baseline")
    })
  })
}

variable "law" {
  description = "Configuration of the Log Analytics Workspace"
  type = object({
    name_suffix        = optional(string, "baseline")
    resource_group_key = optional(string, "baseline")
    law_sku            = optional(string, "PerGB2018")
    retention_days     = optional(number, 30)
  })
}

variable "app_insights" {
  description = "Configuration of the App Insights"
  type = object({
    name_suffix        = optional(string, "baseline")
    resource_group_key = optional(string, "baseline")
    appinsights_type   = optional(string, "web")
  })
}

variable "acr" {
  description = "Configuration of the Azure Container Registry"
  type = object({
    resource_group_key = optional(string, "cohman")
    sku                = optional(string, "Premium")
    admin_enabled      = optional(bool, false)
    uai_name           = optional(string, "dtos-cohort-manager-acr-push")
  })
}

variable "api_management" {
  description = "Configuration of the API Management Service"
  type = object({
    resource_group_key = optional(string, "cohman")
    sku                = optional(string, "Basic_1")
    publisher_name     = optional(string, "NHS_DToS_CohortManager")
    publisher_email    = optional(string, "company@terraform.io")
  })
}
