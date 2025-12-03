# Create Kinesis Data Stream
resource "aws_kinesis_stream" "datacenter_kinesis_stream" {
  name        = "datacenter-kinesis-stream"
  shard_count = 1

  shard_level_metrics = [
    "IncomingBytes",
    "IncomingRecords",
    "WriteProvisionedThroughputExceeded"
  ]
}

# SNS Topic for Alarm Notifications
resource "aws_sns_topic" "datacenter_kinesis_alerts" {
  name = "datacenter-kinesis-alerts"
}

# CloudWatch Alarm for WriteProvisionedThroughputExceeded
resource "aws_cloudwatch_metric_alarm" "datacenter_kinesis_alarm" {
  alarm_name          = "datacenter-kinesis-alarm"
  alarm_description   = "Triggered when kinesis write throughput exceeds provisioned limits"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = 1
  metric_name         = "WriteProvisionedThroughputExceeded"
  namespace           = "AWS/Kinesis"
  period              = 60
  statistic           = "Sum"
  threshold           = 1

  dimensions = {
    StreamName = aws_kinesis_stream.datacenter_kinesis_stream.name
  }

  alarm_actions = [
    aws_sns_topic.datacenter_kinesis_alerts.arn
  ]
}

output "kke_kinesis_stream_name"{
  value = aws_kinesis_stream.datacenter_kinesis_stream.name
}

output "kke_kinesis_alarm_name"{
  value = aws_cloudwatch_metric_alarm.datacenter_kinesis_alarm.alarm_name
}