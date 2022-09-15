resource "aws_instance" "test_instance" {
  ami           = "ami-05fa00d4c63e32376"
  instance_type = "t2.micro"

 tags = {
    Name = "test-instance"
  }
}