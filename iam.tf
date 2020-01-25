resource "aws_iam_role" "role" {
  name = "test-role"

  assume_role_policy = <<EOF
    {
      "Version": "2012-10-17",
      "Statement": [
        {
          "Action": "sts:AssumeRole",
          "Principal": {
            "Service": "ec2.amazonaws.com"
          },
          "Effect": "Allow",
          "Sid": ""
        }
      ]
    }
EOF
}

resource "aws_iam_policy" "policy" {
    name        = "test-policy"
    description = "A test policy"

    policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "s3:PutAnalyticsConfiguration",
        "Resource": "arn:aws:s3:::buckewtdf"

        "Effect": "Allow",
        "Action": [
        "s3:GetAccessPoint",
        "Resource": "arn:aws:s3:::buckewtdf"
    }
  ]
}
EOF
}

resource "aws_iam_role_policy_attachment" "test-attach" {
  role       = "${aws_iam_role.role.name}"
  policy_arn = "${aws_iam_policy.policy.arn}"
}
