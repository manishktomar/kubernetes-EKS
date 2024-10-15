# Amazon EKS (Elastic Kubernetes Service) Cluster
To create an Amazon EKS (Elastic Kubernetes Service) Cluster using Terraform, you'll need to define and configure various AWS resources like the EKS Cluster itself, worker nodes, networking (VPC, subnets), and IAM roles/policies for the cluster and nodes.

### 1. Prerequisites
- AWS CLI and kubectl installed.
- Terraform installed on your system.
- A working AWS account with permissions to create EKS clusters, VPC, IAM roles, and EC2 instances.

### 2. High-Level Components
You will configure the following:
- VPC, subnets, and networking resources.
- EKS cluster and its IAM role.
- Worker nodes (EC2) and their IAM role.
- Node group configuration (managed or self-managed).
- Security groups for the cluster and nodes.
  
### 3. Terraform Code Structure
We’ll break down the Terraform code into:
- provider.tf: AWS provider configuration.
- vpc.tf: Networking resources (VPC, subnets, routes).
- eks.tf: EKS cluster creation.
- workers.tf: Worker node group configuration.
- outputs.tf: Output the necessary details like the cluster name and kubeconfig.

### 4. Configure kubectl for EKS
Once the cluster is created, you’ll need to configure kubectl to access your EKS cluster:
  ```
  aws eks --region us-west-2 update-kubeconfig --name my-eks-cluster
  ```
  
### 6. Verify the Cluster
Use kubectl to verify the cluster and nodes:
  ```
  kubectl get svc
  kubectl get nodes
  ```
