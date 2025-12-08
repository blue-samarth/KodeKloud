resource "aws_sns_topic" "nautilus_sns_topic" {
  name = "nautilus-sns-topic"
}

resource "aws_sqs_queue" "nautilus_sqs_queue" {
  name = "nautilus-sqs-queue"
}

resource "aws_sqs_queue_policy" "nautilus_sqs_policy" {
  queue_url = aws_sqs_queue.nautilus_sqs_queue.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = {
          Service = "sns.amazonaws.com"
        }
        Action   = "sqs:SendMessage"
        Resource = aws_sqs_queue.nautilus_sqs_queue.arn
        Condition = {
          ArnEquals = {
            "aws:SourceArn" = aws_sns_topic.nautilus_sns_topic.arn
          }
        }
      }
    ]
  })
}

resource "aws_sns_topic_subscription" "nautilus_sns_sqs_subscription" {
  topic_arn = aws_sns_topic.nautilus_sns_topic.arn
  protocol  = "sqs"
  endpoint  = aws_sqs_queue.nautilus_sqs_queue.arn
}

output "kke_sns_topic_arn" {
  value = aws_sns_topic.nautilus_sns_topic.arn
}

output "kke_sqs_queue_url" {
  value = aws_sqs_queue.nautilus_sqs_queue.url
}