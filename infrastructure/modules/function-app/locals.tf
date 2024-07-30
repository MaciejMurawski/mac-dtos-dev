locals {
  # fnapp_urls = {
  #   for_each = var.function_app
  #     url - app.
  #   }

  #   url = azurerm_linux_function_app.function.defaul_hostname
  #   receiveCaasFile = azurerm_linux_function_app.function.defaul_hostname[var.function_app.fa_config.receiveCaasFile]

  local_app_settings  = {

    receiveCaasFile = {
      FUNCTIONS_WORKER_RUNTIME = "dotnet-isolated"
      AzureWebJobsStorage = "UseDevelopmentStorage=true" ## ??
      caasfolder_STORAGE = "UseDevelopmentStorage=true" ## ?? aws_instance.blue.*.id
      targetFunction    = "http://${var.names.function-app}-${lower(var.function_app.receiveCaasFile.name_suffix)}/api/processCaasFile"
      FileValidationURL = "http://${var.names.function-app}-${lower(var.function_app.FileValidation.name_suffix)}/api/FileValidation"
    }

    ProcessCaasFile = {
    }

    AddNewParticipant = {
    }

    RemoveParticipant = {
    }

    UpdateParticipant = {
    }

    CreateParticipant = {
    }

    MarkParticipantEligible = {
    }

    MarkParticipantAsIneligible = {
    }

    UpdateParticipantDetails = {
    }

    CreateValidationExceptions = {
    }

    GetValidationExceptions = {
    }

    DemographicDataService = {
    }

    FileValidation = {
    }

    StaticValidation = {
    }

    LookupValidation = {
    }

    DemographicDataManagement = {
    }

    AddCohortDistributionData = {
    }

    RetrieveCohortDistributionData = {
    }

    RemoveCohortDistributionData = {
    }

    TransformData = {
    }

    AllocateServiceProvider = {
    }

    CreateCohortDistribution = {
    }

    RetrieveParticipantData = {
    }
  }
}
