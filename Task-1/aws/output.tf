output "app_public_ip" {
  value       = aws_instance.app.public_ip
  description = "Public IP of the App Machine"
}

output "tools_public_ip" {
  value       = aws_instance.tools.public_ip
  description = "Public IP of the Tools Machine"
}
