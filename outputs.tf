output "bedrock_model_invocation_logging_configurations_id" {
  description = "Map of id values across all bedrock_model_invocation_logging_configurations, keyed the same as var.bedrock_model_invocation_logging_configurations"
  value       = { for k, v in aws_bedrock_model_invocation_logging_configuration.bedrock_model_invocation_logging_configurations : k => v.id if v.id != null && length(v.id) > 0 }
}
output "bedrock_model_invocation_logging_configurations_logging_config" {
  description = "Map of logging_config values across all bedrock_model_invocation_logging_configurations, keyed the same as var.bedrock_model_invocation_logging_configurations"
  value       = { for k, v in aws_bedrock_model_invocation_logging_configuration.bedrock_model_invocation_logging_configurations : k => v.logging_config if v.logging_config != null && length(v.logging_config) > 0 }
}
output "bedrock_model_invocation_logging_configurations_region" {
  description = "Map of region values across all bedrock_model_invocation_logging_configurations, keyed the same as var.bedrock_model_invocation_logging_configurations"
  value       = { for k, v in aws_bedrock_model_invocation_logging_configuration.bedrock_model_invocation_logging_configurations : k => v.region if v.region != null && length(v.region) > 0 }
}

