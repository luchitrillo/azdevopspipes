#TFM-LNX-2AS-1DB

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
	
	connection_string {
		name  = "Database"
		type  = "SQLServer"
		value = "Server=some-server.mydomain.com;Integrated Security=SSPI"
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

	connection_string {
		name  = "Database"
		type  = "SQLServer"
		value = "Server=some-server.mydomain.com;Integrated Security=SSPI"
	}
	
	tags = {
		Project = "#{Proyecto}#"
		Requester = "#{Solicitante}#"
		DateCreated = "#{Fecha}#"
	}
}

resource "azurerm_mysql_server" "main" {
	name = "terra-mysql-#{Proyecto}#"
	location = "${azurerm_resource_group.main.location}"
	resource_group_name = "${azurerm_resource_group.main.name}"
	version = "5.7"
	ssl_enforcement	= "Enabled"
	administrator_login = "mysqladmin"
	administrator_login_password = "#db@dm1n#"
		
	sku {
		name = "B_Gen5_2"
		capacity = 2
		tier = "Basic"
		family = "Gen5"
	}
	
	storage_profile {
		storage_mb = 5120
		backup_retention_days = 7
		geo_redundant_backup = "Disabled"
	}
	
	tags = {
		Project = "#{Proyecto}#"
		Requester = "#{Solicitante}#"
		DateCreated = "#{Fecha}#"
	}
}

resource "azurerm_mysql_configuration" "main" {
	name = "interactive_timeout"
	resource_group_name = "${azurerm_resource_group.main.name}"
	server_name = "${azurerm_mysql_server.main.name}"
	value = "600"
}
