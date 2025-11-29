resource "aws_opensearch_domain" "opensearch_domain_nautilus" {
  domain_name    = "nautilus-es"
  engine_version = "OpenSearch_1.0"
}