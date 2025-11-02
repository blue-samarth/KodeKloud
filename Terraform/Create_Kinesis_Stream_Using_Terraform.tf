resource "aws_kinesis_stream" "kinesis_stream_xfusion_stream" {
  name             = "xfusion-stream"
  shard_count      = 1
  retention_period = 24
}