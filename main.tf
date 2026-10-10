resource "aws_bedrock_model_invocation_logging_configuration" "bedrock_model_invocation_logging_configurations" {
  for_each = var.bedrock_model_invocation_logging_configurations

  region = each.value.region

  dynamic "logging_config" {
    for_each = each.value.logging_config != null ? each.value.logging_config : []
    content {
      dynamic "cloudwatch_config" {
        for_each = logging_config.value.cloudwatch_config != null ? logging_config.value.cloudwatch_config : []
        content {
          dynamic "large_data_delivery_s3_config" {
            for_each = cloudwatch_config.value.large_data_delivery_s3_config != null ? cloudwatch_config.value.large_data_delivery_s3_config : []
            content {
              bucket_name = large_data_delivery_s3_config.value.bucket_name
              key_prefix  = large_data_delivery_s3_config.value.key_prefix
            }
          }
          log_group_name = cloudwatch_config.value.log_group_name
          role_arn       = cloudwatch_config.value.role_arn
        }
      }
      embedding_data_delivery_enabled = logging_config.value.embedding_data_delivery_enabled
      image_data_delivery_enabled     = logging_config.value.image_data_delivery_enabled
      dynamic "s3_config" {
        for_each = logging_config.value.s3_config != null ? logging_config.value.s3_config : []
        content {
          bucket_name = s3_config.value.bucket_name
          key_prefix  = s3_config.value.key_prefix
        }
      }
      text_data_delivery_enabled  = logging_config.value.text_data_delivery_enabled
      video_data_delivery_enabled = logging_config.value.video_data_delivery_enabled
    }
  }
}

