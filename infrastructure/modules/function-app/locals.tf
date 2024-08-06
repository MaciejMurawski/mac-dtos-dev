locals {
  # fnapp_urls = {

  #   ProcessCaasFile = "https://${var.names.function-app}-${lower(var.function_app.ProcessCaasFile.name_suffix)}/api/processCaasFile"
  #   FileValidation = "https://${var.names.function-app}-${lower(var.function_app.FileValidation.name_suffix)}/api/FileValidation"

  # }
  db_connection_string = "Server=${var.names.sql-server}.database.windows.net; Authentication=Active Directory Managed Identity; Database=${var.db_name}"
  app_settings = {

    receiveCaasFile = {
      #FUNCTIONS_WORKER_RUNTIME = "dotnet-isolated"
      DOCKER_ENABLE_CI = var.docker_CI_enable # "false"

      caasfolder_STORAGE = var.caasfolder_STORAGE
      targetFunction     = "https://${var.names.function-app}-${lower(var.function_app.ProcessCaasFile.name_suffix)}/api/processCaasFile"
      FileValidationURL  = "https://${var.names.function-app}-${lower(var.function_app.FileValidation.name_suffix)}/api/FileValidation"
    }

    ProcessCaasFile = {
      #FUNCTIONS_WORKER_RUNTIME = "dotnet-isolated"
      DOCKER_ENABLE_CI = var.docker_CI_enable

      PMSAddParticipant    = "https://${var.names.function-app}-${lower(var.function_app.AddNewParticipant.name_suffix)}/api/addParticipant"
      PMSRemoveParticipant = "https://${var.names.function-app}-${lower(var.function_app.RemoveParticipant.name_suffix)}/api/RemoveParticipant"
      PMSUpdateParticipant = "https://${var.names.function-app}-${lower(var.function_app.UpdateParticipant.name_suffix)}/api/updateParticipant"
      DemographicURI       = "https://${var.names.function-app}-${lower(var.function_app.DemographicDataManagement.name_suffix)}/api/DemographicDataFunction"
    }

    AddNewParticipant = {
      #FUNCTIONS_WORKER_RUNTIME = "dotnet-isolated"
      DOCKER_ENABLE_CI = var.docker_CI_enable

      DSaddParticipant            = "https://${var.names.function-app}-${lower(var.function_app.CreateParticipant.name_suffix)}/api/CreateParticipant"
      DSmarkParticipantAsEligible = "https://${var.names.function-app}-${lower(var.function_app.MarkParticipantEligible.name_suffix)}/api/markParticipantAsEligible"
      DemographicURIGet           = "https://${var.names.function-app}-${lower(var.function_app.DemographicDataManagement.name_suffix)}/api/DemographicDataFunction"
      StaticValidationURL         = "https://${var.names.function-app}-${lower(var.function_app.StaticValidation.name_suffix)}/api/StaticValidation"

    }

    RemoveParticipant = {
      #FUNCTIONS_WORKER_RUNTIME = "dotnet-isolated"
      DOCKER_ENABLE_CI = var.docker_CI_enable

      markParticipantAsIneligible = "https://${var.names.function-app}-${lower(var.function_app.MarkParticipantAsIneligible.name_suffix)}/api/markParticipantAsIneligible"
    }

    UpdateParticipant = {
      #FUNCTIONS_WORKER_RUNTIME = "dotnet-isolated"
      DOCKER_ENABLE_CI = var.docker_CI_enable

      UpdateParticipant   = "https://${var.names.function-app}-${lower(var.function_app.UpdateParticipantDetails.name_suffix)}/api/updateParticipantDetails"
      StaticValidationURL = "https://${var.names.function-app}-${lower(var.function_app.StaticValidation.name_suffix)}/api/StaticValidation"
      DemographicURIGet   = "https://${var.names.function-app}-${lower(var.function_app.DemographicDataManagement.name_suffix)}/api/DemographicDataFunction"

    }

    CreateParticipant = {
      #FUNCTIONS_WORKER_RUNTIME = "dotnet-isolated"
      DOCKER_ENABLE_CI = var.docker_CI_enable

      UNCTIONS_WORKER_RUNTIME = "dotnet-isolated"

      DtOsDatabaseConnectionString = locals.db_connection_string
      #DtOsDatabaseConnectionString = Server=localhost,1433;Database=${DB_NAME};User Id=SA;Password=${PASSWORD};TrustServerCertificate=True
      LookupValidationURL = "https://${var.names.function-app}-${lower(var.function_app.LookupValidation.name_suffix)}/api/LookupValidation"

    }

    MarkParticipantEligible = {
      #FUNCTIONS_WORKER_RUNTIME = "dotnet-isolated"
      DOCKER_ENABLE_CI = var.docker_CI_enable

      #DtOsDatabaseConnectionString = Server=localhost,1433;Database=${DB_NAME};User Id=SA;Password=${PASSWORD};TrustServerCertificate=True

    }

    MarkParticipantAsIneligible = {
      #FUNCTIONS_WORKER_RUNTIME = "dotnet-isolated"
      DOCKER_ENABLE_CI = var.docker_CI_enable

      #DtOsDatabaseConnectionString = Server=localhost,1433;Database=${DB_NAME};User Id=SA;Password=${PASSWORD};TrustServerCertificate=True
      LookupValidationURL = "https://${var.names.function-app}-${lower(var.function_app.LookupValidation.name_suffix)}/api/LookupValidation"

    }

    UpdateParticipantDetails = {
      #FUNCTIONS_WORKER_RUNTIME = "dotnet-isolated"
      DOCKER_ENABLE_CI = var.docker_CI_enable

      #DtOsDatabaseConnectionString = Server=localhost,1433;Database=${DB_NAME};User Id=SA;Password=${PASSWORD};TrustServerCertificate=True
      LookupValidationURL = "https://${var.names.function-app}-${lower(var.function_app.LookupValidation.name_suffix)}/api/LookupValidation"

    }

    CreateValidationExceptions = {
      #FUNCTIONS_WORKER_RUNTIME = "dotnet-isolated"
      DOCKER_ENABLE_CI = var.docker_CI_enable

      #DtOsDatabaseConnectionString = Server=localhost,1433;Database=${DB_NAME};User Id=SA;Password=${PASSWORD};TrustServerCertificate=True
    }

    GetValidationExceptions = {
      #FUNCTIONS_WORKER_RUNTIME = "dotnet-isolated"
      DOCKER_ENABLE_CI = var.docker_CI_enable

      #DtOsDatabaseConnectionString = Server=localhost,1433;Database=${DB_NAME};User Id=SA;Password=${PASSWORD};TrustServerCertificate=True

    }

    DemographicDataService = {
      #FUNCTIONS_WORKER_RUNTIME = "dotnet-isolated"
      DOCKER_ENABLE_CI = var.docker_CI_enable

      #DtOsDatabaseConnectionString = Server=localhost,1433;Database=${DB_NAME};User Id=SA;Password=${PASSWORD};TrustServerCertificate=True

    }

    FileValidation = {
      #FUNCTIONS_WORKER_RUNTIME = "dotnet-isolated"
      DOCKER_ENABLE_CI = var.docker_CI_enable

      CreateValidationExceptionURL = "https://${var.names.function-app}-${lower(var.function_app.CreateValidationExceptions.name_suffix)}/api/CreateValidationException"
      inboundBlobName              = "file-exceptions"

    }

    StaticValidation = {
      #FUNCTIONS_WORKER_RUNTIME = "dotnet-isolated"
      DOCKER_ENABLE_CI = var.docker_CI_enable

      CreateValidationExceptionURL = "https://${var.names.function-app}-${lower(var.function_app.CreateValidationExceptions.name_suffix)}/api/CreateValidationException"

    }

    LookupValidation = {
      #FUNCTIONS_WORKER_RUNTIME = "dotnet-isolated"
      DOCKER_ENABLE_CI = var.docker_CI_enable

      CreateValidationExceptionURL = "https://${var.names.function-app}-${lower(var.function_app.CreateValidationExceptions.name_suffix)}/api/CreateValidationException"

    }

    DemographicDataManagement = {
      #FUNCTIONS_WORKER_RUNTIME = "dotnet-isolated"
      DOCKER_ENABLE_CI = var.docker_CI_enable

      DemographicDataServiceURI = "https://${var.names.function-app}-${lower(var.function_app.DemographicDataService.name_suffix)}/api/DemographicDataService"

    }

    AddCohortDistributionData = {
      #FUNCTIONS_WORKER_RUNTIME = "dotnet-isolated"
      DOCKER_ENABLE_CI = var.docker_CI_enable

      #DtOsDatabaseConnectionString = Server=localhost,1433;Database=${DB_NAME};User Id=SA;Password=${PASSWORD};TrustServerCertificate=True

    }

    RetrieveCohortDistributionData = {
      #FUNCTIONS_WORKER_RUNTIME = "dotnet-isolated"
      DOCKER_ENABLE_CI = var.docker_CI_enable

      #DtOsDatabaseConnectionString = Server=localhost,1433;Database=${DB_NAME};User Id=SA;Password=${PASSWORD};TrustServerCertificate=True

    }

    RemoveCohortDistributionData = {
      #FUNCTIONS_WORKER_RUNTIME = "dotnet-isolated"
      DOCKER_ENABLE_CI = var.docker_CI_enable

      #DtOsDatabaseConnectionString = Server=localhost,1433;Database=${DB_NAME};User Id=SA;Password=${PASSWORD};TrustServerCertificate=True
    }

    TransformData = {
      #FUNCTIONS_WORKER_RUNTIME = "dotnet-isolated"
      DOCKER_ENABLE_CI = var.docker_CI_enable
    }

    AllocateServiceProvider = {
      #FUNCTIONS_WORKER_RUNTIME = "dotnet-isolated"
      DOCKER_ENABLE_CI = var.docker_CI_enable

      CreateValidationExceptionURL = "https://${var.names.function-app}-${lower(var.function_app.CreateValidationExceptions.name_suffix)}/api/CreateValidationException"

    }

    CreateCohortDistribution = {
      #FUNCTIONS_WORKER_RUNTIME = "dotnet-isolated"
      DOCKER_ENABLE_CI = var.docker_CI_enable
    }

    RetrieveParticipantData = {
      #FUNCTIONS_WORKER_RUNTIME = "dotnet-isolated"
    }
  }
}
