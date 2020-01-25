resource "aws_iam_role" "custom-role" {
  name               = "custom-role"
  assume_role_policy = "${file("assume-role-policy.json")}"
}

resource "aws_iam_policy" "policy" {
  name        = "test-policy"
  description = "A test policy"
  policy      = "${file("policy-s3-bucket.json")}"
}

resource "aws_iam_policy_attachment" "test-attach" {
  name       = "test-attachment"
  roles      = ["${aws_iam_role.custom-role.name}"]
  policy_arn = "${aws_iam_policy.policy.arn}"
}