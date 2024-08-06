locals {
  fnapp_urls = {

    processCaasFile             = "https://${var.names.function-app}-${lower(var.function_app.ProcessCaasFile.name_suffix)}.azurewebsites.net/api/processCaasFile"
    fileValidation              = "https://${var.names.function-app}-${lower(var.function_app.FileValidation.name_suffix)}.azurewebsites.net/api/FileValidation"
    addParticipant              = "https://${var.names.function-app}-${lower(var.function_app.AddNewParticipant.name_suffix)}.azurewebsites.net/api/addParticipant"
    removeParticipant           = "https://${var.names.function-app}-${lower(var.function_app.RemoveParticipant.name_suffix)}.azurewebsites.net/api/RemoveParticipant"
    updateParticipant           = "https://${var.names.function-app}-${lower(var.function_app.UpdateParticipant.name_suffix)}.azurewebsites.net/api/updateParticipant"
    demographicDataFunction     = "https://${var.names.function-app}-${lower(var.function_app.DemographicDataManagement.name_suffix)}.azurewebsites.net/api/DemographicDataFunction"
    createParticipant           = "https://${var.names.function-app}-${lower(var.function_app.CreateParticipant.name_suffix)}.azurewebsites.net/api/CreateParticipant"
    markParticipantAsEligible   = "https://${var.names.function-app}-${lower(var.function_app.MarkParticipantEligible.name_suffix)}.azurewebsites.net/api/markParticipantAsEligible"
    staticValidation            = "https://${var.names.function-app}-${lower(var.function_app.StaticValidation.name_suffix)}.azurewebsites.net/api/StaticValidation"
    markParticipantAsIneligible = "https://${var.names.function-app}-${lower(var.function_app.MarkParticipantAsIneligible.name_suffix)}.azurewebsites.net/api/markParticipantAsIneligible"
    updateParticipant           = "https://${var.names.function-app}-${lower(var.function_app.UpdateParticipantDetails.name_suffix)}.azurewebsites.net/api/updateParticipantDetails"
    lookupValidation            = "https://${var.names.function-app}-${lower(var.function_app.LookupValidation.name_suffix)}.azurewebsites.net/api/LookupValidation"
    createValidationException   = "https://${var.names.function-app}-${lower(var.function_app.CreateValidationExceptions.name_suffix)}.azurewebsites.net/api/CreateValidationException"
    demographicDataService      = "https://${var.names.function-app}-${lower(var.function_app.DemographicDataService.name_suffix)}.azurewebsites.net/api/DemographicDataService"

  }

  db_connection_string = "Server=${var.names.sql-server}.database.windows.net; Authentication=Active Directory Managed Identity; Database=${var.db_name}"
}

locals {

  global_app_settings = {
    WEBSITES_ENABLE_APP_SERVICE_STORAGE  = "false"
    DOCKER_ENABLE_CI = var.docker_CI_enable
  }

}

locals {
  app_settings = {

    receiveCaasFile = {
      #FUNCTIONS_WORKER_RUNTIME = "dotnet-isolated"
      ##DOCKER_ENABLE_CI = var.docker_CI_enable # "false"
      #WEBSITES_ENABLE_APP_SERVICE_STORAGE = "false"
      caasfolder_STORAGE = var.caasfolder_STORAGE
      targetFunction     = local.fnapp_urls.processCaasFile #"https://${var.names.function-app}-${lower(var.function_app.ProcessCaasFile.name_suffix)}/api/processCaasFile"
      FileValidationURL  = local.fnapp_urls.fileValidation  #"https://${var.names.function-app}-${lower(var.function_app.FileValidation.name_suffix)}/api/FileValidation"
    }

    ProcessCaasFile = {
      #FUNCTIONS_WORKER_RUNTIME = "dotnet-isolated"
      #DOCKER_ENABLE_CI = var.docker_CI_enable
      #WEBSITES_ENABLE_APP_SERVICE_STORAGE = "false"
      PMSAddParticipant    = local.fnapp_urls.addParticipant          #"https://${var.names.function-app}-${lower(var.function_app.AddNewParticipant.name_suffix)}/api/addParticipant"
      PMSRemoveParticipant = local.fnapp_urls.removeParticipant       # "https://${var.names.function-app}-${lower(var.function_app.RemoveParticipant.name_suffix)}/api/RemoveParticipant"
      PMSUpdateParticipant = local.fnapp_urls.updateParticipant       # "https://${var.names.function-app}-${lower(var.function_app.UpdateParticipant.name_suffix)}/api/updateParticipant"
      DemographicURI       = local.fnapp_urls.demographicDataFunction # "https://${var.names.function-app}-${lower(var.function_app.DemographicDataManagement.name_suffix)}/api/DemographicDataFunction"
    }

    AddNewParticipant = {
      #FUNCTIONS_WORKER_RUNTIME = "dotnet-isolated"
      #DOCKER_ENABLE_CI = var.docker_CI_enable
      #WEBSITES_ENABLE_APP_SERVICE_STORAGE = "false"
      DSaddParticipant            = local.fnapp_urls.createParticipant         # "https://${var.names.function-app}-${lower(var.function_app.CreateParticipant.name_suffix)}/api/CreateParticipant"
      DSmarkParticipantAsEligible = local.fnapp_urls.markParticipantAsEligible #"https://${var.names.function-app}-${lower(var.function_app.MarkParticipantEligible.name_suffix)}/api/markParticipantAsEligible"
      DemographicURIGet           = local.fnapp_urls.demographicDataFunction   # "https://${var.names.function-app}-${lower(var.function_app.DemographicDataManagement.name_suffix)}/api/DemographicDataFunction"
      StaticValidationURL         = local.fnapp_urls.staticValidation          # "https://${var.names.function-app}-${lower(var.function_app.StaticValidation.name_suffix)}/api/StaticValidation"

    }

    RemoveParticipant = {
      #FUNCTIONS_WORKER_RUNTIME = "dotnet-isolated"
      #DOCKER_ENABLE_CI = var.docker_CI_enable
      #WEBSITES_ENABLE_APP_SERVICE_STORAGE = "false"
      markParticipantAsIneligible = local.fnapp_urls.markParticipantAsIneligible # "https://${var.names.function-app}-${lower(var.function_app.MarkParticipantAsIneligible.name_suffix)}/api/markParticipantAsIneligible"
    }

    UpdateParticipant = {
      #FUNCTIONS_WORKER_RUNTIME = "dotnet-isolated"
      #DOCKER_ENABLE_CI = var.docker_CI_enable
      #WEBSITES_ENABLE_APP_SERVICE_STORAGE = "false"
      UpdateParticipant   = local.fnapp_urls.updateParticipant       # "https://${var.names.function-app}-${lower(var.function_app.UpdateParticipantDetails.name_suffix)}/api/updateParticipantDetails"
      StaticValidationURL = local.fnapp_urls.staticValidation        # "https://${var.names.function-app}-${lower(var.function_app.StaticValidation.name_suffix)}/api/StaticValidation"
      DemographicURIGet   = local.fnapp_urls.demographicDataFunction # "https://${var.names.function-app}-${lower(var.function_app.DemographicDataManagement.name_suffix)}/api/DemographicDataFunction"

    }

    CreateParticipant = {
      #FUNCTIONS_WORKER_RUNTIME = "dotnet-isolated"
      #DOCKER_ENABLE_CI = var.docker_CI_enable
      #WEBSITES_ENABLE_APP_SERVICE_STORAGE = "false"
      DtOsDatabaseConnectionString = local.db_connection_string
      LookupValidationURL          = local.fnapp_urls.lookupValidation # "https://${var.names.function-app}-${lower(var.function_app.LookupValidation.name_suffix)}/api/LookupValidation"

    }

    MarkParticipantEligible = {
      #FUNCTIONS_WORKER_RUNTIME = "dotnet-isolated"
      #DOCKER_ENABLE_CI = var.docker_CI_enable
      #WEBSITES_ENABLE_APP_SERVICE_STORAGE = "false"
      DtOsDatabaseConnectionString = local.db_connection_string

    }

    MarkParticipantAsIneligible = {
      #FUNCTIONS_WORKER_RUNTIME = "dotnet-isolated"
      #DOCKER_ENABLE_CI = var.docker_CI_enable
      #WEBSITES_ENABLE_APP_SERVICE_STORAGE = "false"
      DtOsDatabaseConnectionString = local.db_connection_string
      LookupValidationURL          = local.fnapp_urls.lookupValidation # "https://${var.names.function-app}-${lower(var.function_app.LookupValidation.name_suffix)}/api/LookupValidation"

    }

    UpdateParticipantDetails = {
      #FUNCTIONS_WORKER_RUNTIME = "dotnet-isolated"
      #DOCKER_ENABLE_CI = var.docker_CI_enable
      #WEBSITES_ENABLE_APP_SERVICE_STORAGE = "false"
      DtOsDatabaseConnectionString = local.db_connection_string
      LookupValidationURL          = local.fnapp_urls.lookupValidation # "https://${var.names.function-app}-${lower(var.function_app.LookupValidation.name_suffix)}/api/LookupValidation"

    }

    CreateValidationExceptions = {
      #FUNCTIONS_WORKER_RUNTIME = "dotnet-isolated"
      #DOCKER_ENABLE_CI = var.docker_CI_enable
      #WEBSITES_ENABLE_APP_SERVICE_STORAGE = "false"
      DtOsDatabaseConnectionString = local.db_connection_string

    }

    GetValidationExceptions = {
      #FUNCTIONS_WORKER_RUNTIME = "dotnet-isolated"
      #DOCKER_ENABLE_CI = var.docker_CI_enable
      #WEBSITES_ENABLE_APP_SERVICE_STORAGE = "false"
      DtOsDatabaseConnectionString = local.db_connection_string

    }

    DemographicDataService = {
      #FUNCTIONS_WORKER_RUNTIME = "dotnet-isolated"
      #DOCKER_ENABLE_CI = var.docker_CI_enable
      #WEBSITES_ENABLE_APP_SERVICE_STORAGE = "false"
      DtOsDatabaseConnectionString = local.db_connection_string

    }

    FileValidation = {
      #FUNCTIONS_WORKER_RUNTIME = "dotnet-isolated"
      #DOCKER_ENABLE_CI = var.docker_CI_enable
      #WEBSITES_ENABLE_APP_SERVICE_STORAGE = "false"
      CreateValidationExceptionURL = local.fnapp_urls.createValidationException # "https://${var.names.function-app}-${lower(var.function_app.CreateValidationExceptions.name_suffix)}/api/CreateValidationException"
      inboundBlobName              = "file-exceptions"

    }

    StaticValidation = {
      #FUNCTIONS_WORKER_RUNTIME = "dotnet-isolated"
      #DOCKER_ENABLE_CI = var.docker_CI_enable
      #WEBSITES_ENABLE_APP_SERVICE_STORAGE = "false"
      CreateValidationExceptionURL = local.fnapp_urls.createValidationException # "https://${var.names.function-app}-${lower(var.function_app.CreateValidationExceptions.name_suffix)}/api/CreateValidationException"

    }

    LookupValidation = {
      #FUNCTIONS_WORKER_RUNTIME = "dotnet-isolated"
      #DOCKER_ENABLE_CI = var.docker_CI_enable
      #WEBSITES_ENABLE_APP_SERVICE_STORAGE = "false"
      CreateValidationExceptionURL = local.fnapp_urls.createValidationException # "https://${var.names.function-app}-${lower(var.function_app.CreateValidationExceptions.name_suffix)}/api/CreateValidationException"

    }

    DemographicDataManagement = {
      #FUNCTIONS_WORKER_RUNTIME = "dotnet-isolated"
      #DOCKER_ENABLE_CI = var.docker_CI_enable
      #WEBSITES_ENABLE_APP_SERVICE_STORAGE = "false"
      DemographicDataServiceURI = local.fnapp_urls.demographicDataService # "https://${var.names.function-app}-${lower(var.function_app.DemographicDataService.name_suffix)}/api/DemographicDataService"

    }

    AddCohortDistributionData = {
      #FUNCTIONS_WORKER_RUNTIME = "dotnet-isolated"
      #DOCKER_ENABLE_CI = var.docker_CI_enable
      #WEBSITES_ENABLE_APP_SERVICE_STORAGE = "false"
      DtOsDatabaseConnectionString = local.db_connection_string

    }

    RetrieveCohortDistributionData = {
      #FUNCTIONS_WORKER_RUNTIME = "dotnet-isolated"
      #DOCKER_ENABLE_CI = var.docker_CI_enable
      #WEBSITES_ENABLE_APP_SERVICE_STORAGE = "false"
      DtOsDatabaseConnectionString = local.db_connection_string

    }

    RemoveCohortDistributionData = {
      #FUNCTIONS_WORKER_RUNTIME = "dotnet-isolated"
      #DOCKER_ENABLE_CI = var.docker_CI_enable
      #WEBSITES_ENABLE_APP_SERVICE_STORAGE = "false"
      DtOsDatabaseConnectionString = local.db_connection_string
    }

    TransformData = {
      #FUNCTIONS_WORKER_RUNTIME = "dotnet-isolated"
      #DOCKER_ENABLE_CI = var.docker_CI_enable
      #WEBSITES_ENABLE_APP_SERVICE_STORAGE = "false"
    }

    AllocateServiceProvider = {
      #FUNCTIONS_WORKER_RUNTIME = "dotnet-isolated"
      #DOCKER_ENABLE_CI = var.docker_CI_enable
      #WEBSITES_ENABLE_APP_SERVICE_STORAGE = "false"
      CreateValidationExceptionURL = local.fnapp_urls.createValidationException # "https://${var.names.function-app}-${lower(var.function_app.CreateValidationExceptions.name_suffix)}/api/CreateValidationException"

    }

    CreateCohortDistribution = {
      #FUNCTIONS_WORKER_RUNTIME = "dotnet-isolated"
      #DOCKER_ENABLE_CI = var.docker_CI_enable
      #WEBSITES_ENABLE_APP_SERVICE_STORAGE = "false"

    }

    RetrieveParticipantData = {
      #FUNCTIONS_WORKER_RUNTIME = "dotnet-isolated"
      #DOCKER_ENABLE_CI = var.docker_CI_enable
      #WEBSITES_ENABLE_APP_SERVICE_STORAGE = "false"

    }
  }
}
