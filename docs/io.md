## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| attributes | Additional attributes (e.g. `1`). | `list(any)` | `[]` | no |
| enable\_rotation | Determines whether secret rotation is enabled | `bool` | `false` | no |
| enabled | Flag to control the vpc creation. | `bool` | `true` | no |
| environment | Environment (e.g. `prod`, `dev`, `staging`). | `string` | `""` | no |
| label\_order | Label order, e.g. `name`. | `list(any)` | <pre>[<br>  "name",<br>  "environment"<br>]</pre> | no |
| managedby | ManagedBy, eg 'CloudDrove' | `string` | `"hello@clouddrove.com"` | no |
| name | Name  (e.g. `app` or `cluster`). | `string` | `""` | no |
| recovery\_window\_in\_days | Specifies the number of days that AWS Secrets Manager waits before it can delete the secret. This value can be 0 to force deletion without recovery or range from 7 to 30 days. | `number` | `30` | no |
| replica | Configuration block to support secret replication | `map(any)` | `{}` | no |
| repository | Terraform current module repo | `string` | `"https://github.com/clouddrove/terraform-aws-secrets-manager"` | no |
| rotation\_lambda\_arn | Specifies the ARN of the Lambda function that can rotate the secret | `string` | `""` | no |
| rotation\_rules | A structure that defines the rotation configuration for this secret | `map(any)` | `{}` | no |
| secrets | List of secrets to keep in AWS Secrets Manager | `any` | `[]` | no |
| unmanaged | Terraform must ignore secrets lifecycle. Using this option you can initialize the secrets and rotate them outside Terraform, thus, avoiding other users to change or rotate the secrets by subsequent runs of Terraform | `bool` | `false` | no |

## Outputs

| Name | Description |
|------|-------------|
| secret\_arns | Secret arn list |
| secret\_ids | Secret id list |
| version\_id | The unique identifier of the version of the secret. |

