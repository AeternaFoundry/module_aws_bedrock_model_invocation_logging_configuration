variable "bedrock_model_invocation_logging_configurations" {
  description = <<EOT
Map of bedrock_model_invocation_logging_configurations, attributes below
Optional:
    - region
    - logging_config (block):
        - cloudwatch_config (optional, block):
            - large_data_delivery_s3_config (optional, block):
                - bucket_name (required)
                - key_prefix (optional)
            - log_group_name (required)
            - role_arn (required)
        - embedding_data_delivery_enabled (optional)
        - image_data_delivery_enabled (optional)
        - s3_config (optional, block):
            - bucket_name (required)
            - key_prefix (optional)
        - text_data_delivery_enabled (optional)
        - video_data_delivery_enabled (optional)
EOT

  type = map(object({
    region = optional(string)
    logging_config = optional(list(object({
      cloudwatch_config = optional(list(object({
        large_data_delivery_s3_config = optional(list(object({
          bucket_name = string
          key_prefix  = optional(string)
        })))
        log_group_name = string
        role_arn       = string
      })))
      embedding_data_delivery_enabled = optional(bool)
      image_data_delivery_enabled     = optional(bool)
      s3_config = optional(list(object({
        bucket_name = string
        key_prefix  = optional(string)
      })))
      text_data_delivery_enabled  = optional(bool)
      video_data_delivery_enabled = optional(bool)
    })))
  }))
}

