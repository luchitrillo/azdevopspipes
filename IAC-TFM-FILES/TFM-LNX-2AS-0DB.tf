#TFM-LNX-2AS-0DB

provider "azurerm" {
	version = ">= 1.6.0"
}

terraform {
	required_version = ">= 0.12.9"
}

resource "azurerm_resource_group" "main" {
	name = "dw-project-#{Proyecto}#"
	location = "eastus"
	
	tags = {
		Project = "#{Proyecto}#"
		Requester = "#{Solicitante}#"
		DateCreated = "#{Fecha}#"
	}
}

resource "azurerm_storage_account" "main" {
    name = "dwsa#{Proyecto}#"
    resource_group_name = "${azurerm_resource_group.main.name}"
    location = "${azurerm_resource_group.main.location}"
    account_tier = "Standard"
    account_replication_type = "LRS" 
	
		tags = {
		Project = "#{Proyecto}#"
		Requester = "#{Solicitante}#"
		DateCreated = "#{Fecha}#"
	}
}

resource "azurerm_app_service_plan" "main" {
	name = "dw-asp-#{Proyecto}#"
	location = "${azurerm_resource_group.main.location}"
	resource_group_name = "${azurerm_resource_group.main.name}"
	kind = "Linux"
	reserved = true
	
	sku {
		tier = "Free"
		size = "F1"
	}
	
	tags = {
		Project = "#{Proyecto}#"
		Requester = "#{Solicitante}#"
		DateCreated = "#{Fecha}#"
	}
}

resource "azurerm_app_service" "webappdev" {
	name = "dw-as-#{Proyecto}#-dev"
	location = "${azurerm_resource_group.main.location}"
	resource_group_name = "${azurerm_resource_group.main.name}"
	app_service_plan_id = "${azurerm_app_service_plan.main.id}"
	
	site_config {
		use_32_bit_worker_process = true
		dotnet_framework_version = "v4.0"
		scm_type = "LocalGit"
	}
	
	tags = {
		Project = "#{Proyecto}#"
		Requester = "#{Solicitante}#"
		DateCreated = "#{Fecha}#"
	}
}

resource "azurerm_app_service" "webappprd" {
	name = "dw-as-#{Proyecto}#-prd"
	location = "${azurerm_resource_group.main.location}"
	resource_group_name = "${azurerm_resource_group.main.name}"
	app_service_plan_id = "${azurerm_app_service_plan.main.id}"
	
	site_config {
		use_32_bit_worker_process = true
		dotnet_framework_version = "v4.0"
		scm_type = "LocalGit"
	}
	
	tags = {
		Project = "#{Proyecto}#"
		Requester = "#{Solicitante}#"
		DateCreated = "#{Fecha}#"
	}
}
