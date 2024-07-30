locals {
  fnapp_urls = {

    ProcessCaasFile = "https://${var.names.function-app}-${lower(var.function_app.ProcessCaasFile.name_suffix)}/api/processCaasFile"
    FileValidation = "https://${var.names.function-app}-${lower(var.function_app.FileValidation.name_suffix)}/api/FileValidation"

  }

  app_settings  = {

    receiveCaasFile = {
      FUNCTIONS_WORKER_RUNTIME = "dotnet-isolated"
      DOCKER_ENABLE_CI         = "false"

      AzureWebJobsStorage = "UseDevelopmentStorage=true" ## ??
      caasfolder_STORAGE = "UseDevelopmentStorage=true" ## ?? aws_instance.blue.*.id
      targetFunction    = "https://${var.names.function-app}-${lower(var.function_app.ProcessCaasFile.name_suffix)}/api/processCaasFile" #locals.fnapp_urls.ProcessCaasFile #
      FileValidationURL = "https://${var.names.function-app}-${lower(var.function_app.FileValidation.name_suffix)}/api/FileValidation" #locals.fnapp_urls.FileValidation #
    }

    ProcessCaasFile = {
      FUNCTIONS_WORKER_RUNTIME = "dotnet-isolated"
      DOCKER_ENABLE_CI         = "false"

      PMSAddParticipant     = "https://${var.names.function-app}-${lower(var.function_app.AddNewParticipant.name_suffix)}/api/addParticipant"
      PMSRemoveParticipant  = "https://${var.names.function-app}-${lower(var.function_app.RemoveParticipant.name_suffix)}/api/RemoveParticipant"
      PMSUpdateParticipant  = "https://${var.names.function-app}-${lower(var.function_app.UpdateParticipant.name_suffix)}/api/updateParticipant"
      DemographicURI        = "https://${var.names.function-app}-${lower(var.function_app.DemographicDataManagement.name_suffix)}/api/DemographicDataFunction"
    }

    AddNewParticipant = {
      FUNCTIONS_WORKER_RUNTIME = "dotnet-isolated"
      DOCKER_ENABLE_CI         = "false"
    }

    RemoveParticipant = {
      FUNCTIONS_WORKER_RUNTIME = "dotnet-isolated"
      DOCKER_ENABLE_CI         = "false"
    }

    UpdateParticipant = {
      FUNCTIONS_WORKER_RUNTIME = "dotnet-isolated"
      DOCKER_ENABLE_CI         = "false"
    }

    CreateParticipant = {
      FUNCTIONS_WORKER_RUNTIME = "dotnet-isolated"
      DOCKER_ENABLE_CI         = "false"
    }

    MarkParticipantEligible = {
      FUNCTIONS_WORKER_RUNTIME = "dotnet-isolated"
      DOCKER_ENABLE_CI         = "false"
    }

    MarkParticipantAsIneligible = {
      FUNCTIONS_WORKER_RUNTIME = "dotnet-isolated"
      DOCKER_ENABLE_CI         = "false"
    }

    UpdateParticipantDetails = {
      FUNCTIONS_WORKER_RUNTIME = "dotnet-isolated"
      DOCKER_ENABLE_CI         = "false"
    }

    CreateValidationExceptions = {
      FUNCTIONS_WORKER_RUNTIME = "dotnet-isolated"
      DOCKER_ENABLE_CI         = "false"
    }

    GetValidationExceptions = {
      FUNCTIONS_WORKER_RUNTIME = "dotnet-isolated"
      DOCKER_ENABLE_CI         = "false"
    }

    DemographicDataService = {
      FUNCTIONS_WORKER_RUNTIME = "dotnet-isolated"
      DOCKER_ENABLE_CI         = "false"
    }

    FileValidation = {
      FUNCTIONS_WORKER_RUNTIME = "dotnet-isolated"
      DOCKER_ENABLE_CI         = "false"
    }

    StaticValidation = {
      FUNCTIONS_WORKER_RUNTIME = "dotnet-isolated"
      DOCKER_ENABLE_CI         = "false"
    }

    LookupValidation = {
      FUNCTIONS_WORKER_RUNTIME = "dotnet-isolated"
      DOCKER_ENABLE_CI         = "false"
    }

    DemographicDataManagement = {
      FUNCTIONS_WORKER_RUNTIME = "dotnet-isolated"
      DOCKER_ENABLE_CI         = "false"
    }

    AddCohortDistributionData = {
      FUNCTIONS_WORKER_RUNTIME = "dotnet-isolated"
      DOCKER_ENABLE_CI         = "false"
    }

    RetrieveCohortDistributionData = {
      FUNCTIONS_WORKER_RUNTIME = "dotnet-isolated"
      DOCKER_ENABLE_CI         = "false"
    }

    RemoveCohortDistributionData = {
      FUNCTIONS_WORKER_RUNTIME = "dotnet-isolated"
      DOCKER_ENABLE_CI         = "false"
    }

    TransformData = {
      FUNCTIONS_WORKER_RUNTIME = "dotnet-isolated"
      DOCKER_ENABLE_CI         = "false"
    }

    AllocateServiceProvider = {
      FUNCTIONS_WORKER_RUNTIME = "dotnet-isolated"
      DOCKER_ENABLE_CI         = "false"
    }

    CreateCohortDistribution = {
      FUNCTIONS_WORKER_RUNTIME = "dotnet-isolated"
      DOCKER_ENABLE_CI         = "false"
    }

    RetrieveParticipantData = {
      FUNCTIONS_WORKER_RUNTIME = "dotnet-isolated"
    }
  }
}
