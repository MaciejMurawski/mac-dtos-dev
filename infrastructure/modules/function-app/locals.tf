locals {
  # fnapp_urls = {
  #   for app in module.azurerm_linux_function_app.function : app.name => {
  #     url - app.
  #   }

  #   url = azurerm_linux_function_app.function.defaul_hostname
  #   receiveCaasFile = azurerm_linux_function_app.function.defaul_hostname[var.function_app.fa_config.receiveCaasFile]
  # }
  local_app_settings  = {

    receiveCaasFile = {
      FUNCTIONS_WORKER_RUNTIME = "dotnet-isolated"
      AzureWebJobsStorage = "UseDevelopmentStorage=true" ## ??
      caasfolder_STORAGE = "UseDevelopmentStorage=true" ## ?? aws_instance.blue.*.id
      targetFunction = "http://${azurerm_linux_function_app.function.[processCaasFile].defaul_hostname}/api/processCaasFile"
      FileValidationURL = "http://${azurerm_linux_function_app.function.[FileValidation].defaul_hostname}/api/FileValidation" #"http://localhost:7073/api/FileValidation"
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
