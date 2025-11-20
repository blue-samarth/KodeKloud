resource "aws_iam_group" "this" {
  name = "iamgroup_anita"
}

resource "null_resource" "deleting_iam_group_anita" {
  provisioner "local-exec" {
    command = "aws iam delete-group --group-name ${aws_iam_group.this.name}"
  }
}