# # # Terraform Putput Values
# # # Links: https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_instance#attributes-reference
# # #ATTRIBUTES
# # # https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_instance#attributes-reference

# # output "vm_instanceid" {
# #     description = "VM Instance ID"
# #     value = google_compute_instance.myapp1.instance_id #instance_id comes from attribute section of terraform docs
# # }

# # output "vm_external_ip" {
# #     description = "VM external IP"
# #     value = google_compute_instance.myapp1.network_interface.0.access_config.0.nat_ip
# # }

# # #ARGUMENTS
# # output "vm_machine_type" {
# #     description = "VM Machine type"
# #     value = oogle_compute_instance.myapp1.machine_type
# # }

# # Terraform Output Values
# ## ATTRIBUTES
# output "vm_instanceid" {
#   description = "VM Instance ID"
#   value = google_compute_instance.myapp1.instance_id
# }

# output "vm_selflink" {
#   description = "VM Instance Self link"
#   value = google_compute_instance.myapp1.self_link
# }

# output "vm_id" {
#   description = "VM ID"
#   value = google_compute_instance.myapp1.id
# }

# output "vm_external_ip" {
#   description = "VM External IPs"
#   value = google_compute_instance.myapp1.network_interface.0.access_config.0.nat_ip
# }

# ## ARGUMENTS
# output "vm_name" {
#   description = "VM Name"
#   value = google_compute_instance.myapp1.name
# }

# output "vm_machine_type" {
#   description = "VM Machine Type"
#   value = google_compute_instance.myapp1.machine_type
# }

#for count parameter

output "vm_name_0" {
  description = "VM Name"
  value = google_compute_instance.myapp1[0].name
}

output "vm_name_1" {
  description = "VM Name"
  value = google_compute_instance.myapp1[1].name
}

# Terraform Output Values
/* Concepts Covered
1. For Loop with List
2. For Loop with Map
3. For Loop with Map Advanced
4. Legacy Splat Operator (latest) - Returns List
5. Latest Generalized Splat Operator - Returns the List
*/

# output - For Loop with list
output "for_output_list" {
  description = "For Loop with List"
  value = [ for instance in google_compute_instance.myapp1: instance.name]
}

# output - For Loop with map item
output "for_output_map1" {
  description = "For Loop with Map"
  value = {for instance in google_compute_instance.myapp1: instance.name => instance.instance_id }
}

# output - For Loop with map advanced
output "for_output_map2" {
  description = "For Loop with Map-advanced"
  value = {for c, instance in google_compute_instance.myapp1: c => instance.instance_id } # for c count. we can use a also
}

# output - For Loop with map advanced
output "for_output_map3" {
  description = "For Loop with Map-advanced"
  value = {for c, instance in google_compute_instance.myapp1: instance.name => instance.instance_id } #putting c won't impact so we can keep it that is what we wrote this block
}

#Legacy Splat Operator (latest) - Returns List
output "legacy_splat_instance" {
  description = "Legacy Splat Operator"
  value = google_compute_instance.myapp1.*.name
}


#Latest Generalized Splat Operator - Returns the List
output "latest_splat_instance" {
  description = "Latest Generalized Splat Operator"
  value = google_compute_instance.myapp1[*].name
}