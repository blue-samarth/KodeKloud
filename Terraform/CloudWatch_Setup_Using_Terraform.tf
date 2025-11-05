resource "aws_cloudwatch_log_group" "cloudwatch_log_group_nautilus" {
    name              = "nautilus-log-group"

    tags = {
        Name        = "nautilus-log-group"
        Environment = "Production"
        Application = "Nautilus"
        Owner       = "DevOpsTeam"
    }
}

resource "aws_cloudwatch_log_stream" "cloudwatch_log_stream_nautilus" {
  name = "nautilus-log-stream"
  log_group_name = aws_cloudwatch_log_group.cloudwatch_log_group_nautilus.name
}