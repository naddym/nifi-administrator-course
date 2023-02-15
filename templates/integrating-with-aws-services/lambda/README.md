Download the template and upload into NiFi instance

### Configuring Processors

***GenerateFlowFile*** 

Configuring `GenerateFlowFile` processor is simple. Just copy below data to `Custom Text` property of GenerateFlowFile Processor

```json
{
  "key1": "awesome",
  "key2": "apache",
  "key3": "nifi"
}
```

***PutLambda***

| Name | Value |
| ---- | ----- |
| Amazon Lambda Name | `arn:aws:lambda:us-east-1:5123397174287111:function:nifi-test-hello-world` |
| Region | `US East (N. Virginia)` |
| Access Key ID | `provide the access key id` |
| Secret Access Key | `provide the secret access key` |