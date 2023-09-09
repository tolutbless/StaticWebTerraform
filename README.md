# Example on Static Websites with Azure / Terraform


## Terraform Codestyle

use "this" as identifier for ressources, set the name in the attribute



## Terraform Statefiles

never use git to store the TF state

## Implicit Dependencies

use this style to set dependencies:

´´´
resource_group_name      = azurerm_resource_group.this.name
´´´

and never this:
´´´
resource_group_name      = var.resource_group-name
´´´


